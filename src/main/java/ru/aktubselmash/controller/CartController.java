package ru.aktubselmash.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.aktubselmash.model.*;
import ru.aktubselmash.model.constant.PartyType;
import ru.aktubselmash.model.util.AddToCartResult;
import ru.aktubselmash.model.util.PriceResult;
import ru.aktubselmash.service.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.EnumSet;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Yury Oparin
 * Date: 02.07.11
 * Time: 12:25
 * Version: ${VERSION}
 */
@Controller
public class CartController extends BasicController {
    private static final Log logger = LogFactory.getLog(CartController.class);

    protected ShippingPaymentService shippingPaymentService;
    protected ShippingService shippingService;
    protected PaymentService paymentService;
    protected CartService cartService;
    protected EmailService emailService;

    @RequestMapping("/cart")
    public String view(@ModelAttribute Cart cart, Model model, @ModelAttribute("country") Boolean isForeignCountry) {
        List<ShippingPayment> list = shippingPaymentService.findAll();
        if (cart.getShipping() == null) {
            cart.setShipping(list.get(2).getShipping()); // Почтой EMS
            cart.setPayment(list.get(2).getPayment());   // Наложенным платежом
        }
        model.addAttribute("shippingPayments", list);

        for (CartProductPrice cpp : cart.getCartProducts()) {
            ProductPrice pp = productPriceService.findByShipping(cpp.getProduct(), cart.getShipping());

            if (isForeignCountry)
                cpp.setPrice(pp.getDiscountDueDate() != null && pp.getDiscountDueDate().after(new Date()) ?
                        pp.getForeignPrice() - pp.getForeignDiscount() :
                        pp.getForeignPrice());
            else
                cpp.setPrice(pp.getDiscountDueDate() != null && pp.getDiscountDueDate().after(new Date()) ?
                    pp.getPrice() - pp.getDiscount() :
                    pp.getPrice());
        }
        model.addAttribute("partyTypes", PartyType.values());

        if (cart.getClient() == null) {
            cart.setClient(new Party());
            cart.getClient().setType(PartyType.INDIVIDUAL);
        }
        return "cart";
    }

    @RequestMapping(value = "/cart/complete")
    public String complete(@ModelAttribute Cart cart, Model model, HttpSession session, @ModelAttribute("country") Boolean isForeignCountry) {
        if (cart.getCartProducts().isEmpty() || cart.getCartProducts().get(0).getProduct() == null ||
            cart.getClient() == null || cart.getClient().getFio() == null || cart.getClient().getFio().length() == 0)
        {
            cart.setShipping(null);
            cart.setPayment(null);
            cart.getCartProducts().clear();
            return view(cart, model, isForeignCountry);
        }

        cart.setShipping(shippingService.findById(cart.getShipping().getId()));
        cart.setPayment(paymentService.findById(cart.getPayment().getId()));
        try {
            Cart c = cartService.persist(cart);
            emailService.sendOrderEmail(cart);
            if (cart.getClient().getEmail() != null && cart.getClient().getEmail().length() > 0)
                emailService.sendConformationEmail(cart);
            model.addAttribute("basket", c);
        } catch (Exception e) {
            logger.error(e);
            model.addAttribute("exception", true);
            model.addAttribute("exceptionMessage", e.getMessage());
        }
        session.setAttribute("cart", new Cart());
        model.asMap().put("cart", new Cart());
        return "cart-complete";
    }

    @RequestMapping("/cart/addProduct")
    public @ResponseBody
    AddToCartResult addProduct(@RequestParam Integer productId, @ModelAttribute Cart cart,
                                            @ModelAttribute("productPrices") List<ProductPrice> productPrices) {
        return addItemToCart(productId, cart, productPrices);
    }

    @RequestMapping("/cart/addPart")
    public @ResponseBody
    AddToCartResult addPart(@RequestParam Integer productId, @ModelAttribute Cart cart,
                                            @ModelAttribute("partPrices") List<ProductPrice> partPrices) {
        return addItemToCart(productId, cart, partPrices);
    }

    @RequestMapping("/cart/removeProduct")
    public @ResponseBody
    AddToCartResult removeProduct(@RequestParam Integer productId, @ModelAttribute Cart cart) {
        int index = 0;
        for (CartProductPrice cpp : cart.getCartProducts()) {
            if (cpp.getProduct().getId().equals(productId)) {
                cart.setTotalNumber(cart.getTotalNumber() - cpp.getNumber());
                break;
            }
            index++;
        }
        AddToCartResult result = new AddToCartResult();
        result.success = cart.getCartProducts().isEmpty() || cart.getCartProducts().remove(index) != null;
        result.size = cart.getTotalNumber();
        return result;
    }

    @RequestMapping("/cart/updatePrices")
    public @ResponseBody
    List<PriceResult> updatePrices(@RequestParam Integer shippingId, @ModelAttribute Cart cart,
                                   @ModelAttribute("country") Boolean isForeignCountry) {
        List<PriceResult> result = new ArrayList<PriceResult>();

        for (CartProductPrice cpp : cart.getCartProducts()) {
            ProductPrice pp = productPriceService.findByShipping(cpp.getProduct(), shippingService.findById(shippingId));
            if (isForeignCountry)
                cpp.setPrice(pp.getDiscountDueDate() != null && pp.getDiscountDueDate().after(new Date()) ?
                        pp.getForeignPrice() - pp.getForeignDiscount() :
                        pp.getForeignPrice());
            else
                cpp.setPrice(pp.getDiscountDueDate() != null && pp.getDiscountDueDate().after(new Date()) ?
                    pp.getPrice() - pp.getDiscount() :
                    pp.getPrice());
            PriceResult pr = new PriceResult();
            pr.price = cpp.getPrice();
            pr.productId = cpp.getProduct().getId();
            result.add(pr);
        }
        return result;
    }


    private AddToCartResult addItemToCart(Integer itemId, Cart cart, List<ProductPrice> productPrices) {
        Product p = null;
        for (ProductPrice pp : productPrices) {
            if (pp.getProduct().getId().equals(itemId)) {
                p = pp.getProduct();
                break;
            }
        }
        if (p != null) {
            boolean exist = false;
            for (CartProductPrice cartProductPrice : cart.getCartProducts()) {
                if (cartProductPrice.getProduct().getId().equals(p.getId())) {
                    cartProductPrice.setNumber(cartProductPrice.getNumber() + 1);
                    exist = true;
                }
            }
            if (!exist) {
                CartProductPrice cpp = new CartProductPrice();
                cpp.setCart(cart);
                cpp.setProduct(p);
                cpp.setNumber(1);
                cart.getCartProducts().add(cpp);
            }
            cart.setTotalNumber(cart.getTotalNumber() == null ? 1 : cart.getTotalNumber() + 1);
        }

        AddToCartResult result = new AddToCartResult();
        result.size = cart.getTotalNumber();
        result.success = p != null;
        return result;
    }

    public void setShippingPaymentService(ShippingPaymentService shippingPaymentService) {
        this.shippingPaymentService = shippingPaymentService;
    }

    public void setShippingService(ShippingService shippingService) {
        this.shippingService = shippingService;
    }

    public void setPaymentService(PaymentService paymentService) {
        this.paymentService = paymentService;
    }

    public void setCartService(CartService cartService) {
        this.cartService = cartService;
    }

    public void setEmailService(EmailService emailService) {
        this.emailService = emailService;
    }
}

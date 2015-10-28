package ru.aktubselmash.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import ru.aktubselmash.model.Cart;
import ru.aktubselmash.model.ProductPrice;
import ru.aktubselmash.service.ProductPriceService;
import ru.aktubselmash.service.ProductService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by IntelliJ IDEA.
 * User: Yury Oparin
 * Date: 03.07.11
 * Time: 12:52
 * Version: ${VERSION}
 */
@SessionAttributes({"cart", "productMinPrice", "partMinPrice", "thirdPrice", "productPrices", "partPrices"})
//@SessionAttributes({"cart", "productMinPrice", "partMinPrice", "thirdPrice", "productPrices"})
public class BasicController {
    private static final Logger logger = LoggerFactory.getLogger(BasicController.class);

    private final Pattern firefoxPattern = Pattern.compile("firefox/(\\d+)");
    private final Pattern msiePattern = Pattern.compile("msie (\\d+)");
    private final Pattern chromePattern = Pattern.compile("chrome/(\\d+)");
    private final Pattern safariPattern = Pattern.compile("version/(\\d+).* safari");
    private final Pattern operaPattern = Pattern.compile("opera.* version/(\\d+)");
    private final Pattern iosPattern = Pattern.compile("(?:ipad|iphone)");

    protected ProductService productService;
    protected ProductPriceService productPriceService;

    @ModelAttribute("browserClass")
    public String browserClass(HttpServletRequest request) {
        String browserType = request.getHeader("User-Agent");

        if (browserType != null) {
            browserType = browserType.toLowerCase();

            Matcher m = msiePattern.matcher(browserType);
            if (m.find()) return "ie ie" + m.group(1);

            m = firefoxPattern.matcher(browserType);
            if (m.find()) return "firefox ff" + m.group(1);

            m = chromePattern.matcher(browserType);
            if (m.find()) return "chrome chrome" + m.group(1);

            m = safariPattern.matcher(browserType);
            if (m.find()) {
                String r = "safari safari" + m.group(1);
                if (iosPattern.matcher(browserType).find()) r += " ios";
                return r;
            }

            m = operaPattern.matcher(browserType);
            if (m.find()) return "opera o" + m.group(1);
        }

        return "";
    }

    @ModelAttribute("country")
    public Boolean countryForeign(HttpServletRequest request) {
        Enumeration locales = request.getLocales();

        while (locales.hasMoreElements()) {
            Locale l = (Locale) locales.nextElement();
            if (l.getCountry().equals("RU") || l.getLanguage().equals("ru")) return false;
        }

        while (locales.hasMoreElements()) {
            Locale l = (Locale) locales.nextElement();
            if (l.getCountry().equals("CH")) return true;
        }

        return false;
    }


    @ModelAttribute("productPrices")
    public List<ProductPrice> findProducts(HttpSession session) {
//        logger.info("!!! @ModelAttribute(\"productPrices\") has begun");
        if (session.getAttribute("productPrices") == null) {
            session.setAttribute("productPrices", productPriceService.findWithMinPrice(false));
//            logger.info("!!! @ModelAttribute(\"productPrices\")" + ((List<ProductPrice>) session.getAttribute("productPrices")));
        }
        return (List<ProductPrice>) session.getAttribute("productPrices");
    }

    @ModelAttribute("partPrices")
    public List<ProductPrice> findParts(HttpSession session) {
        if (session.getAttribute("partPrices") == null)
            session.setAttribute("partPrices", productPriceService.findWithMinPrice(true));
        return (List<ProductPrice>) session.getAttribute("partPrices");
    }

    @ModelAttribute("productMinPrice")
    public Integer productMinPrice(@ModelAttribute("productPrices") List<ProductPrice> productPrices,
                                   HttpSession session, @ModelAttribute("country") Boolean isForeignCountry) {
        if (session.getAttribute("productMinPrice") == null) {
            int productMinPrice = 0;
            Date now = new Date();

            boolean first = true;
            for (ProductPrice pp : productPrices) {
                int price = isForeignCountry ?
                        (pp.getDiscountDueDate() != null && pp.getForeignDiscount() != null && now.before(pp.getDiscountDueDate())
                                ? pp.getForeignPrice() - pp.getForeignDiscount() : pp.getForeignPrice()) :
                        (pp.getDiscountDueDate() != null && pp.getDiscount() != null && now.before(pp.getDiscountDueDate())
                                ? pp.getPrice() - pp.getDiscount() : pp.getPrice());
                if (first) {
                    productMinPrice = price;
                    first = false;
                } else productMinPrice = Math.min(productMinPrice, price);
            }
            session.setAttribute("productMinPrice", productMinPrice);
        }
        return (Integer) session.getAttribute("productMinPrice");
    }

    @ModelAttribute("partMinPrice")
    public Integer partMinPrice(@ModelAttribute("partPrices") List<ProductPrice> partPrices,
                                HttpSession session, @ModelAttribute("country") Boolean isForeignCountry) {
        if (session.getAttribute("partMinPrice") == null) {
            int partMinPrice = 0;
            Date now = new Date();

            boolean first = true;
            for (ProductPrice pp : partPrices) {
                int price = isForeignCountry ?
                        (pp.getDiscountDueDate() != null && pp.getForeignDiscount() != null && now.before(pp.getDiscountDueDate())
                                ? pp.getForeignPrice() - pp.getForeignDiscount() : pp.getForeignPrice()) :
                        (pp.getDiscountDueDate() != null && pp.getDiscount() != null && now.before(pp.getDiscountDueDate())
                                ? pp.getPrice() - pp.getDiscount() : pp.getPrice());
                if (first) {
                    partMinPrice = price;
                    first = false;
                } else partMinPrice = Math.min(partMinPrice, price);
            }
            session.setAttribute("partMinPrice", partMinPrice);
        }
        return (Integer) session.getAttribute("partMinPrice");
    }

    @ModelAttribute("thirdPrice")
    public Integer thirdPrice(@ModelAttribute("partPrices") List<ProductPrice> partPrices,
                              HttpSession session, @ModelAttribute("country") Boolean isForeignCountry) {
        if (session.getAttribute("thirdPrice") == null) {
            Date now = new Date();

            for (ProductPrice pp : partPrices) {
                if ("ta-1".equals(pp.getProduct().getShortName())) {
                    session.setAttribute("thirdPrice", isForeignCountry ?
                            (pp.getDiscountDueDate() != null && pp.getForeignDiscount() != null && now.before(pp.getDiscountDueDate())
                                    ? pp.getForeignPrice() - pp.getForeignDiscount() : pp.getForeignPrice()) :
                            (pp.getDiscountDueDate() != null && pp.getDiscount() != null && now.before(pp.getDiscountDueDate())
                                    ? pp.getPrice() - pp.getDiscount() : pp.getPrice()));
                }
            }
        }
        return (Integer) session.getAttribute("thirdPrice");
    }

    @ModelAttribute("cart")
    public Cart createCart(HttpSession session) {
        if (session.getAttribute("cart") == null)
            session.setAttribute("cart", new Cart());
        return (Cart) session.getAttribute("cart");
    }

    public void setProductService(ProductService productService) {
        this.productService = productService;
    }

    public void setProductPriceService(ProductPriceService productPriceService) {
        this.productPriceService = productPriceService;
    }
}

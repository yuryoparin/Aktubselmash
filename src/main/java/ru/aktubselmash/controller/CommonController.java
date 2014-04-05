package ru.aktubselmash.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import ru.aktubselmash.model.ProductPrice;

import java.util.List;


/**
 * Created by IntelliJ IDEA.
 * User: Yury Oparin
 * Date: 02.07.11
 * Time: 12:28
 * Version: ${VERSION}
 */

@Controller
public class CommonController extends BasicController {
    private final Log logger = LogFactory.getLog(CommonController.class);

    private final String homeProductShortName;

    public CommonController(String homeProductShortName) {
        this.homeProductShortName = homeProductShortName;
    }

    @RequestMapping("index.html")
    public String indexHtml(Model model, @ModelAttribute("productPrices") List<ProductPrice> productPrices) {
        return home(model, productPrices);
    }

    @RequestMapping("/home")
    public String home(Model model, @ModelAttribute("productPrices") List<ProductPrice> productPrices) {
        for (ProductPrice pp : productPrices) {
            if (homeProductShortName.equals(pp.getProduct().getShortName())) {
                model.addAttribute("homeProductPrice", pp);
                break;
            }
        }
        model.addAttribute("isHome", Boolean.TRUE);
        return "home";
    }

    @RequestMapping("/clippers")
    public String clippers(Model model) {
        return "clippers";
    }

    @RequestMapping("/parts")
    public String parts(Model model) {
        return "parts";
    }

    @RequestMapping("/appeal")
    public String appeal(Model model) {
        return "appeal";
    }

    @RequestMapping("/payment")
    public String payment() {
        return "payment";
    }

    @RequestMapping("/shipping")
    public String shipping() {
        return "shipping";
    }

    @RequestMapping("/contacts")
    public String contacts() {
        return "contacts";
    }
}

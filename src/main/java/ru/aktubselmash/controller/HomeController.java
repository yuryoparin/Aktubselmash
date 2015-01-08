package ru.aktubselmash.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
public class HomeController extends BasicController {
    private final Logger logger = LoggerFactory.getLogger(HomeController.class);

    private final String homeProductShortName;

    public HomeController(String homeProductShortName) {
        this.homeProductShortName = homeProductShortName;
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
    public String clippers() {
        return "clippers";
    }

    @RequestMapping("/parts")
    public String parts() {
        return "parts";
    }

    @RequestMapping("/appeal")
    public String appeal() {
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

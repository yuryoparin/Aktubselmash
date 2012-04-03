package ru.aktubselmash.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.aktubselmash.model.Product;
import ru.aktubselmash.model.ProductPrice;
import ru.aktubselmash.service.ProductPriceService;
import ru.aktubselmash.service.ProductRelationService;
import ru.aktubselmash.util.ResourceNotFoundException;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Yury Oparin
 * Date: 02.07.11
 * Time: 12:26
 * Version: ${VERSION}
 */

@Controller
@RequestMapping("/parts/{part}")
public class SparePartsController extends BasicController {

    protected ProductRelationService productRelationService;

    @RequestMapping(method = RequestMethod.GET)
    public String view(@PathVariable String part, Model model,
                       @ModelAttribute("productPrices") List<ProductPrice> productPrices,
                       @ModelAttribute("partPrices") List<ProductPrice> partPrices) {
        ProductPrice productPrice = null;
        for (ProductPrice pp : partPrices) {
            if (pp.getProduct().getShortName().equals(part)) { productPrice = pp; break; }
        }
        if (productPrice == null) throw new ResourceNotFoundException();

        List<ProductPrice> dependantPrices = new ArrayList<ProductPrice>();
        boolean foundInProducts = false;
        for (Product dp : productRelationService.findDependants(productPrice.getProduct())) {
            for (ProductPrice pp : productPrices) {
                if (pp.getProduct().getId().equals(dp.getId())) {
                    dependantPrices.add(pp);
                    foundInProducts = true;
                    break;
                }
            }
            if (!foundInProducts) {
                for (ProductPrice pp : partPrices) {
                    if (pp.getProduct().getId().equals(dp.getId())) {
                        dependantPrices.add(pp);
                        break;
                    }
                }
            }
            foundInProducts = false;
        }
        model.addAttribute("dependantPrices", dependantPrices);
        model.addAttribute("productPrice", productPrice);
        return "parts/" + part;
    }

    public void setProductRelationService(ProductRelationService productRelationService) {
        this.productRelationService = productRelationService;
    }
}

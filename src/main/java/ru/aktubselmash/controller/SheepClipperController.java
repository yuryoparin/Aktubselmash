package ru.aktubselmash.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.aktubselmash.model.Product;
import ru.aktubselmash.model.ProductPrice;
import ru.aktubselmash.service.ProductPriceService;
import ru.aktubselmash.service.ProductRelationService;
import ru.aktubselmash.service.ProductService;
import ru.aktubselmash.util.ResourceNotFoundException;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Yury Oparin
 * Date: 02.07.11
 * Time: 12:25
 * Version: ${VERSION}
 */

@Controller
@RequestMapping("/clippers/{clipper}")
public class SheepClipperController extends BasicController {

    protected ProductRelationService productRelationService;

    @RequestMapping(method = RequestMethod.GET)
    public String view(@PathVariable String clipper, Model model,
                       @ModelAttribute("productPrices") List<ProductPrice> productPrices,
                       @ModelAttribute("partPrices") List<ProductPrice> partPrices) {
        ProductPrice productPrice = null;
        for (ProductPrice pp : productPrices) {
            if (pp.getProduct().getShortName().equals(clipper)) { productPrice = pp; break; }
        }
        if (productPrice == null) throw new ResourceNotFoundException();

        List<ProductPrice> dependantPrices = new ArrayList<ProductPrice>();
        boolean foundInParts = false;
        for (Product dp : productRelationService.findDependants(productPrice.getProduct())) {
            for (ProductPrice pp : partPrices) {
                if (pp.getProduct().getId().equals(dp.getId())) {
                    dependantPrices.add(pp);
                    foundInParts = true;
                    break;
                }
            }
            if (!foundInParts) {
                for (ProductPrice pp : productPrices) {
                    if (pp.getProduct().getId().equals(dp.getId())) {
                        dependantPrices.add(pp);
                        break;
                    }
                }
            }
            foundInParts = false;
        }
        model.addAttribute("dependantPrices", dependantPrices);
        model.addAttribute("productPrice", productPrice);
        return "clippers/" + clipper;
    }

    public void setProductRelationService(ProductRelationService productRelationService) {
        this.productRelationService = productRelationService;
    }
}

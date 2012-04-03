package ru.aktubselmash.service;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import ru.aktubselmash.model.Product;
import ru.aktubselmash.model.ProductPrice;
import ru.aktubselmash.model.Shipping;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Yury
 * Date: 09.10.11
 * Time: 20:32
 * To change this template use File | Settings | File Templates.
 */
public class ProductPriceService {
    private static final Log logger = LogFactory.getLog(ProductService.class);

    @PersistenceContext
    private EntityManager em;

    public ProductPrice findWithMinPrice(Product product) {
        TypedQuery<ProductPrice> q = em.createQuery(
                "select pp from ProductPrice pp where pp.product = :product order by pp.price", ProductPrice.class);
        q.setParameter("product", product);
        return q.setMaxResults(1).getSingleResult();
    }

    public List<ProductPrice> findWithMinPrice(boolean partsFlag) {
        TypedQuery<ProductPrice> q = em.createQuery(
                "select pp from ProductPrice pp" +
                " where pp.product.partsFlag = :partsFlag and pp.product.menuFlag = :menu_f" +
                  " and pp.shipping.id = 1 and pp.product.seqNumber > 0" +
                " order by pp.product.seqNumber", ProductPrice.class);
        q.setParameter("partsFlag", partsFlag);
        q.setParameter("menu_f", Boolean.TRUE);
        return q.getResultList();
    }

    public ProductPrice findByShipping(Product product, Shipping shipping) {
        TypedQuery<ProductPrice> q = em.createQuery(
                "select pp from ProductPrice pp" +
                " where pp.product = :product and pp.shipping = :shipping", ProductPrice.class);
        q.setParameter("product", product);
        q.setParameter("shipping", shipping);
        return q.setMaxResults(1).getSingleResult();
    }
}

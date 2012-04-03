package ru.aktubselmash.service;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import ru.aktubselmash.model.Product;
import ru.aktubselmash.model.ProductPrice;
import ru.aktubselmash.model.ProductRelation;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Yury
 * Date: 20.10.11
 * Time: 17:49
 * To change this template use File | Settings | File Templates.
 */
public class ProductRelationService {
    private static final Log logger = LogFactory.getLog(ProductService.class);

    @PersistenceContext
    private EntityManager em;

    public List<Product> findDependants(Product owner) {
        TypedQuery<Product> q = em.createQuery(
                "select pr.dependant from ProductRelation pr" +
                " where pr.owner = :owner and pr.seqNumber > 0" +
                " order by pr.seqNumber", Product.class);
        q.setParameter("owner", owner);
        return q.getResultList();
    }
}

package ru.aktubselmash.service;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.transaction.annotation.Transactional;
import ru.aktubselmash.model.Product;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Yury Oparin
 * Date: 03.07.11
 * Time: 13:18
 * Version: ${VERSION}
 */

public class ProductService {
    private static final Log logger = LogFactory.getLog(ProductService.class);

    @PersistenceContext
    private EntityManager em;


    public Product findByShortName(String shortName) {
        TypedQuery<Product> q = em.createQuery(
                "select p from Product p where p.shortName = :short_nm", Product.class);
        q.setParameter("short_nm", shortName);
        return q.getSingleResult();
    }

    public List<Product> findByPartsFlag(boolean partsFlag) {
        TypedQuery<Product> q = em.createQuery(
                "select p from Product p where p.partsFlag = :flag and p.seqNumber > 0 order by p.seqNumber", Product.class);
        q.setParameter("flag", partsFlag);
        return q.getResultList();
    }

    public List<Product> findForMenuByPartsFlag(boolean partsFlag) {
        TypedQuery<Product> q = em.createQuery(
                "select p from Product p where p.partsFlag = :flag and p.menuFlag = :menu_f and p.seqNumber > 0 order by p.seqNumber", Product.class);
        q.setParameter("flag", partsFlag);
        q.setParameter("menu_f", Boolean.TRUE);
        return q.getResultList();
    }



    public List<Product> findAll() {
        return em.createQuery("select p from Product p", Product.class).getResultList();
    }
}

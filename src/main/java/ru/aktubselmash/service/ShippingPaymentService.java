package ru.aktubselmash.service;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import ru.aktubselmash.model.Product;
import ru.aktubselmash.model.ShippingPayment;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Yury
 * Date: 28.10.11
 * Time: 17:25
 * To change this template use File | Settings | File Templates.
 */
public class ShippingPaymentService {
    private static final Log logger = LogFactory.getLog(ProductService.class);

    @PersistenceContext
    private EntityManager em;

    public List<ShippingPayment> findAll() {
        TypedQuery<ShippingPayment> q = em.createQuery(
                "select sp from ShippingPayment sp" +
                " order by sp.shipping.id, sp.payment.id", ShippingPayment.class);
        return q.getResultList();
    }
}

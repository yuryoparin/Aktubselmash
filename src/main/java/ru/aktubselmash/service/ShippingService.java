package ru.aktubselmash.service;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import ru.aktubselmash.model.Shipping;
import ru.aktubselmash.model.ShippingPayment;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Yury
 * Date: 01.11.11
 * Time: 17:52
 * To change this template use File | Settings | File Templates.
 */
public class ShippingService {
    private static final Log logger = LogFactory.getLog(ShippingService.class);

    @PersistenceContext
    private EntityManager em;

    public Shipping findById(Integer shippingId) {
        return
             em.createQuery(
                "select s from Shipping s" +
                " where s.id = :shippingId", Shipping.class)
            .setParameter("shippingId", shippingId)
            .getSingleResult();
    }
}

package ru.aktubselmash.service;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import ru.aktubselmash.model.Payment;
import ru.aktubselmash.model.Shipping;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 * Created by IntelliJ IDEA.
 * User: Yury
 * Date: 01.11.11
 * Time: 22:25
 * To change this template use File | Settings | File Templates.
 */
public class PaymentService {
    private static final Log logger = LogFactory.getLog(PaymentService.class);

    @PersistenceContext
    private EntityManager em;

    public Payment findById(Integer paymentId) {
        return
             em.createQuery(
                "select p from Payment p" +
                " where p.id = :paymentId", Payment.class)
            .setParameter("paymentId", paymentId)
            .getSingleResult();
    }

}

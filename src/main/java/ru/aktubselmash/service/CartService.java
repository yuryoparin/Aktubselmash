package ru.aktubselmash.service;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import ru.aktubselmash.model.Address;
import ru.aktubselmash.model.Cart;
import ru.aktubselmash.model.Product;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import java.util.Date;

/**
 * Created by IntelliJ IDEA.
 * User: Yury
 * Date: 10.11.11
 * Time: 18:23
 * To change this template use File | Settings | File Templates.
 */
@Transactional
public class CartService {
    private static final Log logger = LogFactory.getLog(CartService.class);

    @PersistenceContext
    private EntityManager em;

    @Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = false)
    public Cart persist(Cart cart) {
        cart.setOrderDate(new Date());
        em.persist(cart);
        em.flush();
        return em.merge(cart);
    }
}

package ru.aktubselmash.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Yury Oparin
 * Date: 02.07.11
 * Time: 23:31
 * Version: ${VERSION}
 */
@Entity
@Table(name = "orders")
public class Cart implements Serializable {
    @Id
    @SequenceGenerator(name = "order_id_seq", sequenceName = "order_id_seq")
    @GeneratedValue(generator = "order_id_seq")
    @Column(name = "order_id")
    private Integer id;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "pty_id")
    private Party client;

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name = "order_id")
    private List<CartProductPrice> cartProducts;

    @ManyToOne
    @JoinColumn(name = "shipping_id")
    private Shipping shipping;

    @ManyToOne
    @JoinColumn(name = "payment_id")
    private Payment payment;

    @Temporal(TemporalType.DATE)
    @Column(name = "order_d")
    private Date orderDate;

    @Column(name = "details")
    private String details;

    private String status;

    @Transient
    private Integer totalNumber;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Cart cart = (Cart) o;

        return !(id != null ? !id.equals(cart.id) : cart.id != null);
    }

    @Override
    public int hashCode() {
        return id != null ? id.hashCode() : 0;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Party getClient() {
        return client;
    }

    public void setClient(Party client) {
        this.client = client;
    }

    public List<CartProductPrice> getCartProducts() {
        if (cartProducts == null)
            cartProducts = new ArrayList<CartProductPrice>();
        return cartProducts;
    }

    public void setProducts(List<CartProductPrice> cartProducts) {
        this.cartProducts = cartProducts;
    }

    public Shipping getShipping() {
        return shipping;
    }

    public void setShipping(Shipping shipping) {
        this.shipping = shipping;
    }

    public Payment getPayment() {
        return payment;
    }

    public void setPayment(Payment payment) {
        this.payment = payment;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public Integer getTotalNumber() {
        return totalNumber;
    }

    public void setTotalNumber(Integer totalNumber) {
        this.totalNumber = totalNumber;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}

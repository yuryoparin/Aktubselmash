package ru.aktubselmash.model;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by IntelliJ IDEA.
 * User: Yury Oparin
 * Date: 16.07.11
 * Time: 15:30
 * Version: ${VERSION}
 */
@Entity
@Table(name = "shipping_payment")
public class ShippingPayment implements Serializable {
    @Id @ManyToOne
    @JoinColumn(name = "shipping_id", unique = false)
    private Shipping shipping;

    @Id @ManyToOne
    @JoinColumn(name = "payment_id", unique = false)
    private Payment payment;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ShippingPayment that = (ShippingPayment) o;

        return !(payment != null ? !payment.equals(that.payment) : that.payment != null) &&
                !(shipping != null ? !shipping.equals(that.shipping) : that.shipping != null);
    }

    @Override
    public int hashCode() {
        int result = shipping != null ? shipping.hashCode() : 0;
        result = 31 * result + (payment != null ? payment.hashCode() : 0);
        return result;
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
}

package ru.aktubselmash.model;

import javax.persistence.*;
import javax.validation.constraints.Min;
import java.io.Serializable;

/**
 * Created by IntelliJ IDEA.
 * User: Yury
 * Date: 24.10.11
 * Time: 10:02
 * To change this template use File | Settings | File Templates.
 */
@Entity
@Table(name = "order_price", uniqueConstraints = {@UniqueConstraint(columnNames={"product_id", "order_id"})})
public class CartProductPrice implements Serializable {
    @Id
    @SequenceGenerator(name = "cpp_id_seq", sequenceName = "cpp_id_seq")
    @GeneratedValue(generator = "cpp_id_seq")
    @Column(name = "cpp_id")
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "order_id", unique = false)
    private Cart cart;

    @ManyToOne
    @JoinColumn(name = "product_id", unique = false)
    private Product product;

    @Column(name = "price")
    private Integer price;

    @Min(0)
    @Column(name = "nm")
    private Integer number;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        CartProductPrice that = (CartProductPrice) o;

        return !(id != null ? !id.equals(that.id) : that.id != null);
    }

    @Override
    public int hashCode() {
        return id != null ? id.hashCode() : 0;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}

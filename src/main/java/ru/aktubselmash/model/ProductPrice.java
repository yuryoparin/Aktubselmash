package ru.aktubselmash.model;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by IntelliJ IDEA.
 * User: Yury Oparin
 * Date: 13.07.11
 * Time: 20:27
 * Version: ${VERSION}
 */

@Entity
@Table(name = "product_price", uniqueConstraints = {@UniqueConstraint(columnNames={"product_id", "shipping_id"})})
public class ProductPrice implements Serializable {

    @Id @ManyToOne()
    @JoinColumn(name = "product_id", unique = false)
    private Product product;

    @Id @ManyToOne()
    @JoinColumn(name = "shipping_id", unique = false)
    private Shipping shipping;

    @NotNull
    @Min(0)
    private Integer price;
    @Column(name = "discount_p")
    private Integer discount;
    @Column(name = "discount_due_d")
    private Date discountDueDate;

    @Column(name = "fprice")
    private Integer foreignPrice;

    @Column(name = "fdiscount_p")
    private Integer foreignDiscount;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ProductPrice that = (ProductPrice) o;

        return !(product != null ? !product.equals(that.product) : that.product != null) &&
                !(shipping != null ? !shipping.equals(that.shipping) : that.shipping != null);
    }

    @Override
    public int hashCode() {
        int result = product != null ? product.hashCode() : 0;
        result = 31 * result + (shipping != null ? shipping.hashCode() : 0);
        return result;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Shipping getShipping() {
        return shipping;
    }

    public void setShipping(Shipping shipping) {
        this.shipping = shipping;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Integer getDiscount() {
        return discount;
    }

    public void setDiscount(Integer discount) {
        this.discount = discount;
    }

    public Date getDiscountDueDate() {
        return discountDueDate;
    }

    public void setDiscountDueDate(Date discountDueDate) {
        this.discountDueDate = discountDueDate;
    }

    public Integer getForeignPrice() {
        return foreignPrice;
    }

    public void setForeignPrice(Integer foreignPrice) {
        this.foreignPrice = foreignPrice;
    }

    public Integer getForeignDiscount() {
        return foreignDiscount;
    }

    public void setForeignDiscount(Integer foreignDiscount) {
        this.foreignDiscount = foreignDiscount;
    }
}

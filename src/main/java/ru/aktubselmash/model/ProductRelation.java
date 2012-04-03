package ru.aktubselmash.model;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by IntelliJ IDEA.
 * User: Yury
 * Date: 20.10.11
 * Time: 17:42
 * To change this template use File | Settings | File Templates.
 */
@Entity
@Table(name = "product_relation", uniqueConstraints = {@UniqueConstraint(columnNames={"owner_id", "dependant_id"})})
public class ProductRelation implements Serializable {

    @Id @ManyToOne
    @JoinColumn(name = "owner_id", unique = false)
    private Product owner;

    @Id @ManyToOne()
    @JoinColumn(name = "dependant_id", unique = false)
    private Product dependant;

    @Column(name = "seq_num")
    private Integer seqNumber;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ProductRelation that = (ProductRelation) o;

        return !(dependant != null ? !dependant.equals(that.dependant) : that.dependant != null) &&
                !(owner != null ? !owner.equals(that.owner) : that.owner != null);
    }

    @Override
    public int hashCode() {
        int result = owner != null ? owner.hashCode() : 0;
        result = 31 * result + (dependant != null ? dependant.hashCode() : 0);
        return result;
    }

    public Product getOwner() {
        return owner;
    }

    public void setOwner(Product owner) {
        this.owner = owner;
    }

    public Product getDependant() {
        return dependant;
    }

    public void setDependant(Product dependant) {
        this.dependant = dependant;
    }

    public Integer getSeqNumber() {
        return seqNumber;
    }

    public void setSeqNumber(Integer seqNumber) {
        this.seqNumber = seqNumber;
    }
}

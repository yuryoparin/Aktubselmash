package ru.aktubselmash.model;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by IntelliJ IDEA.
 * User: Yury Oparin
 * Date: 12.07.11
 * Time: 22:16
 * Version: ${VERSION}
 */

@Entity
public class Shipping implements Serializable {
    @SequenceGenerator(name = "shipping_id_seq", sequenceName = "shipping_id_seq")
    @Id @GeneratedValue(generator = "shipping_id_seq")
    @Column(name = "shipping_id")
    private Integer id;

    private String name;
    private String description;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Shipping shipping = (Shipping) o;

        return !(id != null ? !id.equals(shipping.id) : shipping.id != null);
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}

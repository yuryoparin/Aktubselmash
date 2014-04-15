package ru.aktubselmash.model;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by IntelliJ IDEA.
 * User: Yury Oparin
 * Date: 16.07.11
 * Time: 13:44
 * Version: ${VERSION}
 */
@Entity
public class Payment implements Serializable {
    @Id
    @SequenceGenerator(name = "payment_id_seq", sequenceName = "payment_id_seq")
    @GeneratedValue(generator = "payment_id_seq")
    @Column(name = "payment_id")
    private Integer id;

    private String name;
    private String description;

    @Override
    public String toString() {
        return "Payment{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Payment payment = (Payment) o;

        return !(id != null ? !id.equals(payment.id) : payment.id != null);
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

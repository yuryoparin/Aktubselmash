package ru.aktubselmash.model;

import org.hibernate.validator.constraints.Email;
import ru.aktubselmash.model.constant.PartyType;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;
import javax.validation.constraints.NotNull;
import java.io.Serializable;

/**
 * Created by IntelliJ IDEA.
 * User: Yury Oparin
 * Date: 02.07.11
 * Time: 23:36
 * Version: ${VERSION}
 */
@Entity
public class Party implements Serializable {
    @Id
    @SequenceGenerator(name = "pty_id_seq", sequenceName = "pty_id_seq")
    @GeneratedValue(generator = "pty_id_seq")
    @Column(name = "pty_id")
    private Integer id;

    @Enumerated(EnumType.STRING)
    private PartyType type;

    @NotNull @Column(name = "fio")
    private String fio;

    @NotNull @Column(name = "cname")
    private String companyName;

    @NotNull @Column(name = "property", length = 1024)
    private String property; // реквизиты

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name = "address_id")
    private List<Address> addresses;
    @NotNull @Column(name = "phone_nb")
    private String phoneNumber;
    @Email @Column(name = "e_mail")
    private String email;

    @Override
    public String toString() {
        return "Party{" +
                "id=" + id +
                ", type=" + type +
                ", fio='" + fio + '\'' +
                ", companyName='" + companyName + '\'' +
                ", property='" + property + '\'' +
                ", addresses=" + addresses +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", email='" + email + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Party party = (Party) o;

        return !(id != null ? !id.equals(party.id) : party.id != null);
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

    public PartyType getType() {
        return type;
    }

    public void setType(PartyType type) {
        this.type = type;
    }

    public String getFio() {
        return fio;
    }

    public void setFio(String fio) {
        this.fio = fio;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getProperty() {
        return property;
    }

    public void setProperty(String property) {
        this.property = property;
    }

    public List<Address> getAddresses() {
        if (addresses == null)
            addresses = new ArrayList<Address>();
        return addresses;
    }

    public void setAddresses(List<Address> addresses) {
        this.addresses = addresses;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}

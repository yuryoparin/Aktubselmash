package ru.aktubselmash.model;

import org.hibernate.annotations.Index;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by IntelliJ IDEA.
 * User: Yury Oparin
 * Date: 02.07.11
 * Time: 23:31
 * Version: ${VERSION}
 */

@Entity
public class Product implements Serializable {

    @SequenceGenerator(name = "product_id_seq", sequenceName = "product_id_seq")
    @Id @GeneratedValue(generator = "product_id_seq")
    @Column(name = "product_id")
    private Integer id;

    @Column(name = "seq_num")
    private Integer seqNumber;
    @Index(name = "idx_product_short_nm")
    @NotNull @Length(max = 30)
    @Column(name = "short_nm")
    private String shortName;
    @NotNull @Length(max = 4000)
    private String name;
    @NotNull @Column(name = "parts_f")
    private Boolean partsFlag;
    @NotNull @Column(name = "menu_f")
    private Boolean menuFlag;
    @Column(name = "image_path_m")
    private String mediumImagePath;
    @Column(name = "image_path_s")
    private String smallImagePath;
    @Column(name = "description")
    private String description;
    @Column(name = "new_f")
    private Boolean newFlag;
    @Column(name = "unavailable_f")
    private Boolean unavailableFlag;
    @Column(name = "unit")
    private String unit;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Product product = (Product) o;

        return !(id != null ? !id.equals(product.id) : product.id != null);
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

    public Integer getSeqNumber() {
        return seqNumber;
    }

    public void setSeqNumber(Integer seqNumber) {
        this.seqNumber = seqNumber;
    }

    public String getShortName() {
        return shortName;
    }

    public void setShortName(String shortName) {
        this.shortName = shortName;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Boolean getPartsFlag() {
        return partsFlag;
    }

    public void setPartsFlag(Boolean partsFlag) {
        this.partsFlag = partsFlag;
    }

    public Boolean getMenuFlag() {
        return menuFlag;
    }

    public void setMenuFlag(Boolean menuFlag) {
        this.menuFlag = menuFlag;
    }

    public String getMediumImagePath() {
        return mediumImagePath;
    }

    public void setMediumImagePath(String mediumImagePath) {
        this.mediumImagePath = mediumImagePath;
    }

    public String getSmallImagePath() {
        return smallImagePath;
    }

    public void setSmallImagePath(String smallImagePath) {
        this.smallImagePath = smallImagePath;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Boolean getNewFlag() {
        return newFlag;
    }

    public void setNewFlag(Boolean newFlag) {
        this.newFlag = newFlag;
    }

    public Boolean getUnavailableFlag() {
        return unavailableFlag;
    }

    public void setUnavailableFlag(Boolean unavailableFlag) {
        this.unavailableFlag = unavailableFlag;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }
}

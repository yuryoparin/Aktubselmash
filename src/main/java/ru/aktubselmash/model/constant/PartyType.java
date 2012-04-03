package ru.aktubselmash.model.constant;

/**
 * Created by IntelliJ IDEA.
 * User: Yury Oparin
 * Date: 16.07.11
 * Time: 16:25
 * Version: ${VERSION}
 */
public enum PartyType {
    INDIVIDUAL("Частное лицо"),
    CORPORATE("Юридическое лицо");

    String label;

    PartyType(String label) {
        this.label = label;
    }

    public String getLabel() {
        return label;
    }
}

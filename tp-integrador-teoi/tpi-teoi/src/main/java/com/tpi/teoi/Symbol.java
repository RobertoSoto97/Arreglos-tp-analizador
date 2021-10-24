package com.tpi.teoi;

public class Symbol {

    private String order;

    private String name;

    private String token;

    private String type;

    private String value;

    private String size;

    public Symbol(String order, String name, String token, String type, String value, String size) {
        this.order = order;
        this.name = name;
        this.token = token;
        this.type = type;
        this.value = value;
        this.size = size;
    }

    @Override
    public String toString() {
        return "Symbol{" +
                "order='" + order + '\'' +
                ", name='" + name + '\'' +
                ", token='" + token + '\'' +
                ", type='" + type + '\'' +
                ", value='" + value + '\'' +
                ", size='" + size + '\'' +
                '}';
    }

    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }
}

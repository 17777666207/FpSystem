package org.ph.util;

public enum Pay_status {

    NotPay(0, "未支付"),
    endPay(1, "已支付");

    int value;
    String description;

    Pay_status(int value, String description) {
        this.value = value;
        this.description = description;
    }

    public int getValue() {
        return value;
    }

    public String getDescription() {
        return description;
    }

    public String getName() {
        return name();
    }


}

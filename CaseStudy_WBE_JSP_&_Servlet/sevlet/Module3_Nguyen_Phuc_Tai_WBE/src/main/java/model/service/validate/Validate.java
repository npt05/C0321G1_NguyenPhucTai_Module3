package model.service.validate;

public class Validate {
    public static String validateCustomerCode(String code) {
        String customerNamePattern = "^KH-\\d\\d\\d\\d";
        String message = null;
        if (!code.matches(customerNamePattern)) {
            message = "Invalid Customer Code";
        }
        return message;
    }

    public static String validateServiceCode(String code) {
        String customerNamePattern = "^DV-\\d\\d\\d\\d";
        String message = null;
        if (!code.matches(customerNamePattern)) {
            message = "Invalid Service Code";
        }
        return message;
    }

    public static String validatePhone(String phone) {
        String customerNamePattern = "(([(]84[)][+])|0)9[01]\\d\\d\\d\\d\\d\\d\\d";
        String message = null;
        if (!phone.matches(customerNamePattern)) {
            message = "Invalid Phone";
        }
        return message;
    }

    public static String validateIdCard(String phone) {
        String customerNamePattern = "^\\d\\d\\d\\d\\d\\d\\d\\d\\d";
        String message = null;
        if (!phone.matches(customerNamePattern)) {
            message = "Invalid IdCard";
        }
        return message;
    }

    public static String validateEmail(String email) {
        String customerNamePattern = "^[A-Za-z0-9]+[A-Za-z0-9]*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)$";
        String message = null;
        if (!email.matches(customerNamePattern)) {
            message = "Invalid Email";
        }
        return message;
    }

    public static String validateDate(String date) {
        String customerNamePattern = "^(0?[1-9]|[12][0-9]|3[01])[\\/\\-](0?[1-9]|1[012])[\\/\\-]\\d{4}";
        String message = null;
        if (!date.matches(customerNamePattern)) {
            message = "Invalid Date";
        }
        return message;
    }

    public static String validatePositiveInt(int num) {
        String message = null;
        if (num <= 0) {
            message = "Nhập số nguyên dương đi bạn ơi";
        }
        return message;
    }

    public static String validatePositiveDouble(double num) {
        String message = null;
        if (num <= 0) {
            message = "Nhập số dương đi bạn ơi";
        }
        return message;
    }
}
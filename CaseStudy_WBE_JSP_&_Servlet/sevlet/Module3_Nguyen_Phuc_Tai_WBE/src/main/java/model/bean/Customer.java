package model.bean;

public class Customer extends People {
    private int customerTypeId;
    private int customerGenderId;
    private String customerType;
    private String customerGender;
    private String customerCode;

    private int contractId;
    private int serviceId;
    private int contractDetailId;
    private int quantity;
    public Customer() {
    }

    public Customer(int id, String name, String birthday, String idCard, String phone, String email, String address, int contractId,int serviceId, int contractDetailId, int quantity) {
        super(id, name, birthday, idCard, phone, email, address);
        this.contractId = contractId;
        this.serviceId = serviceId;
        this.contractDetailId = contractDetailId;
        this.quantity = quantity;
    }

    public Customer(String name, String birthday, String idCard, String phone, String email, String address, int customerTypeId, int customerGenderId, String customerType, String customerGender, String customerCode) {
        super(name, birthday, idCard, phone, email, address);
        this.customerTypeId = customerTypeId;
        this.customerGenderId = customerGenderId;
        this.customerType = customerType;
        this.customerGender = customerGender;
        this.customerCode = customerCode;
    }

    public Customer(int id, String name, String birthday, String idCard, String phone, String email, String address, int customerTypeId, int customerGenderId, String customerType, String customerGender, String customerCode) {
        super(id, name, birthday, idCard, phone, email, address);
        this.customerTypeId = customerTypeId;
        this.customerGenderId = customerGenderId;
        this.customerType = customerType;
        this.customerGender = customerGender;
        this.customerCode = customerCode;
    }

    public Customer(String name, String birthday, String idCard, String phone, String email, String address, int customerTypeId, int customerGenderId, String customerCode) {
        super(name, birthday, idCard, phone, email, address);
        this.customerTypeId = customerTypeId;
        this.customerGenderId = customerGenderId;
        this.customerCode = customerCode;
    }

    public Customer(int id, String name, String birthday, String idCard, String phone, String email, String address, int customerTypeId, int customerGenderId, String customerCode) {
        super(id, name, birthday, idCard, phone, email, address);
        this.customerTypeId = customerTypeId;
        this.customerGenderId = customerGenderId;
        this.customerCode = customerCode;
    }


    public Customer(String name, String birthday, String idCard, String phone, String email, String address, String customerType, String customerGender, String customerCode) {
        super(name, birthday, idCard, phone, email, address);
        this.customerType = customerType;
        this.customerGender = customerGender;
        this.customerCode = customerCode;
    }

    public Customer(int id, String name, String birthday, String idCard, String phone, String email, String address, String customerType, String customerGender, String customerCode) {
        super(id, name, birthday, idCard, phone, email, address);
        this.customerType = customerType;
        this.customerGender = customerGender;
        this.customerCode = customerCode;
    }

    public int getCustomerTypeId() {
        return customerTypeId;
    }

    public void setCustomerTypeId(int customerTypeId) {
        this.customerTypeId = customerTypeId;
    }

    public int getCustomerGenderId() {
        return customerGenderId;
    }

    public void setCustomerGenderId(int customerGenderId) {
        this.customerGenderId = customerGenderId;
    }

    public String getCustomerType() {
        return customerType;
    }

    public void setCustomerType(String customerType) {
        this.customerType = customerType;
    }

    public String getCustomerGender() {
        return customerGender;
    }

    public void setCustomerGender(String customerGender) {
        this.customerGender = customerGender;
    }

    public String getCustomerCode() {
        return customerCode;
    }

    public void setCustomerCode(String customerCode) {
        this.customerCode = customerCode;
    }

    public int getContractId() {
        return contractId;
    }

    public void setContractId(int contractId) {
        this.contractId = contractId;
    }

    public int getServiceId() {
        return serviceId;
    }

    public void setServiceId(int serviceId) {
        this.serviceId = serviceId;
    }

    public int getContractDetailId() {
        return contractDetailId;
    }

    public void setContractDetailId(int contractDetailId) {
        this.contractDetailId = contractDetailId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
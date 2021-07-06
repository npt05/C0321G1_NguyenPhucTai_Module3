package model.bean;

public class ContractDetail {
    private int id;
    private int contractId;
    private int attachServiceId;
    private int quantity;
    private String attachServiceName;
    private String attachServiceCost;
    private String attachServiceUnit;
    private String attachServiceStatus;

    public ContractDetail() {
    }

    public ContractDetail(int id) {
        this.id = id;
    }

    public ContractDetail(int id, int contractId, int attachServiceId, int quantity) {
        this.id = id;
        this.contractId = contractId;
        this.attachServiceId = attachServiceId;
        this.quantity = quantity;
    }

    public ContractDetail(int contractId, int attachServiceId, int quantity) {
        this.contractId = contractId;
        this.attachServiceId = attachServiceId;
        this.quantity = quantity;
    }

    public ContractDetail(int id, int contractId, int attachServiceId, int quantity, String attachServiceName, String attachServiceCost, String attachServiceUnit, String attachServiceStatus) {
        this.id = id;
        this.contractId = contractId;
        this.attachServiceId = attachServiceId;
        this.quantity = quantity;
        this.attachServiceName = attachServiceName;
        this.attachServiceCost = attachServiceCost;
        this.attachServiceUnit = attachServiceUnit;
        this.attachServiceStatus = attachServiceStatus;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getContractId() {
        return contractId;
    }

    public void setContractId(int contractId) {
        this.contractId = contractId;
    }

    public int getAttachServiceId() {
        return attachServiceId;
    }

    public void setAttachServiceId(int attachServiceId) {
        this.attachServiceId = attachServiceId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getAttachServiceName() {
        return attachServiceName;
    }

    public void setAttachServiceName(String attachServiceName) {
        this.attachServiceName = attachServiceName;
    }

    public String getAttachServiceCost() {
        return attachServiceCost;
    }

    public void setAttachServiceCost(String attachServiceCost) {
        this.attachServiceCost = attachServiceCost;
    }

    public String getAttachServiceUnit() {
        return attachServiceUnit;
    }

    public void setAttachServiceUnit(String attachServiceUnit) {
        this.attachServiceUnit = attachServiceUnit;
    }

    public String getAttachServiceStatus() {
        return attachServiceStatus;
    }

    public void setAttachServiceStatus(String attachServiceStatus) {
        this.attachServiceStatus = attachServiceStatus;
    }
}
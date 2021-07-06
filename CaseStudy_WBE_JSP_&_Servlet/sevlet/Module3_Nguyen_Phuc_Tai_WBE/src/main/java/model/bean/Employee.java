package model.bean;

public class Employee extends People{
    private double salary;
    private int positionId;
    private int educationDegreeId;
    private int divisionId;
    private String username;
    private String position;
    private String educationDegree;
    private String division;
    private String password;

    public Employee() {
    }

    public Employee(String name, String birthday, String idCard, String phone, String email, String address, double salary, int positionId, int educationDegreeId, int divisionId, String username) {
        super(name, birthday, idCard, phone, email, address);
        this.salary = salary;
        this.positionId = positionId;
        this.educationDegreeId = educationDegreeId;
        this.divisionId = divisionId;
        this.username = username;
    }

    public Employee(int id, String name, String birthday, String idCard, String phone, String email, String address, double salary, int positionId, int educationDegreeId, int divisionId, String username) {
        super(id, name, birthday, idCard, phone, email, address);
        this.salary = salary;
        this.positionId = positionId;
        this.educationDegreeId = educationDegreeId;
        this.divisionId = divisionId;
        this.username = username;
    }

    public Employee(int id, String name, String birthday, String idCard, String phone, String email, String address, double salary, int positionId, int educationDegreeId, int divisionId, String username, String position, String educationDegree, String division) {
        super(id, name, birthday, idCard, phone, email, address);
        this.salary = salary;
        this.positionId = positionId;
        this.educationDegreeId = educationDegreeId;
        this.divisionId = divisionId;
        this.username = username;
        this.position = position;
        this.educationDegree = educationDegree;
        this.division = division;
    }

    public Employee(int id, String name, String birthday, String idCard, String phone, String email, String address, double salary, String username, String position, String educationDegree, String division) {
        super(id, name, birthday, idCard, phone, email, address);
        this.salary = salary;
        this.username = username;
        this.position = position;
        this.educationDegree = educationDegree;
        this.division = division;
    }


    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public int getPositionId() {
        return positionId;
    }

    public void setPositionId(int positionId) {
        this.positionId = positionId;
    }

    public int getEducationDegreeId() {
        return educationDegreeId;
    }

    public void setEducationDegreeId(int educationDegreeId) {
        this.educationDegreeId = educationDegreeId;
    }

    public int getDivisionId() {
        return divisionId;
    }

    public void setDivisionId(int divisionId) {
        this.divisionId = divisionId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getEducationDegree() {
        return educationDegree;
    }

    public void setEducationDegree(String educationDegree) {
        this.educationDegree = educationDegree;
    }

    public String getDivision() {
        return division;
    }

    public void setDivision(String division) {
        this.division = division;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
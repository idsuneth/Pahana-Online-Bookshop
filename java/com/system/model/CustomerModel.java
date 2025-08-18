package com.system.model;

public class CustomerModel {
    private String accountNumber;
    private String username;
    private String password;
    private String name;
    private String nic;
    private String address;
    private String phoneNumber;

    public CustomerModel() {}

    public CustomerModel(String accountNumber, String username, String password, String name,
                         String nic, String address, String phoneNumber) {
        this.accountNumber = accountNumber;
        this.username = username;
        this.password = password;
        this.name = name;
        this.nic = nic;
        this.address = address;
        this.phoneNumber = phoneNumber;
    }

    // Getters and setters for all fields

    public String getAccountNumber() {
        return accountNumber;
    }
    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }

    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getNic() {
        return nic;
    }
    public void setNic(String nic) {
        this.nic = nic;
    }

    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
}

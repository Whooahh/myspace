package com.lec.quiz;

import java.util.ArrayList;

public class Customer {
	private String name;
	private String tel;
	private String address;
	public Customer(String name, String tel, String address) {
		this.name = name;
		this.tel = tel;
		this.address = address;
	}
	public Customer() {
		// TODO Auto-generated constructor stub
	}
	public String toString() {
		return "[name=" + name + ", tel=" + tel + address + "]";
	}
	public String getName() {
		return name;
	}
	public String getTel() {
		return tel;
	}
	public String getAddress() {
		return address;
	}
	public void add(String getName, String getTel, String getAddress) {
		// TODO Auto-generated method stub
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public void setAddress(String address) {
		this.address = address;
	}
}


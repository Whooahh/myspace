package com.lec.ex1_list;
public class Friend {
	private String name;
	private String tel;
	public Friend(String name, String tel) {
		this.name = name;
		this.tel = tel;
	}
	public String toString() {
		return "[name=" + name + ", tel=" + tel + "]";
	}
	public String getName() {
		return name;
	}
	public String getTel() {
		return tel;
	}
}

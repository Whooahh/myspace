package com.lec.ex2_throws;

public class ThrowsTestMain {
	public static void main(String[] args)  {
		try {
			new ThrowsEx();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
}

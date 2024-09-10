package com.lec.ex3_exceptions;
import java.util.Date;
public class Ex02_FriendMain {
	public static void main(String[] args) {
		Friend friend1 = new Friend("홍길동"
				+ "", "010-9999-9999", new Date(98,8,10));
		System.out.println(friend1);
		
		Friend friend2 = new Friend("홍길순"
				+ "", "010-9999-9099", new Date(98,8,9));
		System.out.println(friend2);
		
		Friend friend3 = new Friend("홍길자"
				+ "", "010-9999-1999", new Date(98,8,1));
		System.out.println(friend3);
	}

}

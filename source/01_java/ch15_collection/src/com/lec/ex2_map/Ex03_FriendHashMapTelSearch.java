package com.lec.ex2_map;
import java.util.HashMap;
import java.util.Scanner;
import com.lec.ex1_list.Friend;
public class Ex03_FriendHashMapTelSearch {
	public static void main(String[] args) {
		HashMap<String, Friend> friends = new HashMap<String, Friend>();
		friends.put("홍길동", new Friend("홍길동", "010-1234-5678"));
		friends.put("동길동", new Friend("동길동", "010-1357-2468"));
		friends.put("서길동", new Friend("서길동", "010-1234-5432"));
		friends.put("남길동", new Friend("남길동", "010-9876-5432"));
		friends.put("북길동", new Friend("북길동", "010-9987-6543"));
		Scanner scanner = new Scanner(System.in);
		while(true) {
			System.out.print("검색하고자 하는 전화번호는 (단 종료는 x)? ");
			String searchTel = scanner.next();
			if(searchTel.equalsIgnoreCase("x")) break;
			
			Friend searchFriend = friends.get(searchTel);
			if(searchFriend == null) {
				System.out.println("검색되지 않은 전호번호 입니다");
			}else {
				System.out.println("검색한 정보는 " + searchFriend);
			}
		}
		scanner.close();
		
	}
}

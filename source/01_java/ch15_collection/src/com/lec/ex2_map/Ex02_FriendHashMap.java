package com.lec.ex2_map;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import com.lec.ex1_list.Friend;
public class Ex02_FriendHashMap {
	public static void main(String[] args) {
		Friend[] farr = new Friend[5];
		ArrayList<Friend> fs = new ArrayList<Friend>();
		HashMap<String, Friend> friends = new HashMap<String, Friend>();
		Friend newFriend = new Friend("김종수", "010-8787-8789");
		friends.put(newFriend.getTel(), newFriend);
		friends.put("010-7845-5465", new Friend ("동길동", "010-7845-5465"));
		friends.put("010-7805-5465", new Friend ("서길동", "010-7805-5465"));
		Iterator<String> iterator = friends.keySet().iterator();
		while(iterator.hasNext()) {
			String key = iterator.next();
			System.out.println(friends.get(key).getName() + "\t" + friends.get(key).getTel());
		}
		iterator = friends.keySet().iterator();
		while(iterator.hasNext()) {
			String key = iterator.next();
			System.out.println(friends.get(key));
		}
	}
}

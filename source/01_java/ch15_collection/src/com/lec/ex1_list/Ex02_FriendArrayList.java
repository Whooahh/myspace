package com.lec.ex1_list;
import java.util.ArrayList;
public class Ex02_FriendArrayList {
	public static void main(String[] args) {
//		Friend[] fs = new Friend[2];
//		fs[0] = new Friend("홍길동", "010-1234-5678");
//		fs[1] = new Friend("신길동", "010-5785-9099");
		ArrayList<Friend> friends = new ArrayList<Friend>();
		friends.add(new Friend("홍길동", "010-8248-8785"));
		friends.add(new Friend("홍유동", "010-8248-3785"));
		friends.add(new Friend("홍옹동", "010-2248-3485"));
		for(int i=0 ; i<friends.size() ; i++) {
			System.out.println(friends.get(i));
		}//for
		for(Friend friend : friends) {
			System.out.println(friend);
		}//for
		for(Friend friend : friends) {
			System.out.println(friend.getName() + "\t" + friend.getTel());
		}
		if(friends.isEmpty()) {
			System.out.println("friends 데이터가 없습니다");
		}else {
			for (int idx=0 ; idx<friends.size() ; idx++) {
				System.out.println(friends.get(idx).getName() + "\t" + friends.get(idx).getTel());
			}
		}
	}

	private static Object getTel() {
		// TODO Auto-generated method stub
		return null;
	}
}

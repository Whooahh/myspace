package com.lec.ex3_exceptions;
import java.text.SimpleDateFormat;
import java.util.Date;
// 데이터 : 이름, 전화번호, 생년월일 (Date) new Friend("홍길동", "010-9999-9999", new Date())
// sysout(f) => [이름]홍길* [전화]***-****-9999 [생일] 9월 10일 ♬생일 축하♬
public class Friend {
	private String name;
	private String tel;
	private Date birthday;
	public Friend(String name) {
		super();
		this.name = name;
	}
	public Friend(String name, String tel) {
		this.name = name;
		this.tel = tel;
	}
	public Friend(String name, String tel, Date birthday) {	
		this.name = name;
		this.tel = tel;
		this.birthday = birthday;
	}
	@Override
	public String toString() { //[이름]홍길* [전화]***-****-9999 [생일] 9월 10일 ♬생일 축하♬
		String result = "";
		String nameOut = name.substring(0, name.length()-1) + "*";
		result += "[이름]" + nameOut;
		String telOut = "***-****-" + tel.substring(tel.lastIndexOf("-")+1);
		result += "[전화번호]" + telOut;
		SimpleDateFormat sdf = new SimpleDateFormat("M월 d일");
		String birthOut = sdf.format(birthday);
		result += "[생일]" + birthOut;
		// 오늘이 생일인지 아닌지
		String today = sdf.format(new Date()); // 9월 10일 String
		if(today.equals(birthOut)) {
			result += "♬생일 축하♬";
		}else {
			result += "이번 달에 생일 이셨군요";
		}
		return result;
	}
}

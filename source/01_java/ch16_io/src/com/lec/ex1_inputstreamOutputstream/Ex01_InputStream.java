package com.lec.ex1_inputstreamOutputstream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
// (1) 파일을 연다(스트림 객체생성) (2) 데이터를 읽는다 (read 메소드 사용) (3) 파일을 닫는다 (close 메소드 사용)
import java.io.InputStream;
public class Ex01_InputStream {
	static InputStream is = null;
	public static void main(String[] args) {
		try {
			InputStream is = new FileInputStream("txtFile/inTest.txt");// 1. 파일 열기
			//2. 데이터 읽기 (파일 끝까지)
			while(true) {
				int i = is.read(); // 1byte씩 읽는다
				if(i == -1) break;
				System.out.print((char)i);
			}
			System.out.println("끝");	
		} catch (FileNotFoundException e) {
			System.out.println("예외메세지 : 파일 못 찾음, "+e.getMessage());
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally { // 3. 파일 닫기
			try {
				if (is!=null) is.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		
	}

}

package com.lec.ex1_inputstreamOutputstream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
// 파일 열기 -> 파일 쓰기 -> 파일 닫기
public class Ex03_Output {
	public static void main(String[] args) {
		OutputStream os = null;
		try {
			os = new FileOutputStream("txtFile/outTest.txt"); // 있는 파일은 덮어쓰고 없는 파일을 새로 생성
		//	byte[] bs = {'H', 'e', 'l', 'l', 'o'};
			String msg = "DBMS 첫날\nHi, BigData";
			byte[] bs = msg.getBytes();
				os.write(bs);
				System.out.println("파일 출력 성공");
			} catch (IOException e) {
			System.out.println("폴더가 없을 때 : "+e.getMessage());
			} finally {
			if(os!=null)
				try {
					os.close();
				} catch (IOException e) {
				}
			}
			
		}
	}



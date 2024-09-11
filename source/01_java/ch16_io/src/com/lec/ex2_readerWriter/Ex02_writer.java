package com.lec.ex2_readerWriter;
import java.io.*;
public class Ex02_writer {
	public static void main(String[] args) {
		Writer writer = null;
		try {
			writer = new FileWriter("txtFile/msg.txt", true);
			String msg = "내일부터 오라클입니다\n DBMS는 개발자뿐 아니라, 데이터를 다룰 과학자에게도 필수\n";
			writer.write(msg);
			msg = "두번 째 msg입니다\n";
			writer.write(msg);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}finally {
			if(writer!=null)
				try {
					writer.close();
				} catch (IOException e) {
				System.out.println(e.getMessage());
				}
		}
	}
}

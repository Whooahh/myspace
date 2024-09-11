package com.lec.ex1_inputstreamOutputstream;
import java.io.*;
public class Ex02_InputStreamByteArray {
	public static void main(String[] args) {
		InputStream is = null;
		try {
			is = new FileInputStream("txtFile/inTest.txt");
			byte[] bs = new byte[10]; // 10byte씩 bs에 읽어오는 용도
			// (2)
			while(true) {
				int readByteCount = is.read(bs);
				if(readByteCount == -1) break;
				for(int i=0 ; i<readByteCount ; i++) {
					System.out.println((char)bs[i]);
				}
			}
		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(is!=null) is.close();
			} catch (IOException e2) {
				System.out.println(e2.getMessage());
			}
		}
	}
}

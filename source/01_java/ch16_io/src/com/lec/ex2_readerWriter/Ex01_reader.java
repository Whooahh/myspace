package com.lec.ex2_readerWriter;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;

public class Ex01_reader {
	public static void main(String[] args) {
		Reader reader = null;
		try {
			reader = new FileReader("txtFile/inTest.txt");
			while(true) {
					int i = reader.read();
					if(i==-1) break;
					System.out.print((char)i);
			}
				
		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}finally {
			if(reader !=null)
				try {
					reader.close();
				} catch (IOException e) {
				}
		}
	}
}

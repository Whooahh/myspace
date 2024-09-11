package com.lec.ex1_inputstreamOutputstream;
import java.io.*;
// ~/bts_7.mp4 => ~/bts_7_copy.mp4
public class Ex04_fileCopy2 {
	@SuppressWarnings("null")
	public static void main(String[] args) {
		long start = System.currentTimeMillis();//1970.1.1부터 지금까지의 밀리세컨
		InputStream is = null;
		OutputStream os = null;
		try {
			File originalFile = new File("D:/myspace/Download/bts_7.mp4");
			is = new FileInputStream("D:/myspace/Downloads/bts_7.mp4");
			os = new FileOutputStream("D:\\myspace\\Downloads\\bts_copy.mp4");
			
			String orginalFile = null;
			byte[] bs = new byte[(int)orginalFile.length()];
			
			int cnt = 0;
			while(true) {
				int readByteCount = is.read(bs);
				if(readByteCount == -1) break;
				os.write(bs);
				cnt++;
				if(cnt % 300000 == 0) {
					System.out.println(cnt + "/7,460,545 번");
				}
			}
			System.out.println("파일 복사 완료");
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			try {
				if(is!=null) is.close();
				if(os!=null) os.close();
			} catch (IOException e2) {
				// TODO: handle exception
			}
		}
		
		
		
		
		
		
		long end = System.currentTimeMillis();
		System.out.println((end-start)/1000.0 + " 초 걸림");
	}
	
}

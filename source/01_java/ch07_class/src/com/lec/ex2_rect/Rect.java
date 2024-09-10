package com.lec.ex2_rect;
// 클래스 : 속성(인스턴스변수), 생성자함수(속성데이터초기화), 메소드, setter&getter
// Rect r1 = new Rect()
// Rect r1 = new Rect(2,4)
// Rect r1 = new Rect(3);
public class Rect {
	private int width;
	private int height;
	// 생성자 함수가 없을 경우, JVM이 자동 생성
	public Rect() {} // 디폴트 생성자
	public Rect(int side) {
		width = side;
		height = side;		
	}
	public Rect(int width, int height) {
		this.width = width;
		this.height = height;
	}
	public int area() {
		return width*height;
	}
	public void setWidth(int width) {
		this.width = width;
	}
	public int getWidth() {
		return width;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
		
	}
}

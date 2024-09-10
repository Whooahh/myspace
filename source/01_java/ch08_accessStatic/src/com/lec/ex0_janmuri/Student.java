package com.lec.ex0_janmuri;
// 생성자: new Student("정우성", 90, 90, 90)
// 데이터: name(String), kor(int), eng, mat
// 메소드: infoPrint(), infoString()
public class Student {
	private String name;
	private int kor;
	private int eng;
	private int mat;
	private int tot;
	private double avg;
	public Student() {} // 디폴트 생성자
	public Student(String name, int kor, int eng, int mat, int tot, double avg) {
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.mat = mat;
		tot = kor + eng + mat;
		avg = tot/3.0;
	}
	public Student(String name, int kor, int eng , int mat) {
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.mat = mat;
		tot = kor + eng + mat;
		avg = tot/3.0;
	}
	public void infoPrint() {
		// \t정우성\t90\t90\t90\t270\t90.0
		System.out.printf("\t%s\t%3d\t%3d\t%3d\t%3d\t%.1f", name, kor, eng, mat, tot, avg);
		
	}
	public String infoString() {
		// \t정우성\t90\t90\t90\t270\t90.0
		return String.format("\t%s\t%3d\t%3d\t%3d\t%3d\t%.1f", name, kor, eng, mat, tot, avg);
		
	}
	public String getName() {
		return name;
	}
	public int getKor() {
		return kor;
	}
	public int getEng() {
		return eng;
	}
	public int getMat() {
		return mat;
	}
	public int getTot() {
		return tot;
	}
	public double getAvg() {
		return avg;
	}

}
	

package com.lec.ex0_janmuri;

public class StudentTestMain {
	private static void line() {
		for(int i=0 ; i<65 ; i++) {
			System.out.print('■');
		}
		System.out.println();
	}
	private static void line(char ch) {
		System.out.print("\t");
		for(int i=0 ; i<50 ; i++) {
			System.out.print(ch);
		}
		System.out.println();
	}
	public static void main(String[] args) {
		Student[] students = {new Student("정우성", 90, 90, 90),
							  new Student("김하늘", 60, 50, 100),
							  new Student("황정민", 50, 60, 50),
							  new Student("강동원", 95, 70, 90),
							  new Student("마동석", 85, 78, 90)};
		String[] titles = {"이름", "국어", "영어", "수학", "총점", "평균"};
		int[] tot = new int[5]; // tot[0]: 국어 누적, tot[1]: 영어누적, tot[2]: 수학누적, tot[3]
		line();
		System.out.println("\t\t\t\t성적표");
		line('-');
		for(String title : titles) {
			System.out.print("\t" + title);
		}
		System.out.println();
		line('~');
		for(Student student : students) {
			System.out.println(student.infoString());
			tot[0] += student.getKor();
			tot[1] += student.getEng();
			tot[2] += student.getMat();
			tot[3] = tot[3] + student.getTot();
			tot[4] += student.getAvg();
		}
		line('~');
		System.out.print("\t총점");
		for(int t : tot) {
			System.out.print("\t" + t);
		}
		System.out.println();
		line();
	}
}

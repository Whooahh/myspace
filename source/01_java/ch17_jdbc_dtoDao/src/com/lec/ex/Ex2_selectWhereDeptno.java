package com.lec.ex;
import java.util.Scanner;
import com.lec.dao.DeptRepository;
import com.lec.dto.Dept;
// 부서번호를 입력받아 부서 정보 출력
public class Ex2_selectWhereDeptno {
	public static void main(String[] args) {
		DeptRepository repository = DeptRepository.getInstance();
		Scanner scanner = new Scanner(System.in);
		System.out.print("원하시는 부서 번호를 입력하세요 : ");
		int deptno = scanner.nextInt();
		Dept dept = repository.getDept(deptno);
		if(dept!=null) {
			System.out.println(deptno + "번 부서정보는 다음과 같습니다");
			System.out.println("부서명 : " + dept.getDname());
			System.out.println("부서위치 : " + dept.getLoc());
		}else {
			System.out.println("해당 부서번호는 존재하지 않는 부서입니다.");
		}
	}
}

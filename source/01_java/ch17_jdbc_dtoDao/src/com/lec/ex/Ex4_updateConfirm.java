package com.lec.ex;

import java.util.Scanner;

import com.lec.dao.DeptRepository;
import com.lec.dto.Dept;

public class Ex4_updateConfirm {
	public static void main(String[] args) {
		DeptRepository deptRepository = DeptRepository.getInstance();
		Scanner scanner = new Scanner(System.in);
		System.out.print("수정 할 부서 번호는 > ");
		int deptno = scanner.nextInt();
		Dept dept = deptRepository.getDept(deptno); // 해당 부서번호가 있는지 조회
		if(dept!=null) {
			System.out.print("수정 할 부서 명은 > ");
			String dname = scanner.next();
			System.out.print("수정 할 부서 위치는 > ");
			String loc = scanner.next();
			deptRepository.updateDept(deptno, dname, loc);
		}else {
			System.out.println("유효한 부서번호가 아닙니다");
		}
		scanner.close();
	}
}

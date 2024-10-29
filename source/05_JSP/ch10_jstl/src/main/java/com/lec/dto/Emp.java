package com.lec.dto;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
@Data
@AllArgsConstructor
public class Emp {
	private int empno;
	private String ename;
	private String job;
	private String mgr;
	private Timestamp hiredate;
	private int sal;
	private int comm;
	private int deptno;
}

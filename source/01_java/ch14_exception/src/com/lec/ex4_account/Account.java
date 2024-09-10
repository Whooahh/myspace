package com.lec.ex4_account;
// 데이터(인스턴스변수) : accountNo(String), ownerName(String), balance(long)
// 생성자 new Account ("010-7777-7777", "홍길동"), new Account("010-777-7777, "홍길동", 100)
// 기능(메소드) : deposit(예금), withdraw(인출), infoPrint(정보출력), infoString(정보문자열 변환)
public class Account{
	private String accountNo; 
	private String ownerName; 
	private long balance;
	// 생성자 없으면 JVM이 디폴트 생성자 함수 자동 생성
	//public Account() {} // 디폴트 생성자 함수
	public Account(String accountNo, String ownerName) {
		this.accountNo = accountNo; 
		this.ownerName = ownerName; 
	}
	public Account(String accountNo, String ownerName, long balance) {
		this.accountNo = accountNo;
		this.ownerName = ownerName;
		this.balance = balance;		
	}
	public void deposite(long money) {//무조건 예금하기
	balance += money;//balance = balance + money;
	System.out.println(money + "원 예금하여 잔액 : " + balance);				
	}
	public void withdraw(long money) throws Exception {// 잔액이 있을 경우에만 인출
		if(balance >= money) {
			balance -= money; //balance = balance - money;
			System.out.println(money +"원 인출하여 잔액 : " + balance);
		}else {
			//ch14에서는 강제 예외 발생
			//System.out.println("잔액이 부족하여 인출이 불가합니다");
			throw new Exception(money + "원 인출하기엔 잔액 ("+balance+") 부족합니다");
		}//if
		
	}
	public void infoPrint() {
		//100-1 "홍길동"님 잔액 : 100원
		//System.out.println(accountNo + "\"" + ownerName + "\"님의 잔액 : " + balance);
		System.out.printf("%s \"%s\"님 잔액 : %d\n", accountNo, ownerName, balance);
	}
	public String infoString() {
		//100-1 "홍길동" 님의 잔액: 100을 return
		return String.format("%s \"%s\"님 잔액 : %d\n", accountNo, ownerName, balance);
		
	}
	public String getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}
	public String getOwnerName() {
		return ownerName;
	}
	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}
	public long getBalance() {
		return balance;
	}
	public void setBalance(long balance) {
		this.balance = balance;
	}
	
}
		



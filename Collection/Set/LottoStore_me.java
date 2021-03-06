package kr.or.ddit.basic;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Scanner;

/*
 *  로또를 구매하는 프로그램 작성하기
 
 사용자는 로또를 구매할 때 구매할 금액을 입력하고
 입력한 금액에 맞게 로또번호를 출력한다.
 (단, 로또 한장의 금액은 1000원이며 최대 100장까지만 구입할 수 있고,
      거스름돈도 계산하여 출력한다.)

	==========================
         Lotto 프로그램
	--------------------------
	 1. Lotto 구입
	 2. 프로그램 종료
	==========================		 
	메뉴선택 : 1  <-- 입력
			
	 Lotto 구입 시작
		 
	(1000원에 로또번호 하나입니다.)
	금액 입력 : 2500  <-- 입력
			
	행운의 로또번호는 아래와 같습니다.
	로또번호1 : 2,3,4,5,6,7
	로또번호2 : 20,21,22,23,24,25
			
	받은 금액은 2500원이고 거스름돈은 500원입니다.

	==========================
         Lotto 프로그램
	--------------------------
	 1. Lotto 구입
	 2. 프로그램 종료
	==========================		 
	메뉴선택 : 1  <-- 입력
			
	 Lotto 구입 시작
		 
	(1000원에 로또번호 하나입니다.)
	금액 입력 : 900  <-- 입력
	
	입력 금액이 너무 적습니다. 로또번호 구입 실패!!!

	==========================
         Lotto 프로그램
	--------------------------
	 1. Lotto 구입
	 2. 프로그램 종료
	==========================		 
	메뉴선택 : 1  <-- 입력
			
	 Lotto 구입 시작
		 
	(1000원에 로또번호 하나입니다.)
	금액 입력 : 101000  <-- 입력
	
	입력 금액이 너무 많습니다. 로또번호 구입 실패!!!
			
   	 ==========================
         Lotto 프로그램
	--------------------------
	  1. Lotto 구입
	  2. 프로그램 종료
	==========================		 
	메뉴선택 : 2  <-- 입력
		
	감사합니다
 */

public class LottoStore_me {
	HashSet<Integer> lottoSet = new HashSet<Integer>();

	Scanner sc = new Scanner(System.in);

	// 메뉴를 출력하고 작업 번호를 입력받는 메서드
	void start() {
		System.out.println("==========================");
		System.out.println("       Lotto 프로그램");
		System.out.println("--------------------------");
		System.out.println("  1. Lotto 구입");
		System.out.println("  2. 프로그램 종료");
		System.out.println("==========================");
		System.out.print("메뉴선택 : ");

		int input = Integer.parseInt(sc.nextLine());
		System.out.println();

		switch (input) {
		case 1:
			buy_lotto();
		case 2:
			System.out.println("감사합니다.");
			System.exit(0);
		}
	}
	
	// 로또 번호를 랜덤 생성하는 메서드
	void lotto_random() {
		while(lottoSet.size()<6) {
			int random = (int) (Math.random() * 45 + 1);
			lottoSet.add(random);
		}
	}

	// 로또를 구입하는 메서드
	void buy_lotto() {
		System.out.println(" Lotto 구입 시작");
		System.out.println();
		System.out.println("(1000원에 로또번호 하나입니다.)");
		System.out.print("금액 입력 : ");
		int money = Integer.parseInt(sc.nextLine());
		System.out.println();

		if (money < 1000) {
			System.out.println("입력 금액이 너무 적습니다. 로또번호 구입 실패!!!");
		} else if (money > 100000) {
			System.out.println("입력 금액이 너무 많습니다. 로또번호 구입 실패!!!");
		} else {
			System.out.println("행운의 로또번호는 아래와 같습니다.");
			int lottoNum = money / 1000;
			int coin = money - (lottoNum * 1000);
			for (int i = 0; i < lottoNum; i++) {
				lotto_random();
				ArrayList<Integer> lottoList = new ArrayList<Integer>(lottoSet);
				Collections.sort(lottoList); 
				System.out.println("로또번호" + (i+1) + " : " + lottoList);
				lottoSet.clear();
			}
			System.out.println("받은 금액은 " + money + "원이고 거스름돈은 " + coin + "원입니다.");
		}
		System.out.println();
		start();
	}

	public static void main(String[] args) {

		new LottoStore_me().start();

	}
}
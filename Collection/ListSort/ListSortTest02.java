package kr.or.ddit.basic;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

// 숙제 : 회원번호의 내림차순으로 정렬될 수 있는 외부 정렬 기준을 작성하시오.

public class ListSortTest02 {

	public static void main(String[] args) {
		ArrayList<Member> memList = new ArrayList<Member>();

		memList.add(new Member(1, "홍길동", "010-1111-1111"));
		memList.add(new Member(5, "이순신", "010-2222-1111"));
		memList.add(new Member(9, "성춘향", "010-3333-1111"));
		memList.add(new Member(3, "강감찬", "010-4444-1111"));
		memList.add(new Member(6, "일지매", "010-5555-1111"));
		memList.add(new Member(2, "변학도", "010-6666-1111"));

		System.out.println("정렬 전...");
		for (Member mem : memList) {
			System.out.println(mem);
		}

		Collections.sort(memList); //comparable

		// 이름 순 정렬
		System.out.println("정렬 후...");
		for (Member mem : memList) {
			System.out.println(mem);
		}
		
		Collections.sort(memList, new SortNumDesc()); //comparator
		
		System.out.println("정렬 후...");
		for (Member mem : memList) {
			System.out.println(mem);
		}
		
	}
}

// Member 클래스 작성하기
// ==> 회원 이름을 기준으로 오름차순 정렬이 되도록 내부 정렬 기준을 추가해보자. 
// ==> Comparable 인터페이스를 구현한다.
class Member implements Comparable<Member> { // 멤버클래스이기 때문에 <Member>
	private int num; // 회원번호
	private String name; // 회원이름
	private String tel; // 전화번호

	// 자동 생성(Alt + Shift + s)
	public Member(int num, String name, String tel) {
		super();
		this.num = num;
		this.name = name;
		this.tel = tel;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	@Override
	public String toString() {
		return "Member [num=" + num + ", name=" + name + ", tel=" + tel + "]";
	}

	// 회원 이름의 오름차순 정렬 기준 만들기
	@Override
	public int compareTo(Member mem) { // Member가 앞의 데이터, 매개변수가 뒤의 데이터
		// 현재 객체의 name > 앞의 데이터
		// mem.getName() > 뒤의 데이터
		// String의 내부 정렬은 오름차순이기 때문에 반환 값 그대로 사용
		return name.compareTo(mem.getName());
	}
	
	// 회원번호의 내림차순 정렬 기준 만들기
//	@Override
//	public int compareTo(Member mem) { // Member가 앞의 데이터, 매개변수가 뒤의 데이터
//		// 현재 객체의 num > 앞의 데이터
//		// mem.getNum() > 뒤의 데이터
//		// String의 내부 정렬은 오름차순이기 때문에 반환 값 그대로 사용
//		return (int) mem.getNum() - this.num;
//
//	}
}

//Member의 회원번호 (num값)의 내림차순으로 정렬하는 외부 정렬 기준 클래스
class SortNumDesc implements Comparator<Member> {

	@Override
	public int compare(Member mem1, Member mem2) {
		
		// 방법1 : 숫자이기 때문에 if문으로 비교식 만들기
//		if (mem1.getNum() > mem2.getNum()) { 
//			return -1;
//		} else if (mem1.getNum() < mem2.getNum()) {
//			return 1;
//		} else {
//			return 0;
//		}
		
		//Wrapper클래스를 이용하는 방법1 (Wrapper클래스에는 내부정렬기준이 있어 compareTo 사용 가능)
//		return new Integer(mem1.getNum()).compareTo(mem2.getNum()) * -1;
		
		//Wrapper클래스를 이용하는 방법2
		return Integer.compare(mem1.getNum(), mem2.getNum()) * -1;
				
	}
}
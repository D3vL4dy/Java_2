package kr.or.ddit.basic;

import java.util.ArrayList;
import java.util.Collections;

/*
 * 10마리의 말들이 경주하는 경마 프로그램 작성하기
 * 
 * 말은 Horse라는 이름의 쓰레드 클래스로 작성하는데 
 * 이 클래스는 말이름(String), 등수(int), 현재위치(int)를 멤버변수로 갖는다.
 * 그리고, 이 클래스에는 등수를 오름차순으로 처리할 수 있는 내부 정렬 기준이 있다.
 * (Comparable인터페이스 구현)
 * 
 * 경기 구간은 1 ~ 50 구간으로 되어 있다.
 * 
 * 경기가 끝나면 등수 순으로 출력한다.
 * 
 * 경기가 진행 중일때는 중간 중간에 말들의 위치를 아래와 같이 나타낸다. 
 * 예) (출력도 하나의 쓰레드)
 * 01번말 : ----10---------------------
 * 02번말 : ---------15----------------
 * ...
 * 10번말 : -------13------------------
 */

public class ThreadTest13 {

	public static void main(String[] args) {
		Horse[] horses = new Horse[] {
			new Horse("01번말"), 	
			new Horse("02번말"), 	
			new Horse("03번말"), 	
			new Horse("04번말"), 	
			new Horse("05번말"), 	
			new Horse("06번말"), 	
			new Horse("07번말"), 	
			new Horse("08번말"), 	
			new Horse("09번말"), 	
			new Horse("10번말"), 	
		};
		
		GameState gs = new GameState(horses);
		
		// 경주를 시작한다.
		for(Horse h : horses) {
			h.start();
		}
		
		// 말들의 현재위치를 나타내는 쓰레드도 시작한다.
		gs.start();
		
		// 모든 말들의 경주가 끝날 때까지 기다린다.
		for(Horse h : horses) {
			try {
				h.join();
			} catch (InterruptedException e) {}
		}
		
		try {
			gs.join();
		} catch (InterruptedException e) {}
		
		System.out.println();
		System.out.println("경기 끝...");
		System.out.println();
		
		// 등수의 오름차순으로 정렬하기
		// 방법1 : 배열을 정렬하기
//		Arrays.sort(horses); 
//		for(Horse h : horses) {
//			System.out.println(h);
//		}
		
		// 방법2 : ArrayList 이용
		ArrayList<Horse> horseList = new ArrayList<Horse>();
		for(Horse h : horses) {
			horseList.add(h);
		}
		Collections.sort(horseList);
		for(Horse h : horseList) {
			System.out.println(h);
		}
	}

}

// 말 쓰레드
class Horse extends Thread implements Comparable<Horse> {
	public static int currentRank = 0; // 말들의 등수를 결정할 변수

	private String horseName; // 이름
	private int rank; // 등수
	private int position; // 현재위치

	// 생성자
	public Horse(String horseName) {
		this.horseName = horseName;
	}

	public String getHorseName() {
		return horseName;
	}

	public void setHorseName(String horseName) {
		this.horseName = horseName;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	public int getPosition() {
		return position;
	}

	public void setPosition(int position) {
		this.position = position;
	}

	@Override
//	public String toString() {
//		return "경주마 " + horseName + "은(는) " + rank + "등 입니다.";
//	}

	// 등수의 오름차순 정렬 기준 설정하기
	public int compareTo(Horse horse) {
		return Integer.compare(rank, horse.getRank());
	}

	@Override
	public void run() {
		// 경주를 진행하는 쓰레드 처리

		// 1 ~ 50 구간 진행
		for (int i = 1; i <= 50; i++) {
			this.position = i; // 현재 구간을 말의 현재 위치로 한다.
			try {
				// 쓰레드의 작동 시간을 멈추는 작업으로 
				// 값을 랜덤하게 설정해 말이 달리는 속도를 각각 다르게 조절
				Thread.sleep((int) (Math.random() * 500));
			} catch (InterruptedException e) {
				// TODO: handle exception
			}
		}
		// 한 마리의 말의 경주가 끝난 후에 등수를 구한다.
		currentRank++;
		this.rank = currentRank;
	}

}


// 경기 중에 말의 현재 위치를 나타내는 쓰레드
class GameState extends Thread {
	private Horse[] horses;

	// 생성자 - 경주에 참여한 말들이 저장된 배열을 받아서 초기화한다.
	public GameState(Horse[] horses) {
		this.horses = horses;
	}

	@Override
	public void run() {
		while (true) {
			// 모든 말들의 경주가 종료되면 반복문을 탈출한다.
			if (Horse.currentRank == horses.length) {
				break;
			}
			
			for(int i = 1; i <= 10; i++) {
				System.out.println();
			}

			// 01번말 : ---->---------------------
			for (int i = 0; i < horses.length; i++) {
				System.out.print(horses[i].getHorseName() + " : ");
				for (int j = 1; j <= 50; j++) {
					// 말의 현재위치와 구간값이 같은지 여부 검사
					if (horses[i].getPosition() == j) {
						System.out.print(">");
					} else {
						System.out.print("-");
					}
				}
				System.out.println(); // 줄바꿈
			}

			try {
				Thread.sleep(100);
			} catch (InterruptedException e) {
				// TODO: handle exception
			}
		}

	}
}

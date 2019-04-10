package test;

public class ThreadTest extends Thread {

	public void run() {
		System.out.println("start()를 호출하면 내가 실행 됨");
	}

	public static void main(String[] args) {
		Thread t = new ThreadTest();
		t.start();
	}
}
	
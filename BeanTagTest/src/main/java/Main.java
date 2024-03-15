import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		
		//문자열 입력
		String str =sc.nextLine();
		//공백제거
		String strtrim = str.trim();
		//자른 문자열 담을 배열
		String[] strarr = strtrim.split(" ");
		
		//배열 길이 출력
		System.out.println(strarr.length);
		
	}

}

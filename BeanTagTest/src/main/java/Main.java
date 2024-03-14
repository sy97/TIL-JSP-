import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		
		char[] alph = new char[26];
		for(int i = 0; i < alph.length; i++) {
			alph[i] = (char)(97+i);
		}
		
	
		
		String S = sc.next();
		char[] arr = S.toCharArray();
		
		
		for(int i = 0; i <alph.length; i++) {
			boolean found = false;
			for(int k = 0; k <arr.length; k++) {
				if(alph[i] == arr[k]) {
					System.out.print(i);
					System.out.print(" ");
					found = true;
					break;
				}
				
			}
			
			if(!found) {
				System.out.print(-1);
				System.out.print(" ");
			}
			
		}
		
	}

}

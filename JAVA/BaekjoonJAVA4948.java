import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);
			while(true) {
			int M = in.nextInt();
			int N = M * 2;
			
			if(M == 0) {
				break;
			}
			
			int[] nums = new int[(N+1)];
			for(int i=2; i<=N; i++) {
				nums[i] = i;
			}
			
			for(int i=2; i<=Math.sqrt(N); i++) {
				if(nums[i] == 0) {
					continue;
				}
				
				int temp = i;
				for(int j = i+1; j<=N; j++) {
					if(j % temp == 0) {
						nums[j] = 0;
					}
				}
			}
			
			int count = 0;
			for(int i = M+1; i <nums.length; i++){
				if(nums[i] != 0)
					count++;
			}
			System.out.println(count);
			
		}

	}
	

}

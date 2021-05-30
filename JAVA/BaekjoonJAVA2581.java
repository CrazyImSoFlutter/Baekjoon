import java.util.*;

public class Main {
	private static final Scanner sc = new Scanner(System.in);
	private static final int M = sc.nextInt();
	private static final int N = sc.nextInt();
	private static final int K = N-M+1;
	private static final int arr [] = new int [K];
	public static void main(String args[])
	{
		int sum = 0;
		int small = 0;
		for(int i=0; i<K; i++)
		{
			arr[i]=M+i;
		}
		
		for(int i=0;i<K;i++)
		{
			int count = 0;
			for(int j=1; j<=arr[i]; j++)
			{
				if(arr[i]%j==0)
				{
					count++;
				}
			}
			if(count == 2)
			{
				if(small == 0)
				{
					small = arr[i];
				}
				sum += arr[i];
			}
		}
		
		
		
		if(sum!=0)
		{
			System.out.println(sum);
			System.out.println(small);
		}
		else
		{
			System.out.println("-1");
		}
	}


}

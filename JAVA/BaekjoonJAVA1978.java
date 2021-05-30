import java.util.*;

public class Main {
	private static final Scanner sc = new Scanner(System.in);
	private static final int N = sc.nextInt();
	private static final int arr [] = new int [N];
	public static void main(String args[])
	{
		int answer = 0;
		for(int i=0; i<N; i++)
		{
			arr[i]=sc.nextInt();
		}
		
		for(int i=0; i<N; i++)
		{
			int count1 = 0;
			for(int j=1; j<=arr[i]; j++)
			{
				if(arr[i]%j == 0)
				{
					count1++;
				}
			}
			if(count1==2)
			{
				answer++;
			}
		}
		
		System.out.println(answer);
	}

}

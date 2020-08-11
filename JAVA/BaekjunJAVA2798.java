import java.util.*;
public class Main {
	private static Scanner sc = new Scanner(System.in);
	private static int N = sc.nextInt();
	private static int M = sc.nextInt();
	private static int K = N*(N-1)*(N-2)/6;
	private static int CardArray[] = new int [N];
	private static int SumArray[] = new int [K];
	public static void main(String args[])
	{
		int l=0;
		for(int i=0; i<N; i++)
		{
			CardArray[i] = sc.nextInt();
		}
		
		for(int i=0; i<N-2; i++)
		{
			for(int j=i+1; j<N-1; j++)
			{
				for(int k=j+1; k<N; k++)
				{
					SumArray[l]=CardArray[i]+CardArray[j]+CardArray[k];
					l++;
				}
			}
			
		}
		Arrays.sort(SumArray);
		
		for(int i=K-1; i>=0; i--)
		{
			if(M-SumArray[i]>=0)
			{
				System.out.println(SumArray[i]);
				break;
			}
		}
	}
}

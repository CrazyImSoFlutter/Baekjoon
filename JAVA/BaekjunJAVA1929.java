import java.util.*;

public class Main {
	private static final Scanner sc = new Scanner(System.in);
	private static final int M = sc.nextInt();
	private static final int N = sc.nextInt();
	
	public static void main(String args[])
	{
		boolean arr[] = new boolean [N+1];
		for(int i=0; i<N+1; i++)
		{
           
			arr[i] = true;
		}
        
		arr[0] = false;
		arr[1] = false;
        
		for(int i=2; i*i<N+1; i++)
		{
			for(int j=i*2; j<N+1; j+=i)
			{
				arr[j] = false;
			}
		}
		
		for(int i=M; i<N+1; i++)
		{
			if(arr[i]==true)
			{
				System.out.println(i);
			}
		}
	}

}

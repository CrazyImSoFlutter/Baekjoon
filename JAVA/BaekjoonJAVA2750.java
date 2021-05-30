import java.util.*;
public class Main {

	private static Scanner sc = new Scanner(System.in);
	private static int N = sc.nextInt();
	private static int Array[] = new int [N]; 
	public static void main(String args[])
	{
		for(int i=0; i<N; i++)
		{
			Array[i]=sc.nextInt();
		}
		boolean ExitLoop = true;
		while(ExitLoop)
		{
			int count=0;
			for(int i=0; i<N-1; i++)
			{
				if(Array[i]>Array[i+1])
				{
					int tmp=0;
					tmp=Array[i];
					Array[i]=Array[i+1];
					Array[i+1]=tmp;
				}
				else 
				{
					count++;
				}
			}
			if(count==N-1)
			{
				for(int i=0; i<N; i++)
				{
					System.out.println(Array[i]);
				}
				ExitLoop=false;
			}
		}
	}
}

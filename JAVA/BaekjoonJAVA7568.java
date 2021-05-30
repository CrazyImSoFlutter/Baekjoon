import java.util.*;
public class Main {
	private static Scanner sc = new Scanner(System.in);
	private static int N = sc.nextInt();
	private static int Bulk[][] = new int [N][2];
	private static int Place[] = new int [N];
	public static void main(String args[])
	{
		for(int i=0; i<N; i++)
		{
			Place[i]=1;
			for(int j=0; j<2; j++)
			{
				Bulk[i][j]=sc.nextInt();
			}
		}
		
		for(int i=0; i<N; i++)
		{
			for(int j=0; j<N; j++)
			{
				if(Bulk[i][0]>Bulk[j][0]&&Bulk[i][1]>Bulk[j][1])
				{
					Place[j]++;
				}
			}
		}
		
		for(int i=0; i<N; i++)
		{
			System.out.print(Place[i]+" ");
		}
	}
}

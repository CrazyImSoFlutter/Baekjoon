import java.util.*;
public class Main {
	static Scanner sc = new Scanner(System.in);
	static int N = sc.nextInt();
	static int M = sc.nextInt();
	static int K = sc.nextInt();
	public static void main(String args[])
	{
		int x = 0;
		int y = 0;
		for(int i=0; i<K; i++)
		{
			if(y<M-1)
			{
				y++;
			}
			else if (x<N-1 && y>=M-1)
			{
				x++;
				y=0;
			}
		}
		System.out.println(x+" "+y);
	}
}

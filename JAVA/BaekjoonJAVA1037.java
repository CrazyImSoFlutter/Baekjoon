import java.util.Arrays;
import java.util.Scanner;
public class Main {
	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);
		int M = sc.nextInt();
		int array [] = new int [M];
		for(int i=0; i<M; i++)
		{
			array[i]=sc.nextInt();
		}
		Arrays.sort(array);
		System.out.println(array[0]*array[M-1]);
	}
}

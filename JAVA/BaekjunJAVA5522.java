import java.util.*;
public class Main {
	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);
		int Score[]=new int [5];
		int sum=0;
		for(int i=0; i<5; i++)
		{
			Score[i]=sc.nextInt();
			sum+=Score[i];
		}
		System.out.println(sum);
	}
}

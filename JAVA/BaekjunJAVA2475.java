import java.util.*;
public class Main {
	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);
		int Array [] = new int [5];
		for(int i=0; i<5; i++)
		{
			Array[i]=sc.nextInt();
		}
		int sum=0;
		for(int i=0; i<5; i++)
		{
			sum += Array[i]*Array[i];
		}
		System.out.println(sum%10);
	}
}

import java.util.*;
public class Main {
	private static Scanner sc = new Scanner(System.in);
	private static int N = sc.nextInt();
	public static int selfnumber(int a)
	{
		int sum = a;
		boolean alpha=true;
		while(alpha)
		{
			sum += a % 10;
			a = a / 10;
			if(a==0)
			{
				break;
			}
		}
		return sum;
	}
	public static void main(String args[])
	{
		int count = 0;
		for(int i=1; i<=1000000; i++)
		{
			if(selfnumber(i)==N)
			{
				System.out.println(i);
				count++;
				break;
			}
		}
		if(count == 0)
		{
			System.out.println("0");
		}
	}

}

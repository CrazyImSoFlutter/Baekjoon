import java.util.*;
public class Main {
	private static Scanner sc = new Scanner(System.in);
	private static int N = sc.nextInt();

	public static void main(String args[])
	{
		
		int a=666;
		String alpha = new String();
		
		while(N>0)
		{
			alpha = String.valueOf(a);
			if(alpha.contains("666"))
			{
				N--;
			}
			a++;
		}
		
		System.out.println(a-1);
	
	}
		
}

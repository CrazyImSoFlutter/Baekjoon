import java.util.*;

public class Main {
	private static Scanner sc = new Scanner(System.in);
	private static StringBuilder sb = new StringBuilder();
	private static final int cn = sc.nextInt();
	private static int casearray[] = new int [cn];
	private static boolean primenumber[] = new boolean [10001];
	
	public static void prime(boolean prime [])
	{
		for(int i=0; i<10001; i++)
		{
			prime[i] = true;
		}
		prime[0]=false;
		prime[1]=false;
		for(int i=2; i<10000; i++)
		{
			for(int j=i*2; j<10000; j+=i)
			{
				prime[j]=false;
			}
		}
	}
	
	public static void goldbach(int a, int b ,int c)
	{
		if(a<4 || a>10000 || a%2!=0)
		{
			return;
		}
		else
		{
			if(primenumber[b]==true && primenumber[c]==true)
			{
				sb.append(b + " " + c + "\n");
			}
			
			else 
			{
				b--;
				c++;
				goldbach(a, b, c);
			}
		}
	}
	
	public static void main (String args[])
	{
		prime(primenumber);
		for(int i=0; i<cn; i++)
		{
			casearray[i]=sc.nextInt();
		}
		
		for(int i=0; i<cn; i++)
		{
			goldbach(casearray[i], casearray[i]/2, casearray[i]/2);
		}
		
		System.out.println(sb);
	}
}

import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;
public class Main {
	static BufferedReader bf = new BufferedReader(new InputStreamReader(System.in));
	static int count = 0;
	static int number[];
	static StringBuilder sb = new StringBuilder();
	public static boolean checknumber(int K)
	{
		for(int i=0; i<K-1; i++)
		{
			if(number[i]==number[i+1])
			{
				return true;
			}
		}
		return false;
	}
	
	public static void makenumber(int K, int N)
	{
		number = new int [K];
		if(count==N)
		{
			return;
		}
		for(int i=0; i<K; i++)
		{
			number[i]=K-1-i;
		}
		count++;
		if(count==N)
		{
			for(int k : number)
			{
				sb.append(k);
			}
			System.out.println(sb);
		}
		int checker = 1;
		while(true)
		{
			if(count==N)
			{
				return;
			}
			else if(K==1 && number[0]<9)
			{
				number[0]++;
				count++;
				if(count==N)
				{
					for(int k : number)
					{
						sb.append(k);
					}
					System.out.println(sb);
				}
			}
			else if(checker==K && number[0]<9)
			{
				number[0]++;
				for(int i=1; i<checker; i++)
				{
					number[K-i]=0;
				}
				if(!checknumber(K))
				{
					count++;
					if(count==N)
					{
						for(int k : number)
						{
							sb.append(k);
						}
						System.out.println(sb);
					}
				}
				checker=1;
			}
			else if(K-checker-1<0)
			{
				return;
			}
			else if(number[K-checker]+1< number[K-(checker+1)])
			{
				number[K-checker]++;
				for(int i=1; i<checker; i++)
				{
					number[K-i]=0;
				}
				if(!checknumber(K))
				{
					count++;
					if(count==N)
					{
						for(int k : number)
						{
							sb.append(k);
						}
						System.out.println(sb);
					}
				}
				checker=1;
			}
			else if(number[K-checker]+1>= number[K-(checker+1)])
			{
				checker++;
			}
		}
	}
	
	public static void main(String args[])throws Exception
	{
		int N = Integer.parseInt(bf.readLine());
		for(int i=1; i<=10; i++)
		{
			makenumber(i, N);
		}
		if(count!=N)
		{
			System.out.println(-1);
		}
	}
}

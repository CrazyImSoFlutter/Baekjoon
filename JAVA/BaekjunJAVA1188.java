import java.io.*;
import java.util.*;
public class Main {
	static int answer = 0;
	static BufferedReader bf = new BufferedReader(new InputStreamReader(System.in));
	static int make(int N, int M)
	{
		if(N>M)
		{
			N = N%M;
		}
		if(N==0)
		{
			return answer;
		}
		if(N%M==0)
		{
			return answer;
		}
		int x = M/N;
		if(M%N==0)
		{
			x--;
		}
		answer += x*N;
		make(N, M-x*N);
		return answer;
	}
	public static void main(String args[])throws Exception
	{
		StringTokenizer st = new StringTokenizer(bf.readLine());
		int N = Integer.parseInt(st.nextToken());
		int M = Integer.parseInt(st.nextToken());
		System.out.println(make(N,M));
	}
}

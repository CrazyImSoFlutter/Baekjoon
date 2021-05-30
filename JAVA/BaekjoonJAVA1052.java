import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.*;
public class BaekjunWaterBottle{
	public static int Bottle(int N)
	{
		int counter =0;
		boolean exitLoop = true;
		while(exitLoop)
		{
			if(N%2==1)
			{
				counter++;
			}
			N = N/2;
			if(N==0)
			{
				exitLoop = false;
			}
		}
		return counter;
	}
	public static void main(String args[])throws Exception
	{
		BufferedReader bf = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		StringTokenizer st = new StringTokenizer(bf.readLine());
		ArrayList<Integer> Bottle = new ArrayList<Integer>();
		int N = Integer.parseInt(st.nextToken());
		int K = Integer.parseInt(st.nextToken());
		for(int i=0; i<N; i++)
		{
			Bottle.add(1);
		}
		int count = 0;
		while(true)
		{
			if(N < 1 || N > 10000000 || K < 1 || K > 1000)
			{
				bw.write(String.valueOf(-1));
				bw.close();
				break;
			}
			else if(N < K)
			{
				bw.write(String.valueOf(0));
				bw.close();
				break;
			}
			else if(Bottle(N+count)<=K)
			{
				bw.write(String.valueOf(count));
				bw.close();
				break;
			}
			count++;
		}
		
	}
}

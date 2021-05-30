import java.io.*;
import java.util.Arrays;
import java.util.StringTokenizer;
public class Main {
	static BufferedReader bf = new BufferedReader(new InputStreamReader(System.in));
	public static boolean check(boolean PeopleWhoKnowTruth[], boolean Copy[], int N)
	{
		if(Arrays.equals(PeopleWhoKnowTruth, Copy))
		{
			return false;
		}
		return true;
	}
	
	public static void main(String args[])throws Exception
	{
		StringTokenizer st = new StringTokenizer(bf.readLine());
		int N = Integer.parseInt(st.nextToken());
		int M = Integer.parseInt(st.nextToken());
		StringTokenizer st2 = new StringTokenizer(bf.readLine());
		int K = Integer.parseInt(st2.nextToken());
		int Karray[] = new int [K];
		for(int i=0; i<K; i++)
		{
			Karray[i] = Integer.parseInt(st2.nextToken());
		}
		int Marray[][] = new int [M][];
		for(int i=0; i<M; i++)
		{
			StringTokenizer st3 = new StringTokenizer(bf.readLine());
			int alpha = Integer.parseInt(st3.nextToken());
			Marray[i] = new int [alpha];
			for(int j=0; j<alpha; j++)
			{
				Marray[i][j]=Integer.parseInt(st3.nextToken());
			}
		}
		boolean canLie [] = new boolean [M];
		for(int i=0; i<M; i++)
		{
			canLie[i] = true;
		}
		boolean PeopleWhoKnowTruth [] = new boolean [N];
		for(int i=0; i<N; i++)
		{
			PeopleWhoKnowTruth [i] = false;
		}
		boolean Copy [] = new boolean [N];
		for(int i : Karray)
		{
			PeopleWhoKnowTruth[i-1] = true;
		}
		
		while(check(PeopleWhoKnowTruth, Copy, N))
		{
			for(int i=0; i<N; i++)
			{
				Copy[i] = PeopleWhoKnowTruth[i];
			}
			for(int i=0; i<M; i++)
			{
				for(int j=1; j<=N; j++)
				{
					if(PeopleWhoKnowTruth[j-1])
					{
						for(int h=0; h<Marray[i].length; h++)
						{
							if(Marray[i][h]==j)
							{
								for(int k : Marray[i])
								{
									PeopleWhoKnowTruth[k-1]=true;
								}
							}
						}
					}
				}
			}
		}
		
		for(int i=0; i<M; i++)
		{
			for(int j=0; j<Marray[i].length; j++)
			{
				if(PeopleWhoKnowTruth[Marray[i][j]-1])
				{
					canLie[i] = false;
				}
			}
		}
		int answer = 0;
		for(int i=0; i<M; i++)
		{
			if(canLie[i])
			{
				answer++;
			}
		}
		
		System.out.println(answer);
	}
}

import java.util.*;
public class Main {
	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);
		int L = sc.nextInt();
		int Larray[] = new int [L];
		for(int i=0; i<L; i++)
		{
			Larray[i] = sc.nextInt();
		}
		int N = sc.nextInt();
		Arrays.sort(Larray);
		int Max = 0;
		int min = Larray[L-1];
		int checker = 0;
		for(int i=0; i<L; i++)
		{
			if(N>Larray[i] && Max<Larray[i])
			{
				Max = Larray[i];
			}
		}
		for(int i=0; i<L; i++)
		{
			if(N<Larray[i] && min>Larray[i])
			{
				min = Larray[i];
			}
		}
		for(int i=0; i<L; i++)
		{
			if(N==Larray[i])
			{
				System.out.println(0);
				checker++;
				break;
			}
		}
		if(checker!=1)
		{
			System.out.println((N-Max)*(min-N)-1);
		}
	}
}

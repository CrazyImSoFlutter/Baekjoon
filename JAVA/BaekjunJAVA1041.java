import java.util.Arrays;
import java.util.Scanner;
public class Main {
	static Scanner sc = new Scanner(System.in);
	static long N = sc.nextLong();
	static int Dice [] = new int [6];
	static int ThreeSide[] = new int [8];
	static int TwoSide[] = new int [12];
	
	public static void main(String args[])
	{
		for(int i=0; i<6; i++)
		{
			Dice[i] = sc.nextInt();
		}
		
		ThreeSide[0]=Dice[0]+Dice[1]+Dice[2];
		ThreeSide[1]=Dice[0]+Dice[1]+Dice[3];
		ThreeSide[2]=Dice[0]+Dice[3]+Dice[4];
		ThreeSide[3]=Dice[0]+Dice[2]+Dice[4];
		ThreeSide[4]=Dice[5]+Dice[1]+Dice[2];
		ThreeSide[5]=Dice[5]+Dice[1]+Dice[3];
		ThreeSide[6]=Dice[5]+Dice[3]+Dice[4];
		ThreeSide[7]=Dice[5]+Dice[2]+Dice[4];
		
		int T_cnt = 0;
		for(int i=0; i<6; i++)
		{
			for(int j=i+1; j<6; j++)
			{
				if((i==0 && j==5) || (i==5 && j==0))
				{
					continue;
				}
				else if ((i==2 && j==3) || (i==3 && j==2))
				{
					continue;
				}
				else if ((i==1 && j==4) || (i==4 && j==1))
				{
					continue;
				}
				else
				{
					TwoSide[T_cnt] = Dice[i]+Dice[j];
					T_cnt++;
				}
			}
		}
		Arrays.sort(ThreeSide);
		Arrays.sort(TwoSide);
		Arrays.sort(Dice);
		long answer = 4*ThreeSide[0] + ((N-2)*8+4)*TwoSide[0] + ((N-2)*(N-2)*5+(N-2)*4)*Dice[0]; 
		if(N==1)
		{
			answer = 0;
			for(int i=0; i<5; i++)
			{
				answer += Dice[i];
			}
			
		}
		System.out.println(answer);
	}
}

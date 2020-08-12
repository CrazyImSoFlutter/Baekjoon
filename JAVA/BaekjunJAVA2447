import java.util.*;

public class Main {
	private static final Scanner sc = new Scanner(System.in);
	private static char arr [][];
	
	static void star(int x,int y, int n)
	{
		if(n==1)
		{
			arr[x][y]='*';
			return;
		}
		else
		{
			int m = n/3;
			for(int i=0;i<3;i++)
			{
				for(int j=0;j<3;j++)	
				{
					if(i==1 && j ==1)
					{
						continue;
					}
					star(x+m*i, y+m*j, m);
				}
			}
		}
	}
	
	static public void main(String args[])
	{
		int num = sc.nextInt();
		arr = new char [num][num];
		
		for(int i=0; i<num; i++)//빈칸으로 배열 초기화
		{
			Arrays.fill(arr[i], ' ' );
		}
		
		star(0,0,num);//2차원 배열 재귀함수로 채우기
		
		for(int i=0; i<num; i++)//채워진 2차원 배열 차례대로 한줄씩 출력
		{
			System.out.println(arr[i]);
		}
	}

}

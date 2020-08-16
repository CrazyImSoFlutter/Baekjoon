import java.util.*;

public class Main {
	public static int movenumber = 0;
    public static StringBuilder sb = new StringBuilder();
	private static final Scanner sc = new Scanner(System.in);
	
	public static void hanoitower(int towernumber, int first, int second, int third)
	{
		movenumber++;
		
		if(towernumber == 1)
		{
			sb.append(first + " " + third + "\n");
		}
		else
		{
			hanoitower(towernumber-1,first,third,second);
			sb.append(first + " " + third + "\n");
			hanoitower(towernumber-1,second,first,third);
		}
	}
	
	
	public static void main(String[] args) 
	{
		int N = sc.nextInt();
		hanoitower(N,1,2,3);
		System.out.println(movenumber);
		System.out.println(sb);
	}

}

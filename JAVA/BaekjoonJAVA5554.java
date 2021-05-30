import java.util.*;
public class Main {
	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);
		int array[] = new int [4];
		int sum = 0;
		for(int i=0; i<4; i++)
		{
			array[i]=sc.nextInt();
			sum+=array[i];
		}
		System.out.println(sum/60);
		System.out.println(sum%60);
	}
}

import java.util.*;
public class Main {
	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);
		int Chess [] = new int [6]; 
		for(int i=0; i<6; i++)
		{
			Chess[i] = sc.nextInt();
		}
		System.out.println(1-Chess[0]);
		System.out.println(1-Chess[1]);
		System.out.println(2-Chess[2]);
		System.out.println(2-Chess[3]);
		System.out.println(2-Chess[4]);
		System.out.println(8-Chess[5]);
	}
}

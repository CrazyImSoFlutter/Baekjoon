import java.util.*;
public class Main {
	private static Scanner sc = new Scanner(System.in);
	private static int array[] = new int[3];
	public static void main(String args[])
	{
		while(true)
		{
			for(int i=0; i<3; i++)
			{
				array[i]=sc.nextInt();
			}
			if(array[0]==0)
			{
				break;
			}
			else 
			{
				Arrays.sort(array);
				if(array[2]*array[2]==array[0]*array[0]+array[1]*array[1])
				{
					System.out.println("right");
				}
				else
				{
					System.out.println("wrong");
				}
			}
		}
	}
}

import java.util.*;

public class Main {
	private static Scanner sc = new Scanner(System.in);
	private static int x1 = sc.nextInt();
	private static int y1 = sc.nextInt();
	private static int x2 = sc.nextInt();
	private static int y2 = sc.nextInt();
	private static int array[] = new int[4];
	public static void main(String args[])
	{
		array[0] = y2-y1;
		array[1] = y1;
		array[2] = x1;
		array[3] = x2-x1;
		Arrays.sort(array);
		System.out.println(array[0]);
	}
}

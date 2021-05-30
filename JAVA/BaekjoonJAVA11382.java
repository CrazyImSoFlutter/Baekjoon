import java.math.*;
import java.util.*;
public class Main {
	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);
		BigInteger A = sc.nextBigInteger();
		BigInteger B = sc.nextBigInteger();
		BigInteger C = sc.nextBigInteger();
		System.out.println((A.add(B)).add(C));
	}
}

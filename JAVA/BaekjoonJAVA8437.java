import java.util.*;
import java.math.*;
public class Main {
	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);

		BigInteger N = sc.nextBigInteger();
		BigInteger K = sc.nextBigInteger();
		BigInteger Two = new BigInteger("2");
		
		System.out.println(((N.subtract(K)).divide(Two)).add(K));
		System.out.println((N.subtract(K)).divide(Two));
	}
}

public class Main {
	public static void selfnumber(int a, int b [])
	{
		int sum = a;
		boolean alpha=true;
		while(alpha)
		{
			sum += a % 10;
			a = a / 10;
			if(a==0)
			{
				break;
			}
		}
		if(sum<=10000)
		{
			b[sum]++;
		}
		
	}
	
	public static void main (String args[])
	{
		int b [] = new int[10001];
		for(int i=1;i<10001;i++)
		{
			selfnumber(i, b);
		}
		
		for(int i=1; i<10000;i++) 
		{
			if(b [i] ==0)
			{
				System.out.println(i);
			}
		}
		
	}

}

import java.io.*;
public class Main{
	private static int Arr[], temp[];
	private static void mergeSort(int left, int right)
	{
		if(left>=right)
		{
			return;
		}
		int mid = (left+right)/2;
		mergeSort(left, mid);
		mergeSort(mid+1, right);
		merge(left, mid, right);
	}
	
	private static void merge(int left, int mid, int right)
	{
		int x = left;
		int y = mid+1;
		int k = left;
		while(x<=mid || y<=right)
		{
			if(x<=mid && y<=right)
			{
				if(Arr[x]<=Arr[y])
				{
					temp[k]=Arr[x++];
				}
				else if (Arr[x]>Arr[y])
				{
					temp[k]=Arr[y++];
				}
			}
			else if (x<=mid && y>right)
			{
				temp[k]=Arr[x++];
			}
			else if (x>mid && y<=right)
			{
				temp[k]=Arr[y++];
			}
			k++;
		}
		for(int i=left; i<=right; i++)
		{
			Arr[i]=temp[i];
		}
	}
	public static void main(String args[])throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int N = Integer.parseInt(br.readLine());
		StringBuilder sb = new StringBuilder();
		Arr = new int [N+1];
		temp = new int [N+1];
		for(int i=1; i<=N; i++)
		{
			Arr[i] = Integer.parseInt(br.readLine());
		}
		mergeSort(1,N);
		for(int i=1; i<=N; i++)
		{
			sb.append(Arr[i] + "\n");
		}
		System.out.println(sb);
	}
	
}

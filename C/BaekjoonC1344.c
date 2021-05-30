#include <stdio.h>
#include <math.h>

int combination(int a, int b)
{
	if (a == b || b == 0)
		return 1;
	return combination(a - 1, b - 1) + combination(a - 1, b);
}

long double getCombi(long double percent)
{
	long double two;
	long double three;
	long double five;
	long double seven;
	long double eleven;
	long double thirteen;
	long double fifteen;
	long double seventeen;

	two = pow(percent, 2) * pow(1 - percent, 16) * combination(18, 2);
	three = pow(percent, 3) * pow(1 - percent, 15) * combination(18, 3);
	five = pow(percent, 5) * pow(1 - percent, 13) * combination(18, 5);
	seven = pow(percent, 7) * pow(1 - percent, 11) * combination(18, 7);
	eleven = pow(percent, 11) * pow(1 - percent, 7) * combination(18, 11);
	thirteen = pow(percent, 13) * pow(1 - percent, 5) * combination(18, 13);
	seventeen = pow(percent, 17) * pow(1 - percent, 1) * combination(18, 17);

	return two + three + five + seven + eleven + thirteen + seventeen;
}

int main ()
{
	long double A, B;
	long double Apercent;
	long double Bpercent;
	scanf("%Lf %Lf", &A, &B);

	A = A / 100;
	B = B / 100;
	Apercent = 1 - getCombi(A);
	Bpercent = 1 - getCombi(B);

	printf("%.16Lf",  1 - Apercent * Bpercent);
}

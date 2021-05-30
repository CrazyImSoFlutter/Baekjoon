#include <stdio.h>
#include <math.h>
#include <stdlib.h>

double getans(double *array) {
	double max = 0.0;
	double min = array[0];
	for (int i = 0; i < 3; i++){
		if (max < array[i])
			max = array[i];
		if (min > array[i])
			min = array[i];
	}
	return max - min;
}

int main () {
	double rac[6];
	double segment[3];
	double racline[3];
	double answer;
    double M1, M2;
	for (int i = 0; i < 6; i++){
		scanf("%lf", &rac[i]);
	}
	segment[0] = sqrt(pow(rac[0]-rac[2], 2) + pow(rac[1]-rac[3], 2));
	segment[1] = sqrt(pow(rac[2]-rac[4], 2) + pow(rac[3]-rac[5], 2));
	segment[2] = sqrt(pow(rac[0]-rac[4], 2) + pow(rac[1]-rac[5], 2));
	
	if((rac[2]-rac[0])*(rac[5]-rac[1]) == (rac[3]-rac[1])*(rac[4]-rac[0]))
        printf("%d", -1);
	else {
		racline [0] = (segment[0] + segment[1]) * 2;
		racline [1] = (segment[0] + segment[2]) * 2;
		racline [2] = (segment[1] + segment[2]) * 2;
		printf("%.10lf\n", getans(racline));
	}
}

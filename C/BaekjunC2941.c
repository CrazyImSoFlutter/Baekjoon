#include<stdio.h>

int finder(char *s){
	int i = 0;

	while(*s){
		if (*s == 'c') {
			s++;
			if (*s != '\0' && *s == '=') {
				i++;
				s++;
			} else if (*s != '\0' && *s == '-') {
				i++;
				s++;
			} else if (*s == '\0') {
				i++;
				break;
			} else {
				i++;
			} 
		} else if (*s == 'd') {
			s++;
			if (*s != '\0' && *s == 'z') {
				s++;
				if (*s != '\0' && *s == '=') {
					i++;
					s++;
				}
			} else if (*s != '\0' && *s == '-') {
				i++;
				s++;
			} else if (*s == '\0') {
				i++;
				break;
			} else {
				i++;
			}
		} else if (*s == 'l' || *s == 'n') {
			s++;
			if (*s != '\0' && *s == 'j') {
				i++;
				s++;
			} else if (*s == '\0') {
				i++;
				break;
			} else {
				i++;
			} 
		} else if (*s == 's' || *s == 'z') {
			s++;
			if (*s != '\0' && *s == '=') {
				i++;
				s++;
			} else if (*s == '\0') {
				i++;
				break;
			} else {
				i++;
			}
		} else {
			i++;
			s++;
		}
	}
	return i;
}

int main(){
	char s[100];

	scanf("%s", s);
	printf("%d", finder(s));
}

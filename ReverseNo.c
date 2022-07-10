#include <stdio.h>
#include <stdlib.h>

int main(){

int n ,rem, reverse= 0 ;
printf("\t\"A program t reverse a two digit number\"\n");
printf("Enter a two digit number:");
scanf("%d", &n);
if(n>=10 && n <=99){
        while(n>0)
{
rem= n % 10;
reverse = rem + reverse * 10;
n = n/ 10;
}
printf("The Reverse is: %d", reverse);
}
else
printf("You have to enter a two digit number !!!");
// To reverse  a more than 2 digit number, just remove the if statement
return 0;
}

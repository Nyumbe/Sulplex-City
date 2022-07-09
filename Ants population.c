#include <stdio.h>
#include <stdlib.h>

int main() {

int antno,pincrease,ndays,day=1,population_size;

printf("\nStarting size of red ants:");
scanf("%d",&antno);
if(antno<2){
    printf("\tError! Starting size cannot be less than 2.\n");
}else{
    printf("Average daily population increase:");
    scanf("%d%%",&pincrease);
  if(pincrease<0){
        printf("\tError! Enter a positive value.\n");
  }else{
    printf("Number of days they will multiply:");
    scanf("%d",&ndays);
    if(ndays<1){
        printf("\tError! Enter a value greater than 0.\n");
    }else{

        population_size = antno;
        printf("\nPopulation size at start = %d red ants\n\n",population_size);
do{
population_size=population_size +((population_size*pincrease)/100.0);
    printf("Population size on day %d is %d red ants\n\n",day,population_size);
day=day+1;
}while(day<=ndays);}
}
}
	return 0;
}

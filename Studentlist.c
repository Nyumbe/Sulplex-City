#include <stdio.h>
#include <stdlib.h>

int main(){
int n,i=1;
printf("Hey, how many members are in the class?:");
scanf("%d",&n);
getchar();
char listOfnames[i][50];

do{
    printf("Enter Student %d name:",i);
    fgets(listOfnames[i],50,stdin);
    i++;
}while (i<=n);
printf("\t\"Student List\"\n");
for(i=1;i<=n;i++){
    printf("%d| %s",i,listOfnames[i]);
}

return 0;
}

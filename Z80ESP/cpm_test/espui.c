
#define CONIO_VT100
#include <stdio.h>
#include <conio.h>
#include <stdlib.h>
#include <ctype.h>


printcentered(char *string)
{
    int l=40-(strlen(string)/2);
    while(l>0)
    {
        putch(' ');
        l--;
    }
    puts(string);
}
printcenteredbold(char *string)
{
    int l=40-(strlen(string)/2);
    while(l>0)
    {
        putch(' ');
        l--;
    }
    printf("\e[1m%s\e[0m\n\r",string);
}
printmenu(char opt,char *string,char opt1,char *string1)
{
    if(opt==NULL)
    {
        printf("%41s \e[1m%c\e[0m. %s \n\r"," ",opt1,string1);
        return;
    }
    if(opt1!=NULL)
        printf("    \e[1m%c\e[0m. %-34s \e[1m%c\e[0m. %s \n\r",opt,string,opt1,string1);
    else
        printf("    \e[1m%c\e[0m. %s\n\r",opt,string);
}
printmessage(char *string)
{
    printf("\e[23;2H\e[1m%-60s \e[0m",string);
}

getstring(char *buffer)
{
    char ch;
    int len=0;

    for(;;)
    {
        ch=getchar();

        if((ch=='\n')||(ch=='\r'))
        {
            buffer[len]=0;
            return;
        }

        if((ch=='\b') && (len>0))
        {
            len--;
            putch(' ');
            putch('\b');
        }
        if(isprint(ch))
        {
            buffer[len]=ch;
            len++;
        }
    }
}
long getlong()
{
    long result;
    char buffer[20];
    getstring(buffer);
    sscanf(buffer,"%ld",&result);
    return result;
}
int getint()
{
    int result;
    result=getlong();
    return result;
}
int getbyte()
{
    char result;
    result=getlong();
    return result;
}

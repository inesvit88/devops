    /**
    * Name: StackVuln.c
    * Author: Ron Bowes
    * Date: March 24, 2004
    * To compile: gcc StackVuln.c -o StackVuln
    * Requires: n/a
    *
    * Purpose: This code is vulnerable to a stack overflow if more than
    * 20 characters are entered. The exploit for it was written by
    * Jon Erickson in Hacking: Art of exploitation, but I wrote
    * this vulnerable code independently.
    */
    #include <stdio.h>
    #include <string.h>
    int main(int argc, char *argv[])
    {
        char string[40];
        strcpy(string, argv[1]);
        printf("The message was: %s\n", string);
        printf("Program completed normally!\n\n");
        return 0;
    }

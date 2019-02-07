/*
 * $ gcc stackvuln.c -o stackvuln
 * $ sudo chown root:root stackvuln
 * $ sudo chmod +s ./stackvuln
 *
 *
 */
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>

#define MAX_SIZE 48
#define BUF_SIZE 64

char data1[BUF_SIZE], data2[BUF_SIZE];

struct item {
    char data[MAX_SIZE];
    void *next;
};

int go(void) {
    struct item item1, item2;

    item1.next = &item2;
    item2.next = &item1;
    
    memcpy(item1.data, data1, BUF_SIZE); // Whoops, did we mean MAX_SIZE?
    memcpy(item1.next, data2, MAX_SIZE); // Yes, yes we did.
    
    exit(-1);                            // Exit in shame.
}

void hax(void) {
    execl("/bin/bash", "/bin/bash", "-p", NULL);
}

void readfile(char *filename, char *buffer, int len) {
    FILE *fp;
    
    fp = fopen(filename, "r");
    if (fp != NULL) {
        fread(buffer, 1, len, fp);
        fclose(fp);
    }
}

int main(int argc, char **argv) {
    readfile("data1.dat", data1, BUF_SIZE);
    readfile("data2.dat", data2, BUF_SIZE);
    
    go();
}

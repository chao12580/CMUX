
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/ioctl.h> 
#include <linux/tty.h>
#include <stdio.h>
#include <assert.h>
#include <string.h>
#include <errno.h>
#include <unistd.h>
#include <termios.h>

#include "setgsm.h"

#define N_GSM0710	21
#define DEFAULT_SPEED	B115200 
#define SERIAL_PORT	"/dev/ttyGS2"
#define MUX_PORT0	"/dev/gsmtty1"
#define MUX_PORT1	"/dev/gsmtty2"
#define MUX_PORT2	"/dev/gsmtty3"
#define MUX_PORT3	"/dev/gsmtty4"

int main(int argc, char **argv)
{

    int fd,fd1;
    int ret;
    int ldisc = N_GSM0710;
    struct gsm_config c;
    int nread,nwrite,i;
    fd_set rd;
    char buff[1024]={0};
    extern int errno;
    printf("mux init start\n");
    printf("open the tty port %s\n",SERIAL_PORT);
    
	fd = open(SERIAL_PORT, O_RDWR | O_NOCTTY | O_NDELAY);
    if (fd < 0) {
		printf("open port fail\n");
        perror("open");
        exit(-2);
    }
    //printf("set at cmux\n");
    //write(fd, "ATACMUX00\r\n", 10);
    //write(fd, "test\r", 10);
	//sleep(3);
    printf("set ldisc GSM0710\n");
	ioctl(fd, TIOCSETD, &ldisc);
    printf("get conf\n");
	ioctl(fd, GSMIOC_GETCONF, &c);

	c.initiator = 1;
	c.encapsulation = 0;

	c.mru = 127;
	c.mtu = 127;
    printf("set conf\n");
	ioctl(fd, GSMIOC_SETCONF, &c);
    printf("mux init ok\n");
   // printf("write gsmtty1 port data start \n");  
   // printf("write gsmtty1 port data end \n");   
    daemon(0,0);
	pause(); 
}

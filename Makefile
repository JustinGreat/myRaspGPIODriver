ifeq ($(KERNELRELEASE),)
	KERNELDIR = /home/jamie/superpi3/kernel/linux-sunxi-sunxi-3.4.61_A20
	PWD =$(shell pwd)
modules:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules
	arm-linux-gnueabihf-gcc -o io_control io_control.c

modules_install:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules_install
                          
clean:                    
	rm -rf *.o *.ko .tmp_versions *.mod.c modules.order  Module.symvers	
else                      
	obj-m :=io_control.o  
endif                     
    

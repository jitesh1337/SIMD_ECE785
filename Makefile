#    Makefile for BeagleBoard
# Remote deploy (Use keys to avoid password prompts!)

SSH_IP = 152.14.95.13
SSH_USER = t13
SSH_DIR = /home/t13/proj3

# Project specific
PROJ_NAME = project3
# Compiler options
CC = arm-none-linux-gnueabi-gcc

# *** Need to specify which assembler to use
AS = arm-none-linux-gnueabi-as
OBJDUMP = arm-none-linux-gnueabi-objdump

# Generates non-Neon code, without unrolling 
 CFLAGS = -g -Wall -O1 -mcpu=cortex-a8 -march=armv7-a -mfpu=neon -mfloat-abi=softfp -ffast-math -fsingle-precision-constant $(INCLUDE)

# Generates non-Neon code, with unrolling 
# CFLAGS = -g -Wall -O2 -mcpu=cortex-a8 -march=armv7-a -mfpu=neon -mfloat-abi=softfp -ffast-math -fsingle-precision-constant $(INCLUDE)

# Generates 2-lane Neon code, with unrolling 
# CFLAGS = -g -Wall -O3 -mcpu=cortex-a8 -march=armv7-a -mfpu=neon -mfloat-abi=softfp -ffast-math -fsingle-precision-constant $(INCLUDE)

# Generates 4-lane Neon code, with unrolling 
# CFLAGS = -g -Wall -O3 -mcpu=cortex-a8 -march=armv7-a -mfpu=neon -mfloat-abi=softfp -ftree-vectorize -ftree-vectorizer-verbose=2 -mvectorize-with-neon-quad -ffast-math -fsingle-precision-constant $(INCLUDE)
PRFLAGS = # -pg
# It will compile ALL *.c files in the folder *** also need to specify target fn.o from fn.s
OBJFILES := $(patsubst %.c,%.o,$(wildcard *.c)) fn.o 
# Libraries and header folders
LIBS = -lm
INCLUDE=\
      -I.
# RULES
all: $(PROJ_NAME)
load: all
	@echo "Copying to BeagleBoard..."
	scp $(PROJ_NAME) $(SSH_USER)@$(SSH_IP):$(SSH_DIR)/
	scp *.[cs] $(SSH_USER)@$(SSH_IP):$(SSH_DIR)/

	@echo "Done!"
$(PROJ_NAME): $(OBJFILES)
	$(CC) -o $(PROJ_NAME) $(OBJFILES) $(LIBS) $(PRFLAGS)
%.o: %.c
	$(CC) $(CFLAGS) $(PRFLAGS) -c -o $@ $<
%.s: %.c
	$(CC) $(CFLAGS) $(PRFLAGS) -S  $<
clean:
	rm -f $(OBJFILES)
	rm -f $(PROJ_NAME)
get:
	@echo "Copying from BeagleBoard..."
	scp $(SSH_USER)@$(SSH_IP):$(SSH_DIR)/foo .
	@echo "Done!"

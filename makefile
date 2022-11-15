# Directories
src_d = src
obj_d = .obj
bin_d = .

# Compiler setup
cc     = gcc
cflags = -Wall -g
lflags = 

# Files
src    := $(notdir $(shell find $(src_d) -type -f -name "*.c"))
obj    := $(patsubst %.c, $(obj_d), $(src))
target = main

################################################################
# RECIPES
################################################################
all: $(obj_d) $(target)

clean:
	rm -rf $(target) $(obj_d)

run: 
	./$(target)

################################################################
# HELPER
################################################################
$(obj_d):
	@mkdir -p (obj_d)/

$(target): $(obj)
	@$(cc) -o $@ $(obj) $(ldflags)

$(obj_d)/%.o: $(src_d)/$(src)
	@echo "Building $(notdir $@)"
	@$(cc) $(cflags) -o $@ $<

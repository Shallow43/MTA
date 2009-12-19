# C Static Library Makefile autogenerated by premake
# Don't edit this file! Instead edit `premake.lua` then rerun `make`

ifndef CONFIG
  CONFIG=Debug
endif

ifeq ($(CONFIG),Debug)
  BINDIR := ../bin
  LIBDIR := ../lib
  OBJDIR := ../obj/lua5.1_exe/Debug
  OUTDIR := ../bin
  CPPFLAGS := -MD -DLUA_USE_POSIX -DLUA_USE_DLOPEN -DLUA_USE_READLINE -I "../include"
  CFLAGS += $(CPPFLAGS) -g
  CXXFLAGS := $(CFLAGS)
  LDFLAGS += -L$(BINDIR) -L$(LIBDIR) -Wl,-E -L"../lib" -llua5.1 -lm -lreadline -lhistory -lcurses -lncurses -ldl
  LDDEPS :=
  TARGET := lua5.1
  BLDCMD = $(CC) -o $(OUTDIR)/$(TARGET) $(OBJECTS) $(LDFLAGS) $(RESOURCES)
endif

ifeq ($(CONFIG),Release)
  BINDIR := ../bin
  LIBDIR := ../lib
  OBJDIR := ../obj/lua5.1_exe/Release
  OUTDIR := ../bin
  CPPFLAGS := -MD -DLUA_USE_POSIX -DLUA_USE_DLOPEN -DLUA_USE_READLINE -I "../include"
  CFLAGS += $(CPPFLAGS) -O2
  CXXFLAGS := $(CFLAGS)
  LDFLAGS += -L$(BINDIR) -L$(LIBDIR) -Wl,-E -L"../lib" -llua5.1 -lm -lreadline -lhistory -lcurses -lncurses -ldl
  LDDEPS :=
  TARGET := lua5.1
  BLDCMD = $(CC) -o $(OUTDIR)/$(TARGET) $(OBJECTS) $(LDFLAGS) $(RESOURCES)
endif

OBJECTS := \
	$(OBJDIR)/lua.o \

CMD := $(subst \,\\,$(ComSpec)$(COMSPEC))
ifeq (,$(CMD))
  CMD_MKBINDIR := mkdir -p $(BINDIR)
  CMD_MKLIBDIR := mkdir -p $(LIBDIR)
  CMD_MKOUTDIR := mkdir -p $(OUTDIR)
  CMD_MKOBJDIR := mkdir -p $(OBJDIR)
else
  CMD_MKBINDIR := $(CMD) /c if not exist $(subst /,\\,$(BINDIR)) mkdir $(subst /,\\,$(BINDIR))
  CMD_MKLIBDIR := $(CMD) /c if not exist $(subst /,\\,$(LIBDIR)) mkdir $(subst /,\\,$(LIBDIR))
  CMD_MKOUTDIR := $(CMD) /c if not exist $(subst /,\\,$(OUTDIR)) mkdir $(subst /,\\,$(OUTDIR))
  CMD_MKOBJDIR := $(CMD) /c if not exist $(subst /,\\,$(OBJDIR)) mkdir $(subst /,\\,$(OBJDIR))
endif

.PHONY: clean

$(OUTDIR)/$(TARGET): $(OBJECTS) $(LDDEPS) $(RESOURCES)
	@echo Linking lua5.1_exe
	-@$(CMD_MKBINDIR)
	-@$(CMD_MKLIBDIR)
	-@$(CMD_MKOUTDIR)
	@$(BLDCMD)

clean:
	@echo Cleaning lua5.1_exe
	-@rm -rf $(OUTDIR)/$(TARGET) $(OBJDIR)

$(OBJDIR)/lua.o: lua.c
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CC) $(CFLAGS) -o $@ -c $<

-include $(OBJECTS:%.o=%.d)


#
# config.mk.in -- autoconf template for Vim on Unix		vim:ts=8:sw=8:
#
# DO NOT EDIT config.mk!!  It will be overwritten by configure.
# Edit Makefile and run "make" or run ./configure with other arguments.
#
# Configure does not edit the makefile directly. This method is not the
# standard use of GNU autoconf, but it has two advantages:
#   a) The user can override every choice made by configure.
#   b) Modifications to the makefile are not lost when configure is run.
#
# I hope this is worth being nonstandard. jw.



VIMNAME		= vim
EXNAME		= ex
VIEWNAME	= view

CC		= gcc
DEFS		= -DHAVE_CONFIG_H
CFLAGS		= -g -O2 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=1
CPPFLAGS	= 
srcdir		= .

LDFLAGS		=  -L/usr/local/lib -Wl,--as-needed
LIBS		= -lm -ltinfo -lnsl  -lselinux  -ldl
TAGPRG		= ctags -I INIT+ --fields=+S

CPP		= gcc -E
CPP_MM		= M
DEPEND_CFLAGS_FILTER = | sed 's+-I */+-isystem /+g'
LINK_AS_NEEDED	= yes
X_CFLAGS	=  
X_LIBS_DIR	=  
X_PRE_LIBS	=  -lSM -lICE
X_EXTRA_LIBS	=  -lXdmcp -lSM -lICE
X_LIBS		= -lXt -lX11

LUA_LIBS	= 
LUA_SRC		= 
LUA_OBJ		= 
LUA_CFLAGS	= 
LUA_PRO		= 

MZSCHEME_LIBS	= 
MZSCHEME_SRC	= 
MZSCHEME_OBJ	= 
MZSCHEME_CFLAGS	= 
MZSCHEME_PRO	= 
MZSCHEME_EXTRA	= 
MZSCHEME_MZC	= 

PERL		= 
PERLLIB		= 
PERL_XSUBPP	= 
PERL_LIBS	= 
SHRPENV		= 
PERL_SRC	= 
PERL_OBJ	= 
PERL_PRO	= 
PERL_CFLAGS	= 

PYTHON_SRC	= if_python.c
PYTHON_OBJ	= objects/if_python.o
PYTHON_CFLAGS	= -I/usr/include/python2.7 -pthread -fPIE
PYTHON_LIBS	= -L/usr/lib/python2.7/config-x86_64-linux-gnu -lpython2.7 -lpthread -ldl -lutil -lm -Xlinker -export-dynamic -Wl,-O1 -Wl,-Bsymbolic-functions

PYTHON3_SRC	= 
PYTHON3_OBJ	= 
PYTHON3_CFLAGS	= 
PYTHON3_LIBS	= 

TCL		= 
TCL_SRC		= 
TCL_OBJ		= 
TCL_PRO		= 
TCL_CFLAGS	= 
TCL_LIBS	= 

HANGULIN_SRC	= 
HANGULIN_OBJ	= 

WORKSHOP_SRC	= 
WORKSHOP_OBJ	= 

NETBEANS_SRC	= netbeans.c
NETBEANS_OBJ	= objects/netbeans.o
CHANNEL_SRC	= channel.c
CHANNEL_OBJ	= objects/channel.o
TERM_SRC	= libvterm/src/encoding.c libvterm/src/keyboard.c libvterm/src/mouse.c libvterm/src/parser.c libvterm/src/pen.c libvterm/src/screen.c libvterm/src/state.c libvterm/src/unicode.c libvterm/src/vterm.c
TERM_OBJ	= objects/term_encoding.o objects/term_keyboard.o objects/term_mouse.o objects/term_parser.o objects/term_pen.o objects/term_screen.o objects/term_state.o objects/term_unicode.o objects/term_vterm.o

RUBY		= 
RUBY_SRC	= 
RUBY_OBJ	= 
RUBY_PRO	= 
RUBY_CFLAGS	= 
RUBY_LIBS	= 

AWK		= gawk

STRIP		= strip

EXEEXT		= 
CROSS_COMPILING = 

COMPILEDBY	= 

INSTALLVIMDIFF	= installvimdiff
INSTALLGVIMDIFF	= installgvimdiff
INSTALL_LANGS	= install-languages
INSTALL_TOOL_LANGS	= install-tool-languages

### sed command to fix quotes while creating pathdef.c
QUOTESED        = sed -e 's/[\\"]/\\&/g' -e 's/\\"/"/' -e 's/\\";$$/";/'

### Line break character as octal number for "tr"
NL		= "\\012"

### Top directory for everything
prefix		= /opt/local

### Top directory for the binary
exec_prefix	= ${prefix}

### Prefix for location of data files
BINDIR		= ${exec_prefix}/bin

### For autoconf 2.60 and later (avoid a warning)
datarootdir	= ${prefix}/share

### Prefix for location of data files
DATADIR		= ${datarootdir}

### Prefix for location of man pages
MANDIR		= ${datarootdir}/man

### Do we have a GUI
GUI_INC_LOC	= 
GUI_LIB_LOC	= 
GUI_SRC		= $(NONE_SRC)
GUI_OBJ		= $(NONE_OBJ)
GUI_DEFS	= $(NONE_DEFS)
GUI_IPATH	= $(NONE_IPATH)
GUI_LIBS_DIR	= $(NONE_LIBS_DIR)
GUI_LIBS1	= $(NONE_LIBS1)
GUI_LIBS2	= $(NONE_LIBS2)
GUI_INSTALL	= $(NONE_INSTALL)
GUI_TARGETS	= $(NONE_TARGETS)
GUI_MAN_TARGETS	= $(NONE_MAN_TARGETS)
GUI_TESTTARGET	= $(NONE_TESTTARGET)
GUI_TESTARG	= $(NONE_TESTARG)
GUI_BUNDLE	= $(NONE_BUNDLE)
NARROW_PROTO	= 
GUI_X_LIBS	= 
MOTIF_LIBNAME	= 
GTK_LIBNAME	= 

GLIB_COMPILE_RESOURCES = 
GRESOURCE_SRC = 
GRESOURCE_OBJ = 

GTK_UPDATE_ICON_CACHE = 
UPDATE_DESKTOP_DATABASE = 

### Any OS dependent extra source and object file
OS_EXTRA_SRC	= 
OS_EXTRA_OBJ	= 

### If the *.po files are to be translated to *.mo files.
MAKEMO		= yes

MSGFMT		= msgfmt

# Make sure that "make first" will run "make all" once configure has done its
# work.  This is needed when using the Makefile in the top directory.
first: all

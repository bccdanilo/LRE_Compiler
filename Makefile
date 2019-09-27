CC=/usr/bin/clang++-6.0

LLVMFLAGS=$(shell llvm-config-6.0 --cxxflags)
LLVMLIBS=$(shell llvm-config-6.0 --ldflags --libs all) -lpthread -ldl -lncurses

COMPILER_NAME=$(shell basename "${PWD}")
 
FLAGS=-O3 -DYYERROR_VERBOSE -fexceptions -Wno-deprecated-register -Wno-unused-function
DFLAGS=-ggdb -O0

CPPS=$(patsubst %.cpp,%.o,$(wildcard *.cpp))
YACS=$(patsubst %.y,%_y.o,$(wildcard *.y))
LEXS=$(patsubst %.l,%_l.o,$(wildcard *.l))

all: $(COMPILER_NAME)

%_l.cpp: %.l
	lex -o $@ $<

%_y.cpp: %.y
	bison --defines=bison.hpp -o $@ $<

$(COMPILER_NAME): ${YACS} ${LEXS} ${CPPS}
	${CC} -std=c++11 ${FLAGS} ${DFLAGS} *.o ${LLVMLIBS} -o $@

%.o: %.cpp node.h
	${CC} -std=c++11 ${LLVMFLAGS} ${FLAGS} ${DFLAGS} -c $< -o $@

clean:
	rm -f *_y.cpp *_l.cpp bison.hpp *.o

.SILENT:

# Usage:
#  "make test" or "make all" makes and runs all tests
#  "make clean" removes *.out and *.fidget
#  "make foo.out" makes foo.out from foo.hb or foo.lhb
all: tests

# WARNING: Be sure to include the "./" at the front.  Otherwise, testHarness.hs will fail the whole file.
TESTS=./example-test.out ./three.out ./Lambda.out  ./State.out ./listdriver.out ./redblack.out ./foo.out ./prioset.out ./bug0050.out ./bugIxBound.out ./cases2.out ./requirements.out ./BigArray.out ./md5driver.out ./Mersenne.out

# If any code is broken please move it from TESTS to BROKEN_TESTS and add a comment on why it broke!
# largeword-driver gives "context too weak to prove"
BROKEN_TESTS=./largeword-driver.out


ALB_DIR=$(HOME)/workspace/habit-lang/alb

# MIL locations
MIL_DIR=$(HOME)/workspace/habit-lang/mil-tools
MIL_JAR=mil-tools

CLANG_EXE=/usr/bin/clang
ALB_EXE=$(HOME)/.local/bin/alb

MIL_OPTS=--mil-jar=$(MIL_DIR)/$(MIL_JAR).jar --include-mil $(MIL_DIR)/lib/basic.mil --llvm-main main --mil-opt "--64"

CLANG_OPTS=--clang=$(CLANG_EXE)

ALB_OPTS=--verbose $(MIL_OPTS) $(CLANG_OPTS)


.PHONEY: all tests

all-tests: tests broken

broken: $(BROKEN_TESTS)
	runghc testHarness.hs $(BROKEN_TESTS)

tests: $(TESTS)
	runghc testHarness.hs $(TESTS)


%.out:
	$(ALB_EXE) $*.hb -o $@ $(ALB_OPTS)

clean:
	rm -f *.o
	rm -f *.out
	rm -f $(TESTS)

# Usage:
#  "make test" or "make all" makes and runs all tests
#  "make clean" removes *.out and *.fidget
#  "make foo.out" makes foo.out from foo.hb or foo.lhb
all: tests

# WARNING: Be sure to include the "./" at the front.  Otherwise, testHarness.hs will fail the whole file.
TESTS=./example-test.out ./State.out ./foo.out ./requirements.out


# Need to add them or leave them out?
NON_EXISTENT_TESTS=./prioset.out cases2.out ./bugIxBound.out

# If any code is broken please move it from TESTS to BROKEN_TESTS and add a comment on why it broke!

# largeword-driver gives "context too weak to prove"
# ---------------

# three.out fails because
# --------
# external primIncIx$5cg9 {primIncIx 3} :: Ix 3 -> Maybe__Ix_3
#          ^
# No generated implementation: Bitdata representations ("b" pass) required

# Lambda.out fails because:
# ----------
# Context too weak to prove:
    # Monad Maybe arising at Lambda.hb:24:20-27
    # In Lambda.hb

# listdriver.hb fails because:
# -------------
# Undefined symbols for architecture x86_64:
#   "_alloc", referenced from:
#       _func_b1112 in listdriver-557a89.o
#       _func_b1535 in listdriver-557a89.o
#       _func_b739 in listdriver-557a89.o
#       _func_b785 in listdriver-557a89.o
#       _func_b531 in listdriver-557a89.o
#       _func_b563 in listdriver-557a89.o
#       _func_b769 in listdriver-557a89.o
#       ...
#   "_halt", referenced from:
#       _func_b498 in listdriver-557a89.o
# ld: symbol(s) not found for architecture x86_64

# redblack.hb fails becuase
# INTERNAL ERROR: multiple alternatives for B$58g4
# java.lang.Exception
# 	at debug.Internal.error(Unknown Source)
# 	at mil.CfunAlt.cfunsUsed(Unknown Source)
# 	at mil.CfunAlt.cfunsUsed(Unknown Source)
# 	at mil.CfunAlt.cfunsUsed(Unknown Source)
# 	at mil.Case.cfunSimplify(Unknown Source)
# 	at mil.Block.cfunSimplify(Unknown Source)
# 	at mil.MILProgram.cfunSimplify(Unknown Source)
# 	at mil.MILProgram.cfunRewrite(Unknown Source)
# 	at driver.Main.process(Unknown Source)
# 	at driver.Main.run(Unknown Source)
# 	at driver.Main.main(Unknown Source)

# bug0050.hb fails because
# Reading "miniprelude.hb":
# "miniprelude.hb" (line 154, column 20):
# unexpected "("
# expecting "," or "::"

# BigArray.hb fails because
# Reading "miniprelude.hb":
# "miniprelude.hb" (line 154, column 20):
# unexpected "("
# expecting "," or "::"

# md5driver.hb fails because
# Reading "miniprelude.hb":
# "miniprelude.hb" (line 154, column 20):
# unexpected "("
# expecting "," or "::"

# Mersenne.out fails because
# Reading "miniprelude.hb":
# "miniprelude.hb" (line 154, column 20):
# unexpected "("
# expecting "," or "::"

BROKEN_TESTS=./largeword-driver.out ./three.out ./Lambda.out ./listdriver.out  ./redblack.out ./bug0050.out ./BigArray.out ./md5driver.out ./Mersenne.out


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
	$(ALB_EXE) $*.hb -o $@.out $(ALB_OPTS)

clean:
	rm -f *.o
	rm -f *.out
	rm -f $(TESTS)

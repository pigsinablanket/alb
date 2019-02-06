# executables to be produced
TARGETS=ilab alb

# This directory stores the executables for alb and ilab; This path should be added to $PATH
BINDIR = $(HOME)/.cabal/bin

.PHONY: all alb ilab

all: $(TARGETS) install-ilab install-ilab

alb:
	cabal new-build --user alb --symlink-bindir=$(BINDIR)

ilab:
	cabal new-build --user ilab --symlink-bindir=$(BINDIR)

install-alb:
	cabal new-install --user alb --symlink-bindir=$(BINDIR)

install-ilab:
	cabal new-install --user ilab --symlink-bindir=$(BINDIR)


# This does not work
# tests: install-alb install-ilab
#        alb -i tests -q main $(TEST)

clean:
	rm -fr $(TARGETS) $(OBJDIR) .cabal-sandbox dist-newstyle dist $(BINDIR)/alb $(BINDIR)/ilab 

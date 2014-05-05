A2A=audit2allow
CHKM=checkmodule
MODPKG=semodule_package

SEMODS=$(wildcard *)
TES=$(wildcard */*.te)
MODS=$(TES:%.te=%.mod)
PPS=$(TES:%.te=%.pp)

.PHONY: all clean

all: $(PPS)

clean:
	- rm -f $(PPS) $(MODS)

%: %/%.pp

%.pp: %.mod
	semodule_package -o $@ -m $<

%.mod: %.te
	checkmodule -M -m -o $@ $<


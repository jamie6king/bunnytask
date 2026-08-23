EXE := bunnytask
HARE := hare
PREFIX := /usr/local

$(EXE):
	$(HARE) build -o $@

install: $(EXE)
	mkdir -p $(PREFIX)/bin/
	cp $^ $(PREFIX)/bin/

uninstall:
	$(RM) $(PREFIX)/bin/$(EXE)

clean:
	$(RM) $(EXE)

check:
	$(HARE) test

.PHONY: check clean install uninstall

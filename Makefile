EXE := bunnytask
HARE ?= hare
PREFIX ?= /usr/local

ifdef DEBUG
	HAREFLAGS += -lc
	LDFLAGS += -fsanitize=address
endif

ifdef RELEASE
    HAREFLAGS += -R
endif

$(EXE):
	LDFLAGS=$(LDFLAGS) $(HARE) build $(HAREFLAGS) -o $@

install: $(EXE)
	mkdir -p $(PREFIX)/bin/
	cp $^ $(PREFIX)/bin/

uninstall:
	$(RM) $(PREFIX)/bin/$(EXE)

clean:
	$(RM) $(EXE)

check:
	LDFLAGS=$(LDFLAGS) $(HARE) test $(HAREFLAGS)

.PHONY: check clean install uninstall

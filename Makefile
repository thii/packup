DESTDIR := /usr/local

.PHONY: all run clean

all:
	swift build

install: all
	install -d "$(DESTDIR)/bin"
	install -C ".build/debug/packup" "$(DESTDIR)/bin/"

clean:
	rm -rf Packages
	swift build --clean

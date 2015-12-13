.PHONY: all run clean

all:
	swift build

clean:
	rm -rf Packages
	swift build --clean

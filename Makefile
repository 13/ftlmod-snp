.ONESHELL:

build: clean
	mkdir -p out
	cd src/
	zip -r ScrapNoPursuit.ftl *
	cd ..
	mv -v src/ScrapNoPursuit.ftl out/ScrapNoPursuit.ftl

install: build
	# Change to wherever you install Slipstream Mod Manager,
	# if you want to use this
	cp -v out/ScrapNoPursuit.ftl  $(HOME)/.opt/ftlmod/mods/

clean:
	rm -f src/ScrapNoPursuit.ftl out/ScrapNoPursuit.ftl

STRING1 = "Last updated on "


RESOURCEDIR = "css"
TARGETDIR = "build"


SOURCES = $(wildcard *.md)
HTMLs = $(patsubst %.md,build/%.html,$(SOURCES))
TEMPFILE = build/sdfgsdfs7fs8d7tfgsduifgsdi5234j

all: mkdir copy_resources $(HTMLs)

mkdir:
	mkdir -p $(TARGETDIR)

copy_resources:
	cp -r $(RESOURCEDIR) $(TARGETDIR)

build/%.html: %.md
	cat $< > $(TEMPFILE)
	echo "\n\\ \n\n\\ \n\n***\n\n<span class="footer">*$(STRING1) `stat -c %Y Makefile  | date +'%b %d, %Y'`.*</span>" >> $(TEMPFILE)
	pandoc --mathjax -t html5 -s -c $(RESOURCEDIR)/style.css $(TEMPFILE) -o $@
	rm -f $(TEMPFILE)

clean: 
	rm -rf $(TARGETDIR)

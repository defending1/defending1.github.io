STRING1 = "Last update:"

RESOURCEDIR = "css"
TARGETDIR = "public"

SOURCES = $(wildcard *.md)
HTMLs = $(patsubst %.md,public/%.html,$(SOURCES))
TEMPFILE = public/sdfgsdfs7fs8d7tfgsduifgsdi5234j

all: mkdir copy_resources $(HTMLs) sitemap

mkdir:
	mkdir -p $(TARGETDIR)

copy_resources:
	cp -r $(RESOURCEDIR) $(TARGETDIR)

public/%.html: %.md
	cat $< > $(TEMPFILE)
	echo "\n\\ \n\n\\ \n\n***\n\n<span class="footer">*$(STRING1) `stat -c %Y Makefile  | date +'%b %d, %Y'`.*</span>" >> $(TEMPFILE)
	pandoc --mathjax -t html5 -s -c $(RESOURCEDIR)/style.css $(TEMPFILE) -o $@
	rm -f $(TEMPFILE)

clean: 
	rm -rf $(TARGETDIR)

sitemap:
	$(shell ./sitemap.sh)

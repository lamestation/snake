ADOC_FILES = $(shell find -name \*.adoc -type f)
XML_FILES = $(patsubst %.adoc,%.xml,$(ADOC_FILES))
MD_FILES = $(patsubst %.xml,%.md,$(XML_FILES))

.PHONY: all clean

all: $(MD_FILES)

%.xml: %.adoc
	asciidoctor -b docbook -o $@ $^	

%.md: %.xml
	pandoc -f docbook -t markdown -o $@ $^

clean:
	rm -f $(XML_FILES) $(MD_FILES)

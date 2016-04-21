# 'Makefile'
MARKDOWN = pandoc --from markdown_github --to html -c style.css --standalone
all: $(patsubst %.md,%.html,$(wildcard *.md)) Makefile

clean:
	rm -f $(patsubst %.md,%.html,$(wildcard *.md))
	rm -f *.bak *~

%.html: %.md
	$(MARKDOWN) $< --output $@

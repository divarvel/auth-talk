all: mermaid slides-light.html

standalone: slides.html

slides-light.html: slides.md template.html
	pandoc -t dzslides \
		   --template template.html \
	       -s slides.md \
		   -o slides-light.html

slides.html: slides.md template.html
	pandoc -t dzslides \
		   --self-contained \
		   --template template.html \
	       -s slides.md \
		   -o slides.html

dependencies:
	npm ci

mermaid:
	./mmd.sh

clean:
	-rm slides.html
	-rm slides-light.html

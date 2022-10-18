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

upload:
	aws --profile clever --endpoint-url https://cellar-c2.services.clever-cloud.com s3 cp --acl public-read slides.html s3://clementd-files/devfest-biscuit.html

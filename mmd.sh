#!/bin/sh

npm install @mermaid-js/mermaid-cli

cd assets/

for i in *.mmd; do
    [ -f "$i" ] || break
    echo $i
    ../node_modules/.bin/mmdc -i $i -o $(basename $i .mmd).svg
done

ls

run_test:
	make -C test test

run_clitests:
	make -C test clitests

%.html: %.md
	sed "s/\.md)/\.html)/g" $< | pandoc -s --css styles.css -f markdown -t html -o $@ 

docs: README.html docs/Configuration.html

autoupdate_docs:
	while true; do sleep 2; make -s docs; done

manpages:
	tools/build_manpages.py

clean:
	rm -f README.html docs/*.html

# latex engine parameters
engine=lualatex
#engine=xelatex
flags=--synctex=1 --interaction=nonstopmode --file-line-error

# multiple files + clean environment
all: resume-pdf letter-pdf end

# single files + clean environment
resume: resume-pdf end
letter: letter-pdf end
spellcheck: resume-spellcheck letter-spellcheck
end: clean success

# single files
resume-pdf:
	$(engine) $(flags) "resume.tex" | texlogfilter

letter-pdf:
	$(engine) $(flags) "letter.tex" | texlogfilter
	
resume-spellcheck:
	textidote "resume.tex" > "spellcheck-resume.html"

letter-spellcheck:
	textidote "letter.tex" > "spellcheck-letter.html"

clean:
	# remove eventual helper files to restore a clean environment
	rm -f **.acn **.acr **.alg **.aux **.auxlock **.bcf **.bib~* **.bit **.blg **.bbl **.glg **.glo **.gls **.glsdefs **.ist **.lof **.log **.lol **.lot **.glo **.glx **.gxg **.gxs **.idx **.ilg **.ind **.out **.url **.run.xml **.svn **.tdo **.toc **.vrb **.synctex.gz **.snm **.nav **.vbr

success:
	# show a success message
	echo "[OK] Documents generated successfully"

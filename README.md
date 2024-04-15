<!--
// ┌───────────────────────────────────────────────────────────────┐
// │ Contents of README.md                                         │
// ├───────────────────────────────────────────────────────────────┘
// │
// ├──┐Business Class
// │  ├── Screenshots
// │  ├── Requirements
// │  └── Usage
// │
// └───────────────────────────────────────────────────────────────
-->

# Business Class

A boring LaTeX template for your résumé and cover letter

## Screenshots

See the [example](/example/) folder for PDFs generated with this class.

<p align="middle">
  <img align="top" src="/example/resume-image.avif" width="28%"/>
  <img align="top" src="/example/resume.avif" width="28%"/>
  <img align="top" src="/example/letter.avif" width="28%"/>
</p>

## Requirements

To use this LaTeX template, you need:

- A recent LaTeX distribution to load the required packages, such as TeXLive 2023 or MiKTeX 
- A LaTeX editor to edit and generate PDFs documents
- In alternative, a text editor of your choice and [make](https://www.gnu.org/software/make/manual/make.html) will do the trick
- [TeXtidote](https://sylvainhalle.github.io/textidote/) for spellchecking (optional)


## Usage

Customize the files "resume.tex" and "letter.tex", then generate the the output PDFs with your LaTeX editor.

If you are using `make`, you can run the following commands:

```bash
 # business.cls + resume.tex -> resume.pdf
make resume

 # business.cls + letter.tex -> letter.pdf
make letter

 # resume.tex -> spellcheck-resume.html
 # letter.tex -> spellcheck-letter.html
make spellcheck
```

For detailed résumé options, see [USAGE-RESUME.md](USAGE-RESUME.md).

For detailed cover letter options, see [USAGE-LETTER.md](USAGE-LETTER.md).


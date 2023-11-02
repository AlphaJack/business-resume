<!--
┌───────────────────────────────────────────────────────────────┐
│ CONTENTS OF README.md                                         │
├───────────────────────────────────────────────────────────────┘
│
├──┐Business
│  ├── SCREENSHOTS
│  ├── REQUIREMENTS
│  └──┐USAGE
│     ├──┐RESUME
│     │  ├── PREAMBLE
│     │  └──┐BODY
│     │     ├── HEADER
│     │     ├── SECTIONS
│     │     ├── ENTRIES
│     │     └── VARIANTS
│     └──┐LETTER
│        ├── PREAMBLE
│        └──┐BODY
│           ├── HEADER
│           ├── SALUTATION
│           ├── OPENING
│           ├── QUALIFICATIONS
│           ├── CLOSING
│           └── SIGN-OFF
│
└───────────────────────────────────────────────────────────────
-->

# Business

A boring LaTeX template for your résumé and cover letter

## SCREENSHOTS

See the [example](/example/) folder for PDFs generated with this class.

<p align="middle">
  <img align="top" src="/example/resume.png" width="47%"/>
  <img align="top" src="/example/letter.png" width="47%"/>
</p>

## REQUIREMENTS

To use this LaTeX template, you need:

- A recent LaTeX distribution to load the required packages, such as TeXLive 2023 or MiKTeX 
- A LaTeX editor to edit and generate PDFs documents
- In alternative, a text editor of your choice and [make](https://www.gnu.org/software/make/manual/make.html) will do the trick
- [TeXtidote](https://sylvainhalle.github.io/textidote/) for spellchecking (optional)


## USAGE

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

The following sections will explain how to customize your résumé and cover letter.

### RESUME

#### PREAMBLE

In your document preamble, you should have at least this:

```latex
\author{Firstname Lastname}
\title{Firstname Lastname Resume}

\documentclass[a4paper,11pt]{business}
```

If you know you want a resume longer than one page, add the `long` option:

```latex
\documentclass[a4paper,11pt,long]{business}
```

To set a custom font:

```latex
\setmainfont{Minion 3}
```

#### BODY

##### HEADER

In your document body, start with an header:

```latex
\linkedin{firstnamelastname}{Firstname Lastname}\\
\mobile{+398888888888}
\mail{firstnamelastname@mail.com}
\city{Milan, Italy}
```

##### SECTIONS

Divide your resume in sections:

```latex
\section{Profile}

%[...]
 
\section{Education}

%[...]

\section{Experience}

%[...]

\section{Extracurriculars}

%[...]

\section{Skills}

%[...]
```

##### ENTRIES

Add entries to any section:

```latex
% 
\entry
 {Company/Institution}
 {Job Title/Degree}
 {Date begin}
 {Date end}
 {City, State/Country}{
 \begin{itemize}
  \item Achieved this...
  \item Achieved that...
 \end{itemize}
}
```

For simple lists, you can use `itemize` without any entry:

```latex
\section{Skills}

\begin{itemize}
 \item Spoken languages: English (native), French (proficient), Spanish (intermediate)
 \item Programming languages: Javascript (Vue, React), Rust (Actix, Rocket)
\end{itemize}
```

##### VARIANTS

If you want fancier lists with vertically linked items (as in LinkedIn), add the `linked` option:

```latex
\documentclass[a4paper,11pt,linked]{business}
```

This operation requires to run the LaTeX engine twice, without deleting temporary files in between (see "Makefile").

### LETTER

#### PREAMBLE

In your document preamble, you should have at least this (mind the `letter` class option):

```latex
\author{Firstname Lastname}
\title{Firstname Lastname Resume}

\documentclass[a4paper,11pt,letter]{business}
```

To set a custom font:

```latex
\setmainfont{Minion 3}
```

#### BODY

##### HEADER

In your document body, start with an header:

```latex
\linkedin{firstnamelastname}{Firstname Lastname}\\
\mobile{+398888888888}
\mail{firstnamelastname@mail.com}
\city{Milan, Italy}
```

##### SALUTATION

The American style salutation generally looks like this:

```latex
% add this to fix spacing: border-header space is the same as header-salutation
\vspace{\dimexpr 10mm-\baselineskip\relax}

% date
\today

% company name and address
ABC Consulting
150 Broadway
New York, NY 10101

% use "Mr./Ms. XXXXXX" instead of "Hiring Manager" if you know him/her
Dear Hiring Manager,
```

##### OPENING

Write normally stating your interest for the company and the position.
Introduce your main skills and motivation.

```latex
I am a first year MBA student at the Wharton School writing to apply for a consulting position in
your summer associate program. I am particularly interested in working in the Health Care
practice of your New York office. After attending your company presentation and speaking with
several consultants from your firm, including John Johnson of the Philadelphia office, I was
excited by the opportunity to contribute to ABC Consulting’s innovative work in the health care
field. Furthermore, I was impressed by the excellent structure of the summer program, and ABC
Consulting’s strong reputation for focusing on both strategy and implementation.
```

##### QUALIFICATIONS

Link your skills and motivation with the job, eventually using bullet lists.
Highlight your achievements without bragging.

```latex
As a faculty member at University of Pennsylvania Medical School, I led a number of basic
science projects in diverse disease areas enjoying the opportunity to create and confirm
hypothesis. (EXAMPLE) I also had the opportunity to gain managerial experience by
collaborating closely with teams of biomedical researchers and ensuring the team thrived in
environments of uncertainty. (EXAMPLE - include sentence here about quant skills and an
example of how you used them). My biomedical science training coupled with my strong
leadership experiences and extensive quantitative skills will enable me to provide value to ABC
Consulting and its clients.
```

##### CLOSING

Reiterate that with your skills and motivation you can bring a positive contribution.
Call to action by expressing your interest in an interview.
Thank the reader for his time and consideration.

```latex
I look forward to speaking with you or your representative when you visit campus in February.
In case you require additional information, please feel free to contact me at 215-XXX-XXXX.
Thank you very much for your consideration
```

##### SIGN-OFF

Close the letter and write your name.
If you want to be fancy, you can add a signature image in JPEG, PNG or PDF format.

```latex
Sincerely,

\adjustimage{width=40mm}{signature}

Firstname Lastname
```

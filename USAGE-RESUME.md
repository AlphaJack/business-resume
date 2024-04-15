<!--
// ┌───────────────────────────────────────────────────────────────┐
// │ Contents of USAGE-RESUME.md                                   │
// ├───────────────────────────────────────────────────────────────┘
// │
// ├──┐Résumé
// │  ├── Preamble
// │  └──┐Body
// │     ├── Header
// │     ├── Sections
// │     └── Entries
// │
// └───────────────────────────────────────────────────────────────
-->

# Résumé

The following sections will explain how to customize your résumé.

## Preamble

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

## Body

### Header

In your document body, define the header content:

```latex
% image in JPEG, PNG or PDF format, without extension
\avatar{photo}
\name{Firstname Lastname}
\city{Milan, Italy}
\mobile{+398888888888}
\mail{firstnamelastname@mail.com}
\website{https://mywebsite.com/}
```

To print a header with an image, specify:

```latex
\thispagestyle{image}
```

### Sections

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

### Entries

Add entries to any section:

```latex
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

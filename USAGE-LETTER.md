<!--
// ┌───────────────────────────────────────────────────────────────┐
// │ Contents of USAGE-LETTER.md                                   │
// ├───────────────────────────────────────────────────────────────┘
// │
// ├──┐Letter
// │  ├── Preamble
// │  └──┐Body
// │     ├── Header
// │     ├── Salutation
// │     ├── Opening
// │     ├── Qualifications
// │     ├── Closing
// │     └── Sign-off
// │
// └───────────────────────────────────────────────────────────────
-->

# Letter

The following sections will explain how to customize your cover letter.

## Preamble

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

## Body

### Header

In your document body, define the header content:

```latex
\avatar{photo}
\name{Firstname Lastname}
\city{Milan, Italy}
\mobile{+398888888888}
\mail{firstnamelastname@mail.com}
\website{https://mywebsite.com/}
```

### Salutation

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

### Opening

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

### Qualifications

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

### Closing

Reiterate that with your skills and motivation you can bring a positive contribution.
Call to action by expressing your interest in an interview.
Thank the reader for his time and consideration.

```latex
I look forward to speaking with you or your representative when you visit campus in February.
In case you require additional information, please feel free to contact me at 215-XXX-XXXX.
Thank you very much for your consideration
```

### Sign-off

Close the letter and write your name.
If you want to be fancy, you can add a signature image in JPEG, PNG or PDF format.

```latex
Sincerely,

\adjustimage{width=40mm}{signature}

Firstname Lastname
```

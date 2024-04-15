% ┌───────────────────────────────────────────────────────────────┐
% │ Contents of business.cls                                      │
% ├───────────────────────────────────────────────────────────────┘
% │
% ├── LICENSE
% ├──┐CLASS
% │  └── DEFAULTS
% ├── PACKAGES
% ├──┐STYLE
% │  ├── VARIOUS
% │  ├── LENGHTS
% │  ├── ENUMITEM
% │  ├── FANCYHDR
% │  ├── FONTSPEC
% │  ├── TITLESEC
% │  ├── HYPERREF
% │  └── COVER LETTER ADJUSTMENTS
% ├──┐COMMANDS
% │  └──┐NEW MACROS
% │     ├── HEADER
% │     └── BODY
% │
% └───────────────────────────────────────────────────────────────

% ################################################################ LICENSE

% business.cls
% Copyright 2024 Jack Coleman
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   https://www.latex-project.org/lppl.txt
% and version 1.3c or later is part of all distributions of LaTeX
% version 2008 or later.
%
% This work has the LPPL maintenance status `maintained'.
%
% The Current Maintainer of this work is Jack Coleman.
%
% This work consists of the file business.cls

% ################################################################ CLASS

% this business class is best way to get your application far

\NeedsTeXFormat{LaTeX2e}[2022-11-01]
\ProvidesClass{business}[2024-04-20. A boring LaTeX template for your résumé and cover letter]

% ################################ DEFAULTS

% pass all unknown options to the article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

% process all invoked options
\ProcessOptions\relax

\LoadClass{article}

% ################################################################ PACKAGES

% image loading in cover letter
\RequirePackage{adjustbox}
% localization
\RequirePackage[english]{babel}
% sections
% loads hyperref for custom links and metadata
\RequirePackage{bookmark}
% name and contact info in header
\RequirePackage{fancyhdr}
% custom lists
\RequirePackage[shortlabels]{enumitem}
% custom font
\RequirePackage{fontspec}
% custom margins
\RequirePackage{geometry}
%\RequirePackage[showframe]{geometry}
% improved spacing
\RequirePackage[nopatch=footnote]{microtype}
% custom section headers
\RequirePackage{titlesec}

% ################################################################ STYLE

% ################################ VARIOUS

\pagestyle{empty}

% ################################ LENGHTS

% no text indentation
\parindent=0mm

% paragraph spacing for cover letter, 0mm in resume, \baselineskip in letter
\parskip=0mm

% page margins
\newgeometry{
 includehead,
 includefoot,
 top=10mm,
 right=20mm,
 bottom=10mm,
 left=20mm
}

% stretch spaces so last line is placed at the end of the page
% no need to
%\flushbottom

% header and image
\newlength{\imageHeight}
\setlength{\imageHeight}{25mm}

% ################################ ENUMITEM

% full circle for first level
\renewcommand{\labelitemi}{$\bullet$}
% empty circle for second level
\renewcommand{\labelitemii}{$\circ$}

% item lists
\setlist{
 nosep,
 wide=0mm,
 leftmargin=1em,
 %listparindent=5mm,
 before={\vspace{0.1\baselineskip}},
 after={\vspace{0.5\baselineskip}}
}

% ################################ FANCYHDR

%\setlength{\headheight}{20mm}

\fancyhf{}
\renewcommand{\headrulewidth}{0mm}
\renewcommand{\footrulewidth}{0mm}

\fancypagestyle{text}{
 \setlength{\headheight}{10mm}
 \setlength{\headsep}{\baselineskip}
 % output
 \fancyhead[L]{\usebox{\mobileText}}
 \fancyhead[C]{\usebox{\nameText} \\ \usebox{\mailText}}
 \fancyhead[R]{\usebox{\cityText}}
}

\fancypagestyle{image}{
 \setlength{\headheight}{\imageHeight}
 \setlength{\headsep}{0mm}
 % set length of 3 columns
 \newlength{\contactLenght}
 \newlength{\nameLength}
 \settowidth{\nameLength}{\usebox{\nameText}}
 \setlength{\contactLenght}{\dimexpr \textwidth-\nameLength-\imageHeight \relax}
 % output
 \fancyhead[L]{\parbox[][\headheight][t]{\contactLenght}{\usebox{\cityText} \\ \usebox{\mobileText} \\ \usebox{\mailText} \\ \usebox{\websiteText}}}
 \fancyhead[C]{\parbox[][\headheight][t]{\nameLength}{\usebox{\nameText}}}
 \fancyhead[R]{\parbox[][\headheight][t]{\imageHeight}{\usebox{\avatarImage}}}
}

% ################################ FONTSPEC

\defaultfontfeatures[Minion 3]{
 Kerning=On,
 UprightFont={* Regular},
 BoldFont={* Bold},
 ItalicFont={* Italic},
 BoldItalicFont={* Bold Italic},
 SizeFeatures={
  {Size={-8.4},Font=* Caption},
  {Size={8.4-13},Font=*},
  {Size={13-19.9},Font=* Subhead},
  {Size={19.9-},Font=* Display}
 }
}

% ################################ TITLESEC

% add spacing to section
% if resume is longer than one page, don't try to equalize spaces
% but start appropriately in a new page
\@ifclasswith{business}{long}{% if class option passed
 \RequirePackage{needspace}
 \RequirePackage{xpatch}
 \titlespacing{\section}{0mm}{\baselineskip}{0.4\baselineskip}
 \pretocmd{\section}{\needspace{3\baselineskip}}{}{}
}{% else class option not passed
 \titlespacing{\section}{0mm}{\fill}{0.4\baselineskip}
}

\titleformat{name=\section}% command
 {\Large\scshape}% format
 {}% label
 {0mm}% separator
 {}% before title
 [{\titlerule[0.5mm]}]% after title

% ################################ HYPERREF

\hypersetup{
 hidelinks,
 pdfauthor={\@author},
 pdftitle={\@title},
 pdfsubject={Résumé},
 pdfkeywords={resume, résumé, curriculum vitae},
 pdfproducer={LaTeX},
 % pdf will be opened with horizontal or vertical fit
 pdfstartview=Fit,
 %pdfstartview=FitV,
}

% ################################ COVER LETTER ADJUSTMENTS

\@ifclasswith{business}{letter}{% if class option passed
 \parskip=\baselineskip
 \setlist{
  wide=0mm,
  leftmargin=1em,
  itemsep=\dimexpr 0.1\baselineskip\relax,
  before={\vspace{-\baselineskip}},
  after={\vspace{-\baselineskip}}
 }
}{}% else class option not passed

% ################################################################ COMMANDS

% ################################ NEW MACROS

% ################ HEADER

% use \savebox to store variables, and call them in header creation with \usebox
% https://latex.org/forum/viewtopic.php?t=7969
\newsavebox{\cityText}
\newsavebox{\websiteText}
\newsavebox{\mailText}
\newsavebox{\mobileText}
\newsavebox{\nameText}
\newsavebox{\avatarImage}

\sbox{\cityText}{City}
\sbox{\websiteText}{}
\sbox{\mailText}{john@example.org}
\sbox{\mobileText}{+393334445566}
\sbox{\nameText}{John Doe}
\sbox{\avatarImage}{\adjustimage{height=\imageHeight,width=\imageHeight,rndcorners=0.5\imageHeight}{example-image-a}}

\newcommand{\name}[1]{\sbox{\nameText}{\Large\textbf{\MakeUppercase{#1}}}}
\newcommand{\website}[1]{\sbox{\websiteText}{\href{#1}{#1}}}
\newcommand{\mail}[1]{\sbox{\mailText}{\href{mailto:#1}{#1}}}
\newcommand{\mobile}[1]{\sbox{\mobileText}{\href{tel:#1}{\large#1}}}
\newcommand{\city}[1]{\sbox{\cityText}{#1}}
\newcommand{\avatar}[1]{\sbox{\avatarImage}{\adjustimage{height=\imageHeight,width=\imageHeight,rndcorners=0.5\imageHeight}{#1}}}

% ################ BODY

% hide text
\newcommand{\multilinecomment}[1]{}

% resume entry
% 1 university/organization/company, 2 title, 3 begin date, 4 end date, 5 location, 6 itemize
\newcommand{\entry}[6]{
 \textbf{#1 \hfill #3 -- #4}\\
 \textit{#2} \hfill \textit{#5}\\[-\baselineskip]
 #6
 % remove for tighter spaces between entries
 \vspace{0.3\baselineskip}
}

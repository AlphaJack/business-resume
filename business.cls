% ┌───────────────────────────────────────────────────────────────┐
% │ CONTENTS OF business.cls                                      │
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
% │  ├──┐FONTSPEC
% │  │  ├── TITLESEC
% │  │  └── HYPERREF
% │  └── LETTER SPACING
% ├──┐COMMANDS
% │  ├── NEW MACROS
% │  └── LINKED LIST
% │
% └───────────────────────────────────────────────────────────────

% ################################################################ LICENSE

% business.cls
% Copyright 2023 Jack Coleman
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
\ProvidesClass{business}[2023-11-01]

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
% custom lists
\RequirePackage[shortlabels]{enumitem}
% custom font
\RequirePackage{fontspec}
% custom margins
\RequirePackage{geometry}
% improved spacing
\RequirePackage{microtype}
% custom section headers
\RequirePackage{titlesec}

% ################################################################ STYLE

% ################################ VARIOUS

\pagestyle{empty}

% ################################ LENGHTS

% fancyhdr
\setlength{\headheight}{20mm}

% no text indentation
\parindent=0mm

% paragraph spacing for cover letter, 0mm in resume, \baselineskip in letter
\parskip=0mm

% page margins
\newgeometry{
 top=10mm,
 right=20mm,
 bottom=10mm,
 left=20mm
}

% stretch spaces so last line is placed at the end of the page
%\flushbottom

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

% ################ TITLESEC

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

% ################ HYPERREF

\hypersetup{
 hidelinks,
 pdfauthor={\@author},
 pdftitle={\@title},
 pdfsubject={resume},
 pdfkeywords={resume},
 pdfproducer={LaTeX},
 % pdf will be opened with horizontal or vertical fit
 pdfstartview=Fit,
 %pdfstartview=FitV,
}

% ################################ LETTER SPACING

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

% hide text
\newcommand{\multilinecomment}[1]{}

% contact info
\newcommand{\linkedin}[2]{\makebox[\textwidth]{\href{https://www.linkedin.com/in/#1/}{{\Large\textbf{\MakeUppercase{#2}}}}}}
\newcommand{\mobile}[1]{\makebox[0mm][l]{\href{tel:#1}{\large#1}}\hfill}
\newcommand{\mail}[1]{\href{mailto:#1}{\large#1}}
\newcommand{\city}[1]{\hfill\makebox[0mm][r]{\large#1}}

% full resume entry:
% 1 university/organization/company, 2 title, 3 begin date, 4 end date, 5 location, 6 itemize
\newcommand{\entry}[6]{
 \textbf{#1 \hfill #3 -- #4}\\
 \textit{#2} \hfill \textit{#5}\\[-\baselineskip]
 #6
}

% ################################ LINKED LIST

\@ifclasswith{business}{linked}{% if class option passed

% https://tex.stackexchange.com/a/454759/213962

% require two latex runs since it relies on temporary files
% there are two modes (one is commented out):
% - an alternative list enviornment called "achievements", and an alternative command called "\achievement" are defined
% - replace the "itemize" and "\item" definitions
% the second one is used, but the first option is still available as a comment for reference

 % required packages
 \RequirePackage{tikz}
 \RequirePackage{tikzpagenodes}
 \usetikzlibrary{calc}
 \RequirePackage{refcount}
 
 % new counter for amount of lists
 \newcounter{achievementsCounter}
 % create new item counter
 \newcounter{achievementsItems}[achievementsCounter]
 % tmp counter needed for checking before/after current item
 \newcounter{achievementsTemp}[achievementsCounter]
 
 % modified itemize environment

 % add a new alternative to itemize environment
 %\newlist{achievements}{itemize}{1}
 %\setlist[achievements]{
 % replace itemize environment
 \setlist[itemize]{
  before=\stepcounter{achievementsCounter},
  leftmargin=1.1em% 11pt font
 }

 % circle command
 \newcommand{\linkedBullet}[1]{
  \raisebox{0mm}[0mm][0mm]{%
   \begin{tikzpicture}[remember picture]%
    \node (#1) [black,circle,fill,inner sep=0.5mm]{}; %1.5pt
   \end{tikzpicture}%
  }%
 }

 % modified \item to update counter and save nodes

 % add a new alternative to \item
 %\newcommand{\achievement}{%
 % replace \item
 \let\itemOld\item
 \renewcommand{\item}{%
  \stepcounter{achievementsItems}%
  % add a new alternative to \item
  %\item[\linkedBullet{i\alph{achievementsCounter}\arabic{achievementsItems}}]%
  % replace \item
  \itemOld[\linkedBullet{i\alph{achievementsCounter}\arabic{achievementsItems}}]%
  \label{item-\alph{achievementsCounter}\arabic{achievementsItems}}%
  \ifnum\value{achievementsItems}>1%
   \ifnum\getpagerefnumber{item-\alph{achievementsCounter}\arabic{achievementsTemp}}<\getpagerefnumber{item-\alph{achievementsCounter}\arabic{achievementsItems}}%
    \begin{tikzpicture}[remember picture,overlay]%
     % draw short line
     \expandafter\draw\expandafter[black, shorten <= 0.5mm, shorten >= -1mm, thick] (i\alph{achievementsCounter}\arabic{achievementsItems}) -- ++(0,3mm) -- (i\alph{achievementsCounter}\arabic{achievementsItems} |- current page text area.north);
    \end{tikzpicture}%
   \else%
    \begin{tikzpicture}[remember picture,overlay]%
     % draw the connecting lines
     \expandafter\draw\expandafter[black, shorten <= .5mm, shorten >= 0.5mm, thick] (i\alph{achievementsCounter}\arabic{achievementsTemp}) -- (i\alph{achievementsCounter}\arabic{achievementsItems});
    \end{tikzpicture}%
   \fi%
  \fi%
  \addtocounter{achievementsTemp}{2}%
  \IfRefUndefinedExpandable{item-\alph{achievementsCounter}\arabic{achievementsTemp}}{}{% defined
   \ifnum\getpagerefnumber{item-\alph{achievementsCounter}\arabic{achievementsTemp}}>\getpagerefnumber{item-\alph{achievementsCounter}\arabic{achievementsItems}}%
    \begin{tikzpicture}[remember picture,overlay]%
     % draw short line
     \expandafter\draw\expandafter[black, shorten <= 0.5mm, shorten >= -1mm, thick] (i\alph{achievementsCounter}\arabic{achievementsItems}) -- ++(0,-3mm) -- (i\alph{achievementsCounter}\arabic{achievementsItems} |- current page text area.south);
    \end{tikzpicture}%
   \fi%
  }%
  \addtocounter{achievementsTemp}{-1}%
 }
}{
 % add a new alternative to itemize environment
 % add a new alternative to \item
 %\newlist{achievements}{itemize}{2}
 %\setlist[achievements,1]{label={\(\bullet\)},ref=\arabic*}
 %\setlist[achievements,2]{label={\(\circ\)},ref=\theachievementsi.\arabic*}
 %\newcommand{\achievement}{\item}
}% else class option not passed

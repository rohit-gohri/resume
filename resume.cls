%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Medium Length Professional CV - RESUME CLASS FILE
%
% This template has been downloaded from:
% http://www.LaTeXTemplates.com
%
% This class file defines the structure and design of the template. 
%
% Original header:
% Copyright (C) 2010 by Trey Hunner
%
% Copying and distribution of this file, with or without modification,
% are permitted in any medium without royalty provided the copyright
% notice and this notice are preserved. This file is offered as-is,
% without any warranty.
%
% Created by Trey Hunner and modified by www.LaTeXTemplates.com
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{resume}[2010/07/10 v0.9 Resume class]

\LoadClass[10pt,letterpaper]{article} % Font size and paper type

\usepackage[parfill]{parskip} % Remove paragraph indentation
\usepackage{array} % Required for boldface (\bf and \bfseries) tabular columns
\usepackage{ifthen} % Required for ifthenelse statements
\usepackage{babel}
\usepackage[stretch=10]{microtype}
\usepackage[sc]{mathpazo} % Required for `Palatino` font
\usepackage{hyperref} % Required for creating links (\href)
\usepackage{xcolor}
\usepackage{fontawesome} % Required for icons. List of available icons at http://ctan.imsc.res.in/fonts/fontawesome/doc/fontawesome.pdf
\usepackage{datetime} % Required for custom date formatting
\usepackage[left=0.6in,top=0.2in,right=0.6in,bottom=0.2in]{geometry} % Required for setting Document margins

\pagestyle{empty} % Suppress page numbers

\hypersetup{
    colorlinks, %Colours links instead of ugly boxes
    linkcolor={red!50!black}, %Colour of internal links
    citecolor={blue!50!black}, %Colour of citations
    % urlcolor={blue!40!black}, %Colour for external hyperlinks
    urlcolor={black}, %Colour for external hyperlinks
    pdftitle={Rohit Gohri's Resume},
    pdfauthor={Rohit Gohri <gohri.rohit@gmail.com>},
    pdfsubject={Hire Me! Source: https://github.com/rohit-smpx/resume},
    pdfkeywords={resume, cv, developer, nodejs, devops, ci, typescript, graphql, elastic}
}

\newdateformat{monthyeardate}{
  \shortmonthname[\THEMONTH]. \THEYEAR
}
\newdateformat{yeardate}{
  \THEYEAR
}

\newcommand{\fmtdate}[3][1]{%
\unskip{% group start to scope date name
\ifthenelse{\equal{#2}{}}{% If the 2nd arg is not provided only print the year
    \newdate{anon}{#1}{1}{#3}%
    \yeardate\displaydate{anon}%
}{%
    \newdate{anon}{#1}{#2}{#3}%
    \monthyeardate\displaydate{anon}%
}}}

\newcommand{\showif}[2][false]{%
{% group start to scope date name
    % From: https://tex.stackexchange.com/a/243879
    \newbox\anonvhbox
    \newboolean{IncludeAnonItem}
    \setboolean{IncludeAnonItem}{#1}

    \setbox\anonvhbox\vbox{%
    #2
    \unskip\unpenalty\unpenalty}

    \ifthenelse{\boolean{IncludeAnonItem}}{
    \unvbox\anonvhbox
    }{ }
}}

% Normalized italics
\newcommand{\nem}[1]{\normalfont \em #1}

\newcommand{\tab}[1]{\hspace{.2667\textwidth}\rlap{#1}}
\newcommand{\itab}[1]{\hspace{0em}\rlap{#1}}

%----------------------------------------------------------------------------------------
%	HEADINGS COMMANDS: Commands for printing name and address
%----------------------------------------------------------------------------------------

\def \name#1{\def\@name{#1}} % Defines the \name command to set name
\def \@name {} % Sets \@name to empty by default
% TODO: Take social links through variables and cmds

\def \addressSep {$\diamond$} % Set default address separator to a diamond

% One, two or three address lines can be specified 
\let \@addressone \relax
\let \@addresstwo \relax
\let \@addressthree \relax

% \address command can be used to set the first, second, and third address (last 2 optional)
\def \address #1{
  \@ifundefined{@addresstwo}{
    \def \@addresstwo {#1}
  }{
  \@ifundefined{@addressthree}{
  \def \@addressthree {#1}
  }{
     \def \@addressone {#1}
  }}
}

% \printaddress is used to style an address line (given as input)
\def \printaddress #1{
  \begingroup
    \def \\ {\addressSep\ }
    \centerline{#1}
  \endgroup
  \par
  \addressskip
}

% \printname is used to print the name as a page header
\def \printname {
  \begingroup
    \hfil{\MakeUppercase{\namesize\bf \@name}}\hfil
    \nameskip\break
  \endgroup
}

%----------------------------------------------------------------------------------------
%	PRINT THE HEADING LINES
%----------------------------------------------------------------------------------------

\let\ori@document=\document
\renewcommand{\document}{
  \ori@document  % Begin document
  \printname % Print the name specified with \name
  \@ifundefined{@addressone}{}{ % Print the first address if specified
    \printaddress{\@addressone}}
  \@ifundefined{@addresstwo}{}{ % Print the second address if specified
    \printaddress{\@addresstwo}}
     \@ifundefined{@addressthree}{}{ % Print the third address if specified
    \printaddress{\@addressthree}}
}

%----------------------------------------------------------------------------------------
%	SECTION FORMATTING
%----------------------------------------------------------------------------------------

% Defines the rSection environment for the large sections within the CV
\newenvironment{rSection}[1]{ % 1 input argument - section name
  \sectionskip
  \MakeUppercase{\bf #1} % Section title
  \sectionlineskip
  \hrule % Horizontal line
  \begin{list}{}{ % List for each individual item in the section
    \setlength{\leftmargin}{1.5em} % Margin within the section
  }
  \item[]
}{
  \end{list}
}

%----------------------------------------------------------------------------------------
%	WORK EXPERIENCE FORMATTING
%----------------------------------------------------------------------------------------

\newcommand{\rSubsectionHeading}[4]{ % 4 input arguments - company name, year(s) employed, job title and location
  \ifthenelse{\equal{#4}{} \AND \NOT \equal{#3}{}}{ % If 3 args are provided
    {\bf #1, {\normalfont \em #3}} \hfill {#2}
  }{
    \ifthenelse{\equal{#3}{}}{% If 2 args are provided
      {\bf #1} \hfill {#2} % Bold company name and date on the right
    }{ % If 4 args are provided
      {\bf #1} \hfill {#4} % Bold company name and location
      \\ {\em #3} \hfill {\em #2} % Italic job title and date on the right
    }\unskip
  }\unskip
}{}

\newenvironment{rSubsection}[4]{ % 4 input arguments - company name, year(s) employed, job title and location
  \rSubsectionHeading{#1}{#2}{#3}{#4}
  \smallskip
  \begin{list}{$\cdot$}{\leftmargin=0em} % \cdot used for bullets, no indentation
  \itemsep -0.5em \vspace{-0.5em} % Compress items in list together for aesthetics
}{
  \end{list}
  \vspace{0.5em} % Some space after the list of bullet points
}

% The below commands define the whitespace after certain things in the document - they can be \smallskip, \medskip or \bigskip
\def\namesize{\huge} % Size of the name at the top of the document
\def\addressskip{\smallskip} % The space between the two address (or phone/email) lines
\def\sectionlineskip{\medskip} % The space above the horizontal line for each section 
\def\nameskip{\bigskip} % The space after your name at the top
\def\sectionskip{\medskip} % The space after the heading section

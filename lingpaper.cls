\ProvidesClass{lingpaper}[2013/03/02 Linguistics papers]
\NeedsTeXFormat{LaTeX2e}
\RequirePackage{endnotes}
\RequirePackage{fancyhdr}

%
% Some basic definitions copied from article.tex.
%
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}


%
% Basic font setup.
%
\usepackage[T1]{fontenc}
\usepackage{mathptmx} % Times

\def\@nfs{12pt}
\def\@nfsskip{10pt}

% Sometimes useful to have old value in bits that are never double-spaced.
%\global\let\@@nfsskip\@nfsskip
\def\@@nfsskip{10pt}

\DeclareOption{doublespace}{\def\@nfsskip{24pt}}

\renewcommand{\normalsize}{\fontsize{\@nfs}{\@nfsskip}\selectfont}
\newcommand{\footnotesize}{\fontsize{\@nfs}{\@nfsskip}\selectfont}

\newcommand{\normaltext}{\fontseries{m}\fontshape{n}\normalsize}

\newcommand{\@pagenumfontsize}{\fontsize{10pt}{10pt}\selectfont}

%
% Page setup.
% See http://amath.colorado.edu/documentation/LaTeX/reference/layout.html
% for a helpful diagram.
%
\setlength\paperheight{11in}
\setlength\paperwidth{8.5in}

\setlength\topmargin{-0.5in}
\setlength\headheight{24pt}
\setlength\headsep{12.13pt}
\setlength\footskip{0.75in}

\setlength\oddsidemargin{0.75in}
\setlength\evensidemargin{0.75in}

\setlength\topskip{\@nfs}

\setlength{\textwidth}{5in}
\setlength{\textheight}{8.5in}

%
% Set up fancyhdr package with sensible defaults.
%
\newcommand\shorttitle[1]{%
  \def\@shorttitle{#1}}

\fancyheadoffset{0.75in}
\fancyfootoffset{0.75in}

\pagestyle{fancyplain}
\newcommand{\sl}{\slshape}
\newcommand{\rm}{\rmfamily}
\renewcommand\headrulewidth{0pt}
\lhead{\@pagenumfontsize\textit{\ifdefined\@shorttitle\@shorttitle\else\@title\fi}}
\chead{}
\rhead{\@pagenumfontsize\textit{\@author}}
\lfoot{}
\cfoot{}
\rfoot{\@pagenumfontsize\thepage}

%
% Layout.
%
\setlength\parindent{2em}

%
% Sections.
%
\newdimen\sectionfontsize
\setlength\sectionfontsize{12pt}
\newdimen\subsectionfontsize
\setlength\subsectionfontsize{12pt}

\newcommand{\thepage}{1}
\newcommand{\sectionfont}{\fontseries{b}\fontshape{n}\fontsize{\sectionfontsize}{\sectionfontsize}\selectfont}
\newcommand{\subsectionfont}{\fontseries{m}\fontshape{it}\fontsize{\subsectionfontsize}{\subsectionfontsize}\selectfont}

\setcounter{secnumdepth}{3}
\newcounter{section}
\newcounter{subsection}[section]

\renewcommand\thesection{\arabic{section}.}
\renewcommand\thesubsection{\arabic{section}.\arabic{subsection}.}

\newcommand\section[1]{%
  \@startsection {section}{1}{0pt}{24pt}{12pt}{\sectionfont}{#1}%
  \@afterindentfalse}
\newcommand\subsection[1]{%
  \@startsection {subsection}{2}{0pt}{12pt}{6pt}{\subsectionfont}{#1}%
  \@afterindentfalse}

%
% Footnotes/endnotes.
%
\newif\if@endnotes
\DeclareOption{endnotes}{\@endnotestrue}

\if@endnotes
  % Endnotes.
  \renewcommand\footnote{\endnote}
\else
  % Footnotes.
  \renewcommand\theendnotes{}
  \setlength\footnotesep{12pt}
  \renewcommand\footnoterule{%
    \kern-3\p@
    \hrule\@width.4\columnwidth
    \kern2.6\p@}
  \newcommand\@makefntext[1]{%
      \parindent 1em%
      \noindent
      \hb@xt@1.8em{\hss\@makefnmark}#1}
\fi

\newcounter{@oldfn}
\def\@star{*}
\renewcommand\thanks[1]{%
  \setcounter{@oldfn}{\value{footnote}}%
  \let\thefootnote\@star%
  \footnotemark\footnotetext{#1}%
  \setcounter{footnote}{\value{@oldfn}}}

%
% The title.
%
\newcommand\maketitle{%
  \begingroup
  \let\@n\@nfsskip
  \let\@nfsskip\@@nfsskip
  \normaltext%
  \noindent\textbf{\@title}\vspace{6pt}%
  \newline%
  \@author\vspace{6pt}%
  \newline%
  \@date\vspace{\@n}
  \par%
  \endgroup%
  \normaltext%
  \thispagestyle{empty}%
}


\ProcessOptions

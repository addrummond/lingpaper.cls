\ProvidesClass{lingpaper}[2013/03/02 Linguistics papers]
\NeedsTeXFormat{LaTeX2e}
\RequirePackage[utf8]{inputenc}
\RequirePackage{endnotes}
\RequirePackage{fancyhdr}

%
% Some basic definitions copied from article.tex.
%
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}

%
% Misc. definitions.
%
\newcommand{\thepage}{\arabic{page}}

%
% Basic font setup.
%
\usepackage[T1]{fontenc}
\usepackage{mathptmx} % Times

\def\@nfs{12pt}
\def\@nfsskip{14pt}

% Sometimes useful to have old value in bits that are never double-spaced.
%\global\let\@@nfsskip\@nfsskip
\let\@@nfsskip\@nfsskip

\DeclareOption{doublespace}{\def\@nfsskip{24pt}}

\renewcommand{\normalsize}{\fontsize{\@nfs}{\@nfsskip}\selectfont}
\newcommand{\footnotesize}{\fontsize{\@nfs}{\@nfsskip}\selectfont}
\newcommand{\small}{\fontsize{10pt}{10pt}\selectfont}
\newcommand{\tiny}{\fontsize{8pt}{8pt}\selectfont}

\newcommand{\normaltext}{\fontseries{m}\fontshape{n}\normalsize}

\newcommand{\@pagenumfontsize}{\fontsize{10pt}{10pt}\selectfont}

%
% Page setup.
% See http://amath.colorado.edu/documentation/LaTeX/reference/layout.html
% for a helpful diagram.
%
\setlength\paperheight{11in}
\setlength\paperwidth{8.5in}

\setlength\topmargin{-62.27pt}
\setlength\headheight{24pt}
\setlength\headsep{38.27pt}
\setlength\footskip{38.27pt}

\setlength\oddsidemargin{0.75in}
\setlength\evensidemargin{0.75in}

\setlength\topskip{\@nfs}

\setlength{\textwidth}{5in}
\setlength{\textheight}{9in}

%
% Set up fancyhdr package with sensible defaults.
%
\newcommand\shorttitle[1]{%
  \def\@shorttitle{#1}}

\fancyheadoffset{0.75in}
\fancyfootoffset{0.75in}

\pagestyle{fancyplain}
%\renewcommand\headrulewidth{0pt}
\lhead{\@pagenumfontsize\textit{\ifdefined\@shorttitle\@shorttitle\else\@title\fi}}
\chead{}
\rhead{\@pagenumfontsize\@author}
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

\newcommand{\sectionfont}{\fontseries{b}\fontshape{n}\fontsize{\sectionfontsize}{\sectionfontsize}\selectfont}
\newcommand{\subsectionfont}{\fontseries{m}\fontshape{it}\fontsize{\subsectionfontsize}{\subsectionfontsize}\selectfont}
\newcommand{\subsubsectionfont}{\fontseries{m}\fontshape{it}\fontsize{\subsectionfontsize}{\subsectionfontsize}\selectfont}

\setcounter{secnumdepth}{3}
\newcounter{section}
\newcounter{subsection}[section]
\newcounter{subsubsection}[subsection]

\renewcommand\thesection{\arabic{section}.}
\renewcommand\thesubsection{\arabic{section}.\arabic{subsection}.}
\renewcommand\thesubsubsection{\arabic{section}.\arabic{subsection}.\arabic{subsubsection}.}

\newcommand\section{\@ifnextchar*{\section@two}{\section@one}}
\newcommand\subsection{\@ifnextchar*{\subsection@two}{\subsection@one}}
\newcommand\subsubsection{\@ifnextchar*{\subsubsection@two}{\subsection@one}}

\newcommand\start@section{\@startsection{section}{1}{0pt}{24pt}{6pt}{\sectionfont}}
\newcommand\start@subsection{\@startsection{subsection}{2}{0pt}{18pt}{6pt}{\subsectionfont}}
\newcommand\start@subsubsection{\@startsection{subsubsection}{2}{0pt}{18pt}{6pt}{\subsubsectionfont}}

\newcommand\@secttail{\@afterindentfalse}

\newcommand\section@one[1]{\start@section{#1}\@secttail}
\newcommand\section@two[2]{\start@section#1{#2}\@secttail}
\newcommand\subsection@one[1]{\start@subsection{#1}\@secttail}
\newcommand\subsection@two[2]{\start@subsection#1{#2}\@secttail}
\newcommand\subsubsection@one[1]{\start@subsubsection{#1}\@secttail}
\newcommand\subsubsection@two[2]{\start@subsubsection#1{#2}\@secttail}

%
% Footnotes/endnotes.
%
\newif\if@endnotes
\DeclareOption{endnotes}{%
  \@endnotestrue}

\AtBeginDocument{%
  \if@endnotes
    % Endnotes.
    \renewcommand\footnote{\endnote}
  \else
    % Footnotes.
    \renewcommand\theendnotes{}
  \fi}

\setlength\footnotesep{12pt}
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}
\newcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}

% Handle \thanks within \title
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
  \begin{center}%
  \textbf{\@title}\vspace{6pt}\\\@author\vspace{6pt}\\\@date\\
  \end{center}%
  \vspace{\@n}%
  \endgroup%
  \normaltext%
  \thispagestyle{empty}%
}

%
% Bibliography environment (copied from article.cls)
%
\newenvironment{thebibliography}[1]
     {\section*{\refname}%
      \@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}

%
% Lists.
%
\def\@listi{%
  \parsep 5pt plus 3pt minus 2pt
  \topsep 9.5pt plus 3pt minus 5pt
  \itemsep 5pt plus 3pt minus 2pt
}

\setlength\leftmargini{2.5em}
\setlength\leftmarginii{2.2em}
\setlength\leftmarginiii{1.87em}
\setlength\leftmarginiv{1.7em}
\setlength\leftmarginv{1em}
\setlength\leftmarginvi{1em}

\setlength\labelwidth{\leftmargini}
\setlength\labelsep{.5em}
\addtolength\labelwidth{-\labelsep}

\leftmargin\leftmargini

\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}

%
% Quotations (from article.cls)
%
\newenvironment{quotation}
               {\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}
\newenvironment{quote}
               {\list{}{\rightmargin\leftmargin}%
                \item\relax}
               {\endlist}

%
% Blocks.
%
\newcommand\newblock{\hskip .11em plus .33em plus .07em}


\ProcessOptions

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
\usepackage{tgtermes}
\usepackage[T1]{fontenc}

\newcommand\@nfssskip{13pt}
\newcommand\@fnfssskip{\@nfsdskip}
\newcommand\@sfssskip{11pt}
\newcommand\@tfssskip{9pt}

\newcommand\@nfsdskip{22pt}
\newcommand\@fnfsdskip{\@nfsdskip}
\newcommand\@sfsdskip{20pt}
\newcommand\@tfsdskip{16pt}

\newcommand\@nfs{12pt}
\newcommand\@sfs{10pt}
\newcommand\@fnfs{\@nfs}
\newcommand\@tfs{8pt}

\newcommand\@nfsskip{\@nfssskip}
\newcommand\@sfsskip{\@sfssskip}
\newcommand\@fnfsskip{\@nfssskip}
\newcommand\@tfsskip{\@tfsskip}

\DeclareOption{smallfootnotes}{%
  \gdef\@fnfs{11pt}
  \gdef\@fnfssskip{12pt}
  \gdef\@fnfsdskip{22pt}
  \gdef\@fnfsskip{\@fnfssskip}}

\newif\if@doublespace
\DeclareOption{doublespace}{%
  % To ensure this is evaluated after the above.
  \AtEndOfPackage{%
    \gdef\@nfsskip{\@nfsdskip}
    \gdef\@sfsskip{\@sfsdskip}
    \gdef\@fnfsskip{\@fnfsdskip}
    \gdef\@tfsskip{\@tfsdskip}
    \@doublespacetrue}}

\renewcommand{\normalsize}{\fontsize{\@nfs}{\@nfsskip}\selectfont}
\newcommand{\footnotesize}{\fontsize{\@fnfs}{\@fnfsskip}\selectfont}
\newcommand{\small}{\fontsize{\@sfs}{\@sfsskip}\selectfont}
\newcommand{\tiny}{\fontsize{\@tfs}{\@tfsskip}\selectfont}

\newcommand{\normaltext}{\fontseries{m}\fontshape{n}\normalsize}

\newcommand{\@pagenumfontsize}{\fontsize{10pt}{10pt}\selectfont}

%
% Page setup.
% See http://amath.colorado.edu/documentation/LaTeX/reference/layout.html
% for a helpful diagram.
%
\newcommand\@draftlettersizesettings{%
  \special{papersize=8.5in,11in}
  \setlength\paperheight{11in}
  \setlength\paperwidth{8.5in}
  \setlength\topmargin{-62.27pt}
  \setlength\headheight{24pt}
  \setlength\headsep{38.27pt}
  \setlength\footskip{34pt}
  \setlength\oddsidemargin{0.6in}
  \setlength\evensidemargin{0.6in}
  \setlength\textwidth{5.3in}
  \setlength\textheight{9in}}
\newcommand\@draftafoursettings{%
  % 1 LaTeX point = 0.3515mm
  \special{papersize=210mm,297mm}
  \setlength\paperheight{297mm}
  \setlength\paperwidth{210mm}
  \setlength\topmargin{-61.123pt}
  \setlength\headheight{24pt}
  \setlength\headsep{37.124pt}
  \setlength\footskip{34pt}
  \setlength\oddsidemargin{9.24mm} % 24.64mm - 1inch
  \setlength\evensidemargin{9.24mm}
  \setlength\textwidth{140.72mm}
  \setlength\textheight{247mm}}
\newcommand\@handoutlettersizesettings{}
\newcommand\@handoutafoursettings{}

\newif\if@afoursize
\@draftlettersizesettings
\DeclareOption{a4paper}{\@afoursizetrue\@draftafoursettings}
\DeclareOption{letterpaper}{\@afoursizefalse\@draftlettersizesettings}

\setlength\topskip{\@nfs}

%
% Set up fancyhdr package with sensible defaults.
%
\newcommand\shorttitle[1]{%
  \def\@shorttitle{#1}}

\fancyheadoffset{0in}
\fancyfootoffset{0in}

\pagestyle{fancyplain}
%\renewcommand\headrulewidth{0pt}
\newcommand\leftheader{\@pagenumfontsize\textit{\ifdefined\@shorttitle\@shorttitle\else\@title\fi}}
\newcommand\rightheader{\@pagenumfontsize\@author}
\newcommand\centerheader{}
\lhead{\leftheader}
\chead{}
\rhead{\rightheader}
\lfoot{}
\cfoot{}
\rfoot{\@pagenumfontsize\thepage}

\newcommand\@headrulewidth{1pt}
\renewcommand{\headrulewidth}{\@headrulewidth}

%
% Handout variant.
%
\newcommand\@modifylettersizeforhandout{%
   \setlength\oddsidemargin{0in}
   \setlength\evensidemargin{-0.5in}
   \setlength\textwidth{7in}}
\newcommand\@modifyafourforhandout{%
   \setlength\oddsidemargin{-5.4mm}
   \setlength\evensidemargin{-15.4mm}
   \setlength\textwidth{180mm}}

\let\@@outputpage\@outputpage
\DeclareOption{handout}{
   % To make sure this is evaluated after 'handout' option sets if@afoursize to true.
   \AtEndOfPackage{%
     \@twosidetrue
     \if@afoursize
       \@modifyafourforhandout
     \else
       \@modifylettersizeforhandout
     \fi
   }

   \fancyheadoffset{0in}
   \fancyfootoffset{0in}

   \fancyhead{}
   \fancyhead[LE]{\leftheader}
   \fancyhead[RE]{\rightheader}
   \fancyhead[CE]{\centerheader}

   \renewcommand\@outputpage{%
     \ifodd\value{page}{\gdef\headrulewidth{0pt}}\else{\gdef\headrulewidth{\@headrulewidth}}\fi%
     \@@outputpage}

   \renewcommand\@fnfs{11pt}
   \renewcommand\@fnfsskip{\if@doublespace22pt\else12pt\fi}
}

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

\newcommand{\sectionfont}{\bfseries\fontshape{n}\fontsize{\sectionfontsize}{\sectionfontsize}\selectfont}
\newcommand{\subsectionfont}{\fontseries{m}\itshape\fontsize{\subsectionfontsize}{\subsectionfontsize}\selectfont}
\newcommand{\subsubsectionfont}{\fontseries{m}\itshape\fontsize{\subsectionfontsize}{\subsectionfontsize}\selectfont}

\setcounter{secnumdepth}{3}
\newcounter{section}
\newcounter{subsection}[section]
\newcounter{subsubsection}[subsection]

\renewcommand\thesection{\arabic{section}}
\renewcommand\thesubsection{\arabic{section}.\arabic{subsection}}
\renewcommand\thesubsubsection{\arabic{section}.\arabic{subsection}.\arabic{subsubsection}}

% Hack to add period after section number without this appearing in references
% to section.
\newif\if@nosectionperiods
\DeclareOption{nosectionperiods}{\@nosectionperiodstrue}
\renewcommand\@seccntformat[1]{\csname the#1\endcsname\if@nosectionperiods\else.\fi\quad}

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
  \let\@nfsskip\@nfssskip
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
% A single space environment.
%
\newcommand\start@singlesp{%
  \if@doublespace%
    \gdef\@nfsskip{\@nfssskip}%
    \gdef\@sfsskip{\@sfssskip}%
    \gdef\@fnfsskip{\@fnfssskip}%
    \gdef\@tfsskip{\@tfssskip}%
    \ifdim \f@size pt = \@nfs%
      \fontsize{\@nfs}{\@nfssskip}%
    \else\ifdim \f@size pt = \@fnfs%
      \fontsize{\@fnfs}{\@fnfssskip}%
    \else\ifdim \f@size pt = \@sfs%
      \fontsize{\@sfs}{\@sfssskip}%
    \else\ifdim \f@size pt = \@tfs%
      \fontsize{\@tfs}{\@tfssskip}%
    \fi\fi\fi\fi%
    \selectfont%
  \fi}
\newcommand\en@singlesp{%
  \if@doublespace%
    \par%
    \gdef\@nfsskip{\@nfsdskip}%
    \gdef\@sfsskip{\@sfsdskip}%
    \gdef\@fnfsskip{\@fnfsdskip}%
    \gdef\@tfsskip{\@tfsdskip}%
    \ifdim \f@size pt = \@nfs%
      \fontsize{\@nfs}{\@nfsdskip}%
    \else\ifdim \f@size pt = \@fnfs%
      \fontsize{\@fnfs}{\@fnfsdskip}%
    \else\ifdim \f@size pt = \@sfs%
      \fontsize{\@sfs}{\@sfsdskip}%
    \else\ifdim \f@size pt = \@tfs%
      \fontsize{\@tfs}{\@tfsdskip}%
    \fi\fi\fi\fi%
    \selectfont%
  \fi}
\newenvironment{singlesp}{\start@singlesp}{\en@singlesp}

%
% Blocks.
%
\newcommand\newblock{\hskip .11em plus .33em plus .07em}


\ProcessOptions

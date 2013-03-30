\ProvidesClass{lingpaper}[2013/03/02 Linguistics papers]
\NeedsTeXFormat{LaTeX2e}
\RequirePackage{endnotes}
\RequirePackage{fancyhdr}
\RequirePackage{ifpdf,ifxetex,ifluatex,marginnote,ifoddpage}

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
\newcommand\@tfssskip{9pt}
\newcommand\@scfssskip{10pt}
\newcommand\@fnfssskip{\@nfsdskip}
\newcommand\@sfssskip{11pt}
\newcommand\@nfssskip{13pt}
\newcommand\@lfssskip{15pt}
\newcommand\@Lfssskip{17pt}
\newcommand\@hfssskip{21pt}

\newcommand\@tfsdskip{16pt}
\newcommand\@scfsdskip{18pt}
\newcommand\@fnfsdskip{\@nfsdskip}
\newcommand\@sfsdskip{20pt}
\newcommand\@nfsdskip{22pt}
\newcommand\@lfsdskip{28pt}
\newcommand\@Lfsdskip{32pt}
\newcommand\@hfsdskip{40pt}

\newcommand\@tfs{8pt}
\newcommand\@scfs{9pt}
\newcommand\@fnfs{\@nfs}
\newcommand\@sfs{10pt}
\newcommand\@nfs{12pt}
\newcommand\@lfs{14pt}
\newcommand\@Lfs{16pt}
\newcommand\@hfs{20pt}
\newcommand\@Hfs{24pt}

\newcommand\@tfsskip{\@tfssskip}
\newcommand\@scfsskip{\@scfssskip}
\newcommand\@fnfsskip{\@nfssskip}
\newcommand\@sfsskip{\@sfssskip}
\newcommand\@nfsskip{\@nfssskip}
\newcommand\@lfsskip{\@lfssskip}
\newcommand\@Lfsskip{\@Lfssskip}
\newcommand\@hfsskip{\@hfssskip}

\DeclareOption{smallfootnotes}{%
  \gdef\@fnfs{11pt}
  \gdef\@fnfssskip{12pt}
  \gdef\@fnfsdskip{22pt}
  \gdef\@fnfsskip{\@fnfssskip}}

\newif\if@doublespace
\DeclareOption{doublespace}{%
  % To ensure this is evaluated after the above.
  \AtEndOfPackage{%
    \gdef\@tfsskip{\@tfsdskip}
    \gdef\@scfsskip{\@scfsdskip}
    \gdef\@fnfsskip{\@fnfsdskip}
    \gdef\@sfsskip{\@sfsdskip}
    \gdef\@nfsskip{\@nfsdskip}
    \gdef\@lfsskip{\@lfsdskip}
    \gdef\@Lfsskip{\@Lfsdskip}
    \gdef\@hfsskip{\@hfsdskip}
    \@doublespacetrue}}

\newcommand{\tiny}{\fontsize{\@tfs}{\@tfsskip}\selectfont}
\newcommand{\scriptsize}{\fontsize{\@scfs}{\@scfsskip}\selectfont}
\newcommand{\footnotesize}{\fontsize{\@fnfs}{\@fnfsskip}\selectfont}
\newcommand{\small}{\fontsize{\@sfs}{\@sfsskip}\selectfont}
\renewcommand{\normalsize}{\fontsize{\@nfs}{\@nfsskip}\selectfont}
\newcommand{\large}{\fontsize{\@lfs}{\@lfsskip}\selectfont}
\newcommand{\Large}{\fontsize{\@Lfs}{\@Lfsskip}\selectfont}
\newcommand{\huge}{\fontsize{\@hfs}{\@hfsskip}\selectfont}

\newcommand{\normaltext}{\fontseries{m}\fontshape{n}\normalsize}

\newcommand{\@runningheaderfontsize}{\fontsize{\@lfs}{\@lfsskip}\selectfont}
\newcommand{\@pagenumfontsize}{\fontsize{10pt}{10pt}\selectfont}

\newcommand\@singlespaceparskip{6pt}
\newcommand\@doublespaceparskip{12pt}

\newif\if@parskip
\DeclareOption{parskip}{\@parskiptrue}
\AtEndOfPackage{%
  \if@parskip
    \if@doublespace
      \setlength{\parskip}{\@doublespaceparskip}
      \gdef\@parskip{\@sdoublespaceparskip}
    \else
      \setlength{\parskip}{\@singlespaceparskip}
      \gdef\@parskip{\@singlespaceparskip}
    \fi
  \else
    \setlength{\parskip}{0pt}
    \gdef\@parskip{0pt}
  \fi}

% Coped from latex.sty with rubber spacing removed (again,
% some bug in this class file somewhere which is causing rubber spacing
% to do crazy things).
\newskip\smallskipamount \smallskipamount=3pt% plus 1pt minus 1pt
\newskip\medskipamount   \medskipamount  =6pt% plus 2pt minus 2pt
\newskip\bigskipamount   \bigskipamount =12pt% plus 4pt minus 4pt

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

\newif\if@afoursize
\@draftlettersizesettings
\DeclareOption{a4paper}{\@afoursizetrue\@draftafoursettings}
\DeclareOption{letterpaper}{\@afoursizefalse\@draftlettersizesettings}

\setlength\topskip{\@nfs}

%
% Set up fancyhdr package with sensible defaults.
%
\let\old@title\title
\newcommand\shorttitle[1]{%
  \def\@shorttitle{#1}}
\renewcommand\title[1]{%
  \def\@shorttitle{[SET SHORT TITLE]}%
  \old@title{#1}}

\fancyheadoffset{0in}
\fancyfootoffset{0in}

\pagestyle{fancyplain}
%\renewcommand\headrulewidth{0pt}
\newcommand\leftheader{\@pagenumfontsize\textit{\ifdefined\@shorttitle\@shorttitle\else\@title\fi}}
\newcommand\rightheader{\@pagenumfontsize\@author}
\newcommand\centerheader{}

\AtEndOfPackage{
  \if@handout
    \lhead{\leftheader}
    \chead{}
    \rhead{\rightheader}
    \lfoot{}
    \cfoot{}
    \rfoot{\@pagenumfontsize\thepage}
  \else
    \fancyhead{}
    % Can't get twoside mode to work so can't use [CE] and [CO].
    \fancyhead[C]{%
      \checkoddpage\ifoddpage%
        \textsc{\@runningheaderfontsize\MakeLowercase\@shorttitle}%
      \else%
        \textsc{\@runningheaderfontsize\MakeLowercase\@author}%
      \fi}
    \fancyfoot[R]{\@pagenumfontsize\thepage}
    \fancyfoot[L,C]{}
    \renewcommand\headrulewidth{0pt}
  \fi}

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

\newcommand\marginnotesep{0.4in}
\newcommand\marginnoteextraspace{1.5in}
\newcommand\marginnotesquish{0.8in}

\newcommand\@modifyhandoutformarginnotes{%
  \addtolength\evensidemargin{\marginnoteextraspace}
  \addtolength\evensidemargin{\marginnotesep}
  \addtolength\textwidth{-\marginnoteextraspace}
  \addtolength\textwidth{-\marginnotesep}
  \setlength\marginparwidth{\marginnoteextraspace}
%  \addtolength\textwidth{\marginnotesquish}
%  \addtolength\evensidemargin{-\marginnotesquish}
}

\newif\if@marginnotes
\DeclareOption{marginnotes}{\@marginnotestrue}
\newif\if@largemarginnotes
\DeclareOption{largemarginnotes}{\@largemarginnotestrue}
\newif\if@raggedmarginnotes
\DeclareOption{raggedmarginnotes}{\@raggedmarginnotestrue}

\newcommand\@mnfootnotesize{\if@largemarginnotes\footnotesize\else\scriptsize\fi}

% TODO: Redefining entire footnote command is a bit of a hack.
\newdimen\@marginnotewidth
\newcommand\@replacefootnotewithmarginnote{%
   \renewcommand\footnote[2][\thefootnote]{%
     \stepcounter{footnote}%
     {\@mnfootnotesize\footnotemark[##1]}%
     \setlength\@marginnotewidth\marginparwidth%
     \marginnote{%
       \addtolength\@marginnotewidth{-\marginnotesep}
       \addtolength\@marginnotewidth{\marginnotesquish}
       \raggedright
       \checkoddpage\ifoddpage%
         \addtolength\leftskip{\marginnotesep}%
       \fi%
       \checkoddpage\ifoddpage\hspace*{-5pt}\else\hspace*{-\marginnotesquish}\fi%
       \parbox{\@marginnotewidth}{%
         \if@raggedmarginnotes\raggedright\fi%
         \@mnfootnotesize\footnotemark[##1]##2}}}}

\let\@@outputpage\@outputpage
\newif\if@handout
\DeclareOption{handout}{\@handouttrue}
\AtEndOfPackage{
  \if@handout%
    \@twosidetrue
    \if@afoursize
      \@modifyafourforhandout
    \else
      \@modifylettersizeforhandout
    \fi

    \if@marginnotes
      \@modifyhandoutformarginnotes
      \@replacefootnotewithmarginnote
    \fi

    \fancyheadoffset{0in}
    \fancyfootoffset{0in}

    \let\@oldlhead\f@ncyelh
    \let\@oldchead\f@ncyech
    \let\@oldrhead\f@ncyerh

    \renewcommand\@outputpage{%
      \ifodd\value{page}{\gdef\headrulewidth{0pt}\fancyhead{}}\else{\gdef\headrulewidth{\@headrulewidth}\lhead{\@oldlhead}\rhead{\@oldrhead}\chead{\@oldchead}}\fi%
      \@@outputpage}

    \renewcommand\@fnfs{11pt}
    \renewcommand\@fnfsskip{\if@doublespace22pt\else12pt\fi}
 \fi}

%
% Layout.
%
\newcommand\@parindent{2em}
\AtBeginDocument{%
  \setlength\parindent{\@parindent}}

%
% Sections and chapters.
%
\newdimen\normaltitlefontsize
\setlength\normaltitlefontsize{\@Lfs}
\newdimen\normaltitleextrainfofontsize
\setlength\normaltitleextrainfofontsize{\@lfs}

\newdimen\bigtitlefontsize
\setlength\bigtitlefontsize{\@hfs}
\newdimen\bigtitleextrainfofontsize
\setlength\bigtitleextrainfofontsize{\@Lfs}

\newdimen\chapterfontsize
\setlength\chapterfontsize{\@Lfs}
\newdimen\sectionfontsize
\setlength\sectionfontsize{\@lfs}
\newdimen\subsectionfontsize
\setlength\subsectionfontsize{\@nfs}
\newdimen\subsubsectionfontsize
\setlength\subsubsectionfontsize{\subsectionfontsize}

\newdimen\sectionlineskip
\setlength\sectionlineskip{\sectionfontsize}
\addtolength\sectionlineskip{0.25\sectionfontsize}
\newdimen\subsectionlineskip
\setlength\subsectionlineskip{\subsectionfontsize}
\addtolength\subsectionlineskip{0.25\subsectionfontsize}
\newdimen\subsubsectionlineskip
\setlength\subsubsectionlineskip{\subsubsectionfontsize}
\addtolength\subsubsectionlineskip{0.25\subsubsectionfontsize}

\newcommand{\normaltitlefont}{\fontseries{m}\fontshape{sc}\fontsize{\normaltitlefontsize}{\normaltitlefontsize}\selectfont}
\newcommand{\normaltitleextrainfofont}{\fontseries{m}\fontshape{n}\fontsize{\normaltitleextrainfofontsize}{\normaltitleextrainfofontsize}\selectfont}

\newcommand{\bigtitlefont}{\fontseries{m}\fontshape{sc}\fontsize{\bigtitlefontsize}{\bigtitlefontsize}\selectfont}
\newcommand{\bigtitlextrainfofont}{\fontseries{m}\fontshape{n}\fontsize{\bigtitleextrainfofontsize}{\bigtitleextrainfofontsize}\selectfont}

\newcommand{\chapterfont}{\fontseries{m}\fontshape{sc}\fontsize{\chapterfontsize}{\chapterfontsize}\selectfont}
\newcommand{\chapternamefont}{\fontseries{m}\fontshape{sc}\fontsize{\chapterfontsize}{\chapterfontsize}\selectfont}
\newcommand{\sectionfont}{\fontseries{m}\fontshape{sc}\fontsize{\sectionfontsize}{\sectionlineskip}\selectfont}
\newcommand{\subsectionfont}{\fontseries{m}\fontshape{sc}\fontsize{\subsectionfontsize}{\subsectionlineskip}\selectfont}
\newcommand{\subsubsectionfont}{\fontseries{m}\fontshape{sc}\fontsize{\subsubsectionfontsize}{\subsubsectionlineskip}\selectfont}

\setcounter{secnumdepth}{4}
\newcounter{chapter}
\newcounter{section}[chapter]
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

\newcommand\chapter{\@ifnextchar*\@chapterstar\@chapternostar}
\newcommand\@chapternostar[1]{%
  \chapterfont%
  \setcounter{section}{0}%
  \addtocounter{chapter}{1}%
  \addcontentsline{toc}{chapter}{\protect\numberline{\arabic{chapter}\hspace{1em}#1}}%
  \newpage%
  \thispagestyle{empty}%
  {\chapterfont\noindent Chapter \arabic{chapter}\par\nobreak\vspace{8pt}\noindent\chapternamefont#1\par\nobreak\vspace{\chapterfontsize}}\noindent\normaltext}
\newcommand\@chapterstar[2]{%
  \chapterfont%
  \setcounter{section}{0}%
  \newpage%
  \thispagestyle{empty}%
  {\chapterfont\noindent #2\vspace{\chapterfontsize}}\newline\normaltext\noindent}

\newcommand\section{\@ifnextchar*{\section@two}{\section@one}}
\newcommand\subsection{\@ifnextchar*{\subsection@two}{\subsection@one}}
\newcommand\subsubsection{\@ifnextchar*{\subsubsection@two}{\subsubsection@one}}

\newcommand\start@section{\@startsection{section}{2}{0pt}{24pt}{12pt}{\sectionfont}}
\newcommand\start@subsection{\@startsection{subsection}{3}{0pt}{18pt}{6pt}{\subsectionfont}}
\newcommand\start@subsubsection{\@startsection{subsubsection}{4}{0pt}{18pt}{6pt}{\subsubsectionfont}}

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

\newcommand\set@footnotesepsingle{\setlength\footnotesep{\@fnfssskip}}
\newcommand\set@footnotesepdouble{\setlength\footnotesep{\@fnfsdskip}}

\AtBeginDocument{%
  \if@doublespace%
    \set@footnotesepdouble%
  \else%
    \set@footnotesepsingle%
  \fi}

\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}
\newcommand\@makefntext[1]{%
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
\newif\if@bigtitle
\DeclareOption{bigtitle}{\@bigtitletrue}

\newcommand\maketitle{%
  \begingroup
  \let\@n\@nfsskip
  \let\@nfsskip\@nfssskip
  \begin{center}%
    \if@bigtitle\bigtitlefont\else\normaltitlefont\fi
    \@title\vspace{6pt}\\
    \if@bigtitle\bigtitlextrainfofont\else\normaltitleextrainfofont\fi
    \@author\vspace{6pt}\\
    \normaltext\@date\\
  \end{center}%
  \vspace{\@n}%
  \endgroup%
  \normaltext%
  \thispagestyle{empty}%
}

%\footnotesize\setlength\parindent\@parindent\noindent
%
% Environment for abstracts (centered paragraphs with smallish text).
%
\newcommand\@setupabs{\footnotesize\setlength\parindent\@parindent\noindent}
\newcommand\abstractleftindent{0.5in}
\newcommand\abstractrightindent{0.5in}
\newdimen\@abstractwidth
\newenvironment{abstract}%
  {\setlength\@abstractwidth\textwidth%
   \addtolength{\@abstractwidth}{-\abstractleftindent}%
   \addtolength{\@abstractwidth}{-\abstractrightindent}%
   \noindent\noindent\hspace*{\abstractleftindent}\noindent\begin{minipage}[t]{\@abstractwidth}\vspace{0pt}\@setupabs}
  {\end{minipage}}

%
% Bibliography environment (copied from article.cls)
%
\newcommand\bibname{References}
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
  \parsep 5pt% plus 3pt minus 2pt
  \topsep 9.5pt% plus 3pt minus 5pt
  \itemsep 5pt% plus 3pt minus 2pt
}

\AtBeginDocument{%
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
  \newcommand\labelitemiv{\textperiodcentered}}

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
    \setlength\parskip{\@doublespaceparskip}
    \gdef\@parskip{\@doublespaceparskip}
    \gdef\@tfsskip{\@tfssskip}%
    \gdef\@scfsskip{\@scfssskip}%
    \gdef\@fnfsskip{\@fnfssskip}%
    \gdef\@sfsskip{\@sfssskip}%
    \gdef\@nfsskip{\@nfssskip}%
    \gdef\@lfsskip{\@lfssskip}%
    \gdef\@Lfsskip{\@Lfssskip}%
    \gdef\@hfsskip{\@hfssskip}%
    \ifdim \f@size pt = \@tfs%
      \fontsize{\@tfs}{\@tfssskip}%
    \else\ifdim \f@size pt = \@scfs%
      \fontsize{\@scfs}{\@scfssskip}%
    \else\ifdim \f@size pt = \@fnfs%
      \fontsize{\@fnfs}{\@fnfssskip}%
    \else\ifdim \f@size pt = \@sfs%
      \fontsize{\@sfs}{\@sfssskip}%
    \else\ifdim \f@size pt = \@nfs%
      \fontsize{\@nfs}{\@nfssskip}%
    \else\ifdim \f@size pt = \@lfs%
      \fontsize{\@lfs}{\@lfssskip}%
    \else\ifdim \f@size pt = \@Lfs%
      \fontsize{\@Lfs}{\@Lfssskip}%
    \else\ifdim \f@size pt = \@hfs%
      \fontsize{\@hfs}{\@hfssskip}%
    \fi\fi\fi\fi\fi\fi\fi\fi%
    \selectfont%
  \fi}
\newcommand\en@singlesp{%
  \if@doublespace%
    \par%
    \setlength\parskip{\@singlespaceparskip}
    \gdef\@parskip{\@singlespaceparskip}
    \gdef\@tfsskip{\@tfsdskip}%
    \gdef\@scfsskip{\@scfsdskip}%
    \gdef\@fnfsskip{\@fnfsdskip}%
    \gdef\@sfsskip{\@sfsdskip}%
    \gdef\@nfsskip{\@nfsdskip}%
    \gdef\@lfsskip{\@lfsdskip}%
    \gdef\@Lfsskip{\@Lfsdskip}%
    \gdef\@Lfsskip{\@hfsdskip}%
    \ifdim \f@size pt = \@tfs%
      \fontsize{\@tfs}{\@tfsdskip}%
    \else\ifdim \f@size pt = \@scfs%
      \fontsize{\@scfs}{\@scfsdskip}%
    \else\ifdim \f@size pt = \@fnfs%
      \fontsize{\@fnfs}{\@fnfsdskip}%
    \else\ifdim \f@size pt = \@sfs%
      \fontsize{\@sfs}{\@sfsdskip}%
    \else\ifdim \f@size pt = \@nfs%
      \fontsize{\@nfs}{\@nfsdskip}%
    \else\ifdim \f@size pt = \@lfs%
      \fontsize{\@lfs}{\@lfsdskip}%
    \else\ifdim \f@size pt = \@Lfs%
      \fontsize{\@Lfs}{\@Lfsdskip}%
    \else\ifdim \f@size pt = \@Lfs%
      \fontsize{\@hfs}{\@hfsdskip}%
    \fi\fi\fi\fi%
    \selectfont%
  \fi}
\newenvironment{singlesp}{\start@singlesp}{\en@singlesp}

%
% Blocks.
%
\newcommand\newblock{\hskip .11em plus .33em plus .07em}

%
% Table of contents (mostly taken from article.sty)
%
\newcommand\contentsname{Contents}

% Make it easy to change fonts in TOC.
\newcommand\cftcontentsfont{\normalfont\fontshape{sc}\selectfont\huge}
\newcommand\cftpartfont{\normalfont\fontshape{sc}}
\newcommand\cftchapterfont{\normalfont\fontshape{sc}\selectfont\large}
\newcommand\cftsectionfont{\normalfont\normalsize}
\newcommand\cftsubsectionfont{\normalfont\footnotesize}
\newcommand\cftsubsubsectionfont{\normalfont\footnotesize}

\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{3}
\newcommand\tableofcontents{%
      \begingroup
        \let\sectionfont\cftcontentsfont
        \section*{\contentsname%
            \@mkboth{%
               \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
        \@starttoc{toc}%
      \endgroup}

\newcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty\@secpenalty
    \addvspace{2.25em \@plus\p@}%
    \setlength\@tempdima{3em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \cftpartfont #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par % Edit: replace raw font commands with \cftpartfont
       \nobreak
       \if@compatibility
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
      \fi
    \endgroup
  \fi}
\newcommand*\l@section[2]{%
  \ifnum \c@tocdepth >\z@
    \addpenalty\@secpenalty
    \addvspace{1.0em \@plus\p@}%
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \cftsectionfont % Edit 
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
    \endgroup
  \fi}
\newcommand*\l@subsection{\cftsubsectionfont\@dottedtocline{2}{1.5em}{2.3em}}
\newcommand*\l@subsubsection{\cftsubsubsectionfont\@dottedtocline{3}{3.8em}{3.2em}}
\newcommand*\l@paragraph{\cftsubsubsectionfont\@dottedtocline{4}{7.0em}{4.1em}}
\newcommand*\l@subparagraph{\cftsubsubsectionfont\@dottedtocline{5}{10em}{5em}}
\newcommand\listoffigures{%
    \section*{\listfigurename}%
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}%
    \@starttoc{lof}%
    }
\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand\listoftables{%
    \section*{\listtablename}%
      \@mkboth{%
          \MakeUppercase\listtablename}%
         {\MakeUppercase\listtablename}%
    \@starttoc{lot}%
    }
\let\l@table\l@figure

% Added from book.cls
\newcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \cftchapterfont % Edit
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}

\ProcessOptions

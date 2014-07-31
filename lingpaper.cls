\ProvidesClass{lingpaper}[2013/03/02 Linguistics papers]
\NeedsTeXFormat{LaTeX2e}
\newenvironment{description}{}{}
\RequirePackage{endnotes,fancyhdr,ifpdf,ifxetex,ifluatex,ifoddpage,enumitem,pdftexcmds,tikz,amsmath,multicol,hyphenat,scalefnt}
\AtBeginDocument{\usetikzlibrary{shapes.geometric}}

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
\newcommand\thepage{\arabic{page}}
\newcommand\smallvspace{\vspace*{\dimexpr\@nfs/4}}

%
% Basic font setup.
%
\newcommand\roundlightfont{\normalfont\fontfamily{fos}\fontseries{l}\selectfont\scalefont{0.95}}
\newcommand\roundnormalfont{\normalfont\fontfamily{fos}\fontseries{lc}\selectfont\scalefont{0.95}}
\newcommand\roundboldfont{\normalfont\fontfamily{fos}\fontseries{sb}\selectfont\scalefont{0.95}}

\newif\if@smallfootnotes
\DeclareOption{smallfootnotes}{\@smallfootnotestrue}

\newcommand\@tfs{8pt}
\newcommand\@scfs{9pt}
\newcommand\@fnfs{\if@smallfootnotes11pt\else12pt\fi}
\newcommand\@sfs{10pt}
\newcommand\@nfs{12pt}
\newcommand\@lfs{14pt}
\newcommand\@Lfs{16pt}
\newcommand\@hfs{20pt}
\newcommand\@Hfs{26pt}

\newcommand\@tfssskip{9pt}
\newcommand\@scfssskip{10pt}
\newcommand\@fnfssskip{\if@smallfootnotes12pt\else13pt\fi}
\newcommand\@sfssskip{11pt}
\newcommand\@nfssskip{13pt}
\newcommand\@lfssskip{15pt}
\newcommand\@Lfssskip{17pt}
\newcommand\@hfssskip{21pt}
\newcommand\@Hfssskip{27pt}

\newcommand\@tfsdskip{16pt}
\newcommand\@scfsdskip{18pt}
\newcommand\@fnfsdskip{\if@smallfootnotes22pt\else24pt\fi}
\newcommand\@sfsdskip{20pt}
\newcommand\@nfsdskip{24pt}
\newcommand\@lfsdskip{28pt}
\newcommand\@Lfsdskip{32pt}
\newcommand\@hfsdskip{40pt}
\newcommand\@Hfsdskip{52pt}

\newcommand\@tfsskip{\@tfssskip}
\newcommand\@scfsskip{\@scfssskip}
\newcommand\@fnfsskip{\@fnfssskip}
\newcommand\@sfsskip{\@sfssskip}
\newcommand\@nfsskip{\@nfssskip}
\newcommand\@lfsskip{\@lfssskip}
\newcommand\@Lfsskip{\@Lfssskip}
\newcommand\@hfsskip{\@hfssskip}

\newif\if@doublespace
\DeclareOption{doublespace}{\@doublespacetrue}

\newif\if@eleven
\DeclareOption{11pt}{\@eleventrue}
\newcommand\abd@eleven{%
\if@eleven
\renewcommand\@tfs{7pt}%
\renewcommand\@scfs{8pt}%
\renewcommand\@fnfs{\if@smallfootnotes9pt\else10pt\fi}%
\renewcommand\@sfs{10pt}%
\renewcommand\@nfs{11pt}%
\renewcommand\@lfs{13.5pt}%
\renewcommand\@Lfs{15pt}%
\renewcommand\@hfs{19pt}%
\renewcommand\@Hfs{25pt}%
%
\renewcommand\@tfssskip{8pt}%
\renewcommand\@scfssskip{9pt}%
\renewcommand\@fnfssskip{\if@smallfootnotes10pt\else11pt\fi}%
\renewcommand\@sfssskip{11pt}%
\renewcommand\@nfssskip{12pt}%
\renewcommand\@lfssskip{14.5pt}%
\renewcommand\@Lfssskip{16pt}%
\renewcommand\@hfssskip{20pt}%
\renewcommand\@Hfssskip{26pt}%
%
\renewcommand\@tfsdskip{14pt}%
\renewcommand\@scfsdskip{16pt}%
\renewcommand\@fnfsdskip{\if@smallfootnotes18pt\else20pt\fi}%
\renewcommand\@sfsdskip{20pt}%
\renewcommand\@nfsdskip{22pt}%
\renewcommand\@lfsdskip{27pt}%
\renewcommand\@Lfsdskip{30pt}%
\renewcommand\@hfsdskip{38pt}%
\renewcommand\@Hfsdskip{50pt}%
\fi
}

\newcommand{\tiny}{\fontsize{\@tfs}{\@tfsskip}\selectfont}
\newcommand{\scriptsize}{\fontsize{\@scfs}{\@scfsskip}\selectfont}
\newcommand{\footnotesize}{\fontsize{\@fnfs}{\@fnfsskip}\selectfont}
\newcommand{\@realfootnotesize}{\if@smallfootnotes\footnotesize\else\@smallfootnotestrue\footnotesize\@smallfootnotesfalse\fi}
\newcommand{\small}{\fontsize{\@sfs}{\@sfsskip}\selectfont}
\renewcommand{\normalsize}{\fontsize{\@nfs}{\@nfsskip}\selectfont}
\newcommand{\large}{\fontsize{\@lfs}{\@lfsskip}\selectfont}
\newcommand{\Large}{\fontsize{\@Lfs}{\@Lfsskip}\selectfont}
\newcommand{\huge}{\fontsize{\@hfs}{\@hfsskip}\selectfont}

\newcommand{\normaltext}{\fontseries{m}\fontshape{n}\normalsize}

\newcommand{\@runningheaderfontsize}{\fontsize{\@nfs}{\@nfsskip}\selectfont}
\newcommand{\@pagenumfontsize}{\@realfootnotesize}

\newif\if@parskip
\DeclareOption{parskip}{\@parskiptrue}
\AtEndOfPackage{%
  \if@parskip
    \newcommand\@singlespaceparskip{6pt}
    \newcommand\@doublespaceparskip{12pt}
    \if@doublespace
      \setlength{\parskip}{\@doublespaceparskip}
      \gdef\@parskip{\@doublespaceparskip}
    \else
      \setlength{\parskip}{\@singlespaceparskip}
      \gdef\@parskip{\@singlespaceparskip}
    \fi
  \else
    \newcommand\@singlespaceparskip{0pt}
    \newcommand\@doublespaceparskip{0pt}
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
\newcommand\@paperwidth{}
\newcommand\@paperheight{}
\newcommand\@draftlettersizesettings{%
  \renewcommand\@paperwidth{11in}
  \renewcommand\@paperheight{8.5in}
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
  \renewcommand\@paperwidth{210mm}
  \renewcommand\@paperheight{297mm}
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
% 'indenty' option.
%
\newif\if@indenty\@indentyfalse
\DeclareOption{indenty}{\@indentytrue}

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

\newif\if@noheader
\DeclareOption{noheader}{\@noheadertrue}

\pagestyle{fancyplain}
\newcommand\@leftheaderfont[1]{\roundlightfont\if@handout#1\else\textit{#1}\fi}
\newcommand\@rightheaderfont[1]{\roundlightfont #1}
\newcommand\@centerheaderfont[1]{\roundlightfont #1}
\newcommand\leftheader{\if@noheader\else\@pagenumfontsize\@leftheaderfont{\if@handout\@date\else\ifdefined\@shorttitle\@shorttitle\else\@title\fi\fi}\fi}
\newcommand\rightheader{\@rightheaderfont{\ifdefined\@author\@pagenumfontsize\@author\fi}}
\newcommand\centerheader{\if@handout\@centerheaderfont{\@shorttitle}\fi}

\newcommand\@headrulewidth{1pt}
\newcommand\@headlinestrut{\rule[-1.5ex]{0pt}{2ex}} % See http://tex.stackexchange.com/questions/40270/how-do-i-increase-the-spacing-between-header-text-and-the-headrule-line-with-f

\AtEndOfPackage{
  \if@handout%
    \if@noheader\else%
      \fancyhead[L]{\@headlinestrut\leftheader}%
      \fancyhead[C]{\centerheader}%
      \fancyhead[R]{\rightheader}%
    \fi%
    \fancyfoot[R]{\@pagenumfontsize\thepage}%
    \fancyfoot[L,C]{}%
    \renewcommand\@headrulewidth{0.5pt}%
  \else%
    \fancyhead{}%
    % Can't get twoside mode to work so can't use [CE] and [CO].
    \if@noheader\else%
      \fancyhead[C]{%
        \checkoddpage\ifoddpage%
          \textit{\@runningheaderfontsize\@shorttitle}%
        \else%
          \ifdefined\@author%
            \textit{\@runningheaderfontsize\@author}%
          \fi%
        \fi}%
    \fi%
    \fancyfoot[R]{\@pagenumfontsize\thepage}%
    \fancyfoot[L,C]{}%
    \renewcommand\@headrulewidth{0pt}%
  \fi}

%
% Handout variant.
%
\newcommand\@modifylettersizeforhandout{%
  \renewcommand\@paperwidth{11in}%
  \renewcommand\@paperheight{8.5in}%
  \setlength\paperwidth{11in}%
  \setlength\paperheight{8.5in}%
  \setlength\oddsidemargin{0in}%
  \setlength\evensidemargin{0in}%
  \setlength\topmargin{-1in}%
  \setlength\textheight{6.5in}%
  \setlength\textwidth{9in}%
  \setlength\columnsep{0.5in}%
  \pdfpagewidth\@paperwidth%
  \pdfpageheight\@paperheight}
%\newcommand\@modifyafourforhandout{%
%  \setlength\oddsidemargin{-5.4mm}
%  \setlength\evensidemargin{-15.4mm}
%  \setlength\textwidth{180mm}}

\newcommand\@hscale{1.5pt}
\newcommand\@modifyfontsizesforhandout{%
  \renewcommand\@tfs{7pt}%
  \renewcommand\@scfs{7.5pt}%
  \renewcommand\@fnfs{\if@smallfootnotes8pt\else9pt\fi}%
  \renewcommand\@sfs{8.5pt}%
  \renewcommand\@nfs{9pt}%
  \renewcommand\@lfs{10pt}%
  \renewcommand\@Lfs{11pt}%
  \renewcommand\@hfs{12pt}%
  \renewcommand\@Hfs{14pt}%
  %
  \renewcommand\@tfssskip{7.5pt}%
  \renewcommand\@scfssskip{8pt}%
  \renewcommand\@fnfssskip{\if@smallfootnotes8.5pt\else9.5pt\fi}%
  \renewcommand\@sfssskip{9pt}%
  \renewcommand\@nfssskip{9.5pt}%
  \renewcommand\@lfssskip{11pt}%
  \renewcommand\@Lfssskip{12pt}%
  \renewcommand\@hfssskip{13pt}%
  \renewcommand\@Hfssskip{15pt}%
  %
  \renewcommand\@tfsdskip{14pt}%
  \renewcommand\@scfsdskip{15pt}%
  \renewcommand\@fnfsdskip{\if@smallfootnotes16pt\else18pt\fi}%
  \renewcommand\@sfsdskip{17pt}%
  \renewcommand\@nfsdskip{18pt}%
  \renewcommand\@lfsdskip{20pt}%
  \renewcommand\@Lfsdskip{22pt}%
  \renewcommand\@hfsdskip{24pt}%
  \renewcommand\@Hfsdskip{28pt}%
  %
  \renewcommand\@tfsskip{\@tfssskip}%
  \renewcommand\@scfsskip{\@scfssskip}%
  \renewcommand\@fnfsskip{\@nfssskip}%
  \renewcommand\@sfsskip{\@sfssskip}%
  \renewcommand\@nfsskip{\@nfssskip}%
  \renewcommand\@lfsskip{\@lfssskip}%
  \renewcommand\@Lfsskip{\@Lfssskip}%
  \renewcommand\@hfsskip{\@hfssskip}%
}

\AtEndDocument{
  \if@handout%
    \end{multicols}\fi}

\newif\if@tmpevenpagebool
\newcommand\ifevenpage{%
  \ifoddpage\@tmpevenpageboolfalse\else\@tmpevenpagebooltrue\fi%
  \if@tmpevenpagebool}

\let\@@outputpage\@outputpage
\newif\if@handout
\DeclareOption{handout}{\@handouttrue}
\AtEndOfPackage{
  \@twosidefalse
  \if@handout%
    \if@afoursize
      \@modifyafourforhandout
    \else
      \@modifylettersizeforhandout
    \fi

    \fancyheadoffset{0in}
    \fancyfootoffset{0in}

    \let\@oldlhead\f@ncyelh
    \let\@oldchead\f@ncyech
    \let\@oldrhead\f@ncyerh

    \renewcommand\@outputpage{%
      \ifodd\value{page}{\gdef\headrulewidth{0pt}\fancyhead{}}\else{\gdef\headrulewidth{\@headrulewidth}\lhead{\@oldlhead}\rhead{\@oldrhead}\chead{\@oldchead}}\fi%
      \@@outputpage}

    \@modifyfontsizesforhandout
    \@smallfootnotestrue
 \fi
\pdfpagewidth\@paperwidth
\pdfpageheight\@paperheight
%\special{papersize=\@paperwidth,\@paperheight}
}

%
% Layout.
%
\newcommand\@parindent{24pt}
\newcommand\abd@layout{%
  \setlength\parindent{\@parindent}}

%
% Sections and chapters.
%
\newif\if@hyphensect
\DeclareOption{hyphensect}{\@hyphensecttrue}
\newcommand\@sectnohyphens[1]{\if@hyphensect#1\else\nohyphens{#1}\fi}

\newcommand\abd@setotherfontsizes{%
\newdimen\normaltitlefontsize
\setlength\normaltitlefontsize{\@Lfs}
\newdimen\normaltitleextrainfofontsize
\setlength\normaltitleextrainfofontsize{\@lfs}

\newdimen\bigtitlefontsize
\setlength\bigtitlefontsize{\@Hfs}
\newdimen\bigtitleextrainfofontsize
\setlength\bigtitleextrainfofontsize{\@lfs}

\newdimen\chapternumberfontsize
\setlength\chapternumberfontsize{\dimexpr\@Hfs * 2\relax}
\newdimen\chapternamefontsize
\setlength\chapternamefontsize{\@hfs}
\newdimen\sectionfontsize
\setlength\sectionfontsize{\@Lfs}
\newdimen\subsectionfontsize
\setlength\subsectionfontsize{\@lfs}
\newdimen\subsubsectionfontsize
\setlength\subsubsectionfontsize{\@nfs}

\newdimen\sectionlineskip
\setlength\sectionlineskip{\sectionfontsize}
\addtolength\sectionlineskip{0.25\sectionfontsize}
\newdimen\subsectionlineskip
\setlength\subsectionlineskip{\subsectionfontsize}
\addtolength\subsectionlineskip{0.25\subsectionfontsize}
\newdimen\subsubsectionlineskip
\setlength\subsubsectionlineskip{\subsubsectionfontsize}
\addtolength\subsubsectionlineskip{0.25\subsubsectionfontsize}
}

\newcommand{\normaltitlefont}{\roundboldfont\fontsize{\normaltitlefontsize}{\normaltitlefontsize}\selectfont}
\newcommand{\normaltitleextrainfofont}{\roundnormalfont\fontseries{m}\fontshape{n}\fontsize{\normaltitleextrainfofontsize}{\normaltitleextrainfofontsize}\selectfont}

\newcommand{\bigtitlefont}{\roundboldfont\fontsize{\bigtitlefontsize}{\bigtitlefontsize}\selectfont}
\newcommand{\bigtitlextrainfofont}{\roundnormalfont\fontshape{n}\fontsize{\bigtitleextrainfofontsize}{\bigtitleextrainfofontsize}\selectfont}

\newcommand{\chapternumberfont}{\roundboldfont\fontsize{\chapternumberfontsize}{\chapternumberfontsize}\selectfont}
\newcommand{\chapternamefont}{\roundboldfont\fontsize{\chapternamefontsize}{\chapternamefontsize}\selectfont}
\newcommand{\sectionfont}{\roundboldfont\fontsize{\sectionfontsize}{\sectionlineskip}\selectfont}
\newcommand{\subsectionfont}{\roundboldfont\fontsize{\subsectionfontsize}{\subsectionlineskip}\selectfont}
\newcommand{\subsubsectionfont}{\roundboldfont\fontsize{\subsubsectionfontsize}{\subsubsectionlineskip}\selectfont}

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

\newif\if@dontindentsections\@dontindentsectionsfalse

\newcommand\@modifysectheadtext[1]{\@sectnohyphens{#1}}

\definecolor{chapter-gray}{gray}{0.4}

\newcommand\@chlinethickness{4pt}
\newcommand\@chline{%
  {\fontsize{1pt}{1pt}\selectfont\hspace*{1pt}\begin{tikzpicture}
  \path[chapter-gray,fill=chapter-gray] (0,0) rectangle ($ (\linewidth,\@chlinethickness)+(-2pt,0) $);
  \end{tikzpicture}}}

% We detect if the document uses any chapters so we know whether references should
% be a chapter or section heading.
\newif\if@thereweresomechapters

\newif\if@chapterstar
\newcommand\chapter{\@ifnextchar*\@chapterstar\@chapternostar}
\newcommand\@chapterstar[2]{\@chapterstartrue\@mychapter{#2}}
\newcommand\@chapternostar[1]{\@chapterstarfalse\@mychapter{#1}}
\newcommand\@mychapter[1]{%
  \@thereweresomechapterstrue%
  \chapternumberfont%
  \if@chapterstar\else%
    \setcounter{section}{0}%
    \addtocounter{chapter}{1}%
    \addcontentsline{toc}{chapter}{\protect\numberline{\arabic{chapter}\hspace{1em}\@modifysectheadtext{#1}}}%
  \fi%
  \newpage%
  \thispagestyle{empty}%
  \if@chapterstar\else%
    {\chapternumberfont\noindent \hfill {\color{chapter-gray}\arabic{chapter}}%
    \vspace{\dimexpr-\chapternumberfontsize + (\@chlinethickness * 4)\relax}}%
    \newline%
  \fi%
  \noindent\@chline%
  \vspace{-\chapternumberfontsize}\vspace{\chapternamefontsize}\vspace{\dimexpr \@chlinethickness * 2\relax}%
  \newline%
  {\chapternamefont\@sectnohyphens{#1}}%
  \vspace{\dimexpr\chapternamefontsize *2\relax}%
  \@afterindentfalse\@afterheading\par\normalfont\normalsize}

\newcommand\section{\@ifnextchar*{\section@two}{\section@one}}
\newcommand\subsection{\@ifnextchar*{\subsection@two}{\subsection@one}}
\newcommand\subsubsection{\@ifnextchar*{\subsubsection@two}{\subsubsection@one}}

\newcommand\@sectpre{\if@indenty\if@dontindentsections\else\noindent\leftskip\@parindent\fi\fi}
\newcommand\@secttail{\if@indenty\@afterindenttrue\else\@afterindentfalse\fi}

\newcommand\start@section{\@startsection{section}{2}{0pt}{24pt}{12pt}{\sectionfont\@sectpre}}
\newcommand\start@subsection{\@startsection{subsection}{3}{0pt}{18pt}{6pt}{\subsectionfont\@sectpre}}
\newcommand\start@subsubsection{\@startsection{subsubsection}{4}{0pt}{18pt}{6pt}{\subsubsectionfont\@sectpre}}

\newcommand\section@one[1]{\start@section{\@modifysectheadtext{#1}}\@secttail}
\newcommand\section@two[2]{\start@section#1{\@modifysectheadtext{#2}}\@secttail}
\newcommand\subsection@one[1]{\start@subsection{\@modifysectheadtext{#1}}\@secttail}
\newcommand\subsection@two[2]{\start@subsection#1{\@modifysectheadtext{#2}}\@secttail}
\newcommand\subsubsection@one[1]{\start@subsubsection{\@modifysectheadtext{#1}}\@secttail}
\newcommand\subsubsection@two[2]{\start@subsubsection#1{\@modifysectheadtext{#2}}\@secttail}

%
% Footnotes/endnotes.
%
\newif\if@endnotes
\DeclareOption{endnotes}{%
  \@endnotestrue}

\newcommand\abd@notes{%
  \if@endnotes
    % Endnotes.
    \renewcommand\footnote{\endnote}
  \else
    % Footnotes.
    \renewcommand\theendnotes{}
  \fi}

\newdimen\tmp@fnsunit
\setlength\tmp@fnsunit{\dimexpr\@fnfssskip/8}
\newdimen\tmp@fndunit
\setlength\tmp@fndunit{\dimexpr\@fnfsdskip/8}
\newcommand\set@footnotesepsingle{\setlength\footnotesep{\dimexpr\tmp@fnsunit*5\relax}}
\newcommand\set@footnotesepdouble{\setlength\footnotesep{\dimexpr\tmp@fndunit*5\relax}}

\newcommand\abd@spacing{%
  \if@doublespace%
    \set@footnotesepdouble%
    \gdef\@tfsskip{\@tfsdskip}%
    \gdef\@scfsskip{\@scfsdskip}%
    \gdef\@fnfsskip{\@fnfsdskip}%
    \gdef\@sfsskip{\@sfsdskip}%
    \gdef\@nfsskip{\@nfsdskip}%
    \gdef\@lfsskip{\@lfsdskip}%
    \gdef\@Lfsskip{\@Lfsdskip}%
    \gdef\@hfsskip{\@hfsdskip}%
    \gdef\@Hfsskip{\@Hfsdskip}%
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
  \footnotemark\footnotetext{\if@doublespace\en@singlesp\fi#1}%
  \setcounter{footnote}{\value{@oldfn}}}

%
% The title.
%
\newif\if@bigtitle
\DeclareOption{bigtitle}{\@bigtitletrue}

% Add option to define affiliation and location.
\newcommand\affil[1]{\gdef\@affil{#1}}
\newcommand\location[1]{\gdef\@location{#1}}
% Stop author command adding in vspace (?)
\renewcommand\author[1]{\gdef\@author{#1}}

\newif\if@wasdoublespace
\newcommand\maketitle{%
  \if@doublespace\@wasdoublespacetrue\else\@wasdoublespacefalse\fi%
  \start@singlespnoif%
  \begingroup%
  \let\@n\@nfsskip%
  \let\@nfsskip\@nfssskip%
  \begin{center}%
    \if@bigtitle\bigtitlefont\else\normaltitlefont\fi%
    \@title\vspace{\@nfsskip}\\
    \if@bigtitle\bigtitlextrainfofont\else\normaltitleextrainfofont\fi%
    \@author\\
    \ifdefined\@affil%
      \vspace{\dimexpr\@nfsskip/4\relax}\normaltext\@affil\\%
    \else%
      %\\%
    \fi%
   \footnotesize%
   \vspace{\@nfsskip}%
   \@date%
   \ifdefined\@location%
     \vspace{\dimexpr\@fnfsskip/4\relax}\\\@location\\%
   \else\\\fi%
  \end{center}%
  \vspace{\@n}%
  \endgroup%
  \normaltext%
  \thispagestyle{empty}%
  \if@wasdoublespace\en@singlesp\fi%
  \if@handout\begin{multicols}{2}\fi%
}

%\footnotesize\setlength\parindent\@parindent\noindent
%
% Environment for abstracts (centered paragraphs with smallish text).
%
\newif\if@largeabstract
\DeclareOption{largeabstract}{\@largeabstracttrue}

\newcommand\@setupabs{%
  \if@largeabstract\else\footnotesize\fi%
  \setlength\parindent\@parindent%
  \if@indenty\else\noindent\fi}
\newcommand\abstractleftindent{0in}
\newcommand\abstractrightindent{0in}
\newdimen\@abstractwidth
\newenvironment{abstract}%
  {\setlength\@abstractwidth\columnwidth%
   \addtolength{\@abstractwidth}{-\abstractleftindent}%
   \addtolength{\@abstractwidth}{-\abstractrightindent}%
   \if@indenty\addtolength{\@abstractwidth}{-\@parindent}\fi%
   \if@indenty\else\noindent\fi%
   \hspace*{\abstractleftindent}\begin{minipage}[t]{\@abstractwidth}\vspace{0pt}\@setupabs}%
  {\end{minipage}}

%
% Bibliography environment (copied from article.cls)
%
\newcommand\refname{References}
\newenvironment{thebibliography}[1]
     {\@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}%
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

\newcommand\abd@natbib{%
  \renewcommand\bibsection{\@dontindentsectionstrue\if@thereweresomechapters\chapter*{\refname}\else\section*{\refname}\fi\@dontindentsectionsfalse}
  % To make it work with natbib, which redefines thebibliography.
  \@ifpackageloaded{natbib}{
    \global\let\bibname\refname
    \renewcommand\bibfont{}
    \renewcommand\bibname{\refname}
    \setlength\bibsep{0pt}
    \setlength\bibhang{\@parindent}
  }{}}

%
% Lists.
%
\def\@listi{%
  \parsep 5pt% plus 3pt minus 2pt
  \topsep 9.5pt% plus 3pt minus 5pt
  \itemsep 5pt% plus 3pt minus 2pt
}

\newcommand\abd@layouttwo{%
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
  \if@doublespace\start@singlespnoif\fi}
\newcommand\start@singlespnoif{%
  \setlength\parskip{\@singlespaceparskip}%
  \gdef\@parskip{\@singlespaceparskip}%
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
  \selectfont}
\newcommand\en@singlesp{%
  \if@doublespace%
    \setlength\parskip{\@doublespaceparskip}%
    \gdef\@parskip{\@doublespaceparskip}%
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
    \else\ifdim \f@size pt = \@hfs%
      \fontsize{\@hfs}{\@hfsdskip}%
    \fi\fi\fi\fi\fi\fi\fi\fi%
    \selectfont%
  \fi}
\newenvironment{singlesp}{\start@singlesp}{\par\en@singlesp}

%
% Blocks.
%
\newcommand\newblock{\hskip .11em plus .33em plus .07em}

%
% Table of contents (mostly taken from article.sty)
%
\newcommand\contentsname{Contents}

% Make it easy to change fonts in TOC.
\newcommand\cftcontentsfont{\normalfont\selectfont\huge}
\newcommand\cftpartfont{\normalfont\large}
\newcommand\cftchapterfont{\normalfont\selectfont\large}
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

%
% Version of textsc which uses old-style numbers where available.
% Looks better for glosses like PAST-1PS.
% Modified from http://tex.stackexchange.com/a/81755
%
\def\glossc#1{%
\@tfor\tmp:=#1\do{%
\ifnum\pdf@strcmp{-}{\tmp}=0%
  -%
\else\ifnum\pdf@strcmp{.}{\tmp}=0%
  .%
\else\ifcat1\tmp%
  \relax\oldstylenums\tmp%
\else%
  \textsc\tmp%
\fi\fi\fi}}

%
% Some utilities for setting nice unicode fonts with XeTex/LuaTeX
% Code taken from test files here: http://ctan.mirror.rafal.ca/fonts/tex-gyre-math/doc/
%
\newcommand\setfonttexgyre{
  \usepackage{amsmath}[2000/07/18] %% Displayed equations
  \usepackage{amssymb}[2002/01/22] %% and additional symbols
  \usepackage{fontspec}
  \setromanfont[Ligatures=TeX]{TeX Gyre Pagella}
  \usepackage{unicode-math}
  \setmathfont[math-style=ISO,bold-style=ISO,vargreek-shape=TeX]{TeX Gyre Pagella Math}}
\newcommand\setfonttextermes{
  \usepackage{amsmath}[2000/07/18] %% Displayed equations
  \usepackage{amssymb}[2002/01/22] %% and additional symbols
  \usepackage{fontspec}
  \setromanfont[Ligatures=TeX]{TeX Gyre Termes}
  \usepackage{unicode-math}
  \setmathfont[math-style=ISO,bold-style=ISO,vargreek-shape=TeX]{TeX Gyre Termes Math}}

%
% Utility for creating an emphasized text box of some sort.
%
\newcommand\@boxoutlinewidth{6pt}
\newdimen\@btextwidth
\newcommand\boxout[1]{%
\setlength\@btextwidth{\columnwidth}%
\newdimen\@bsepwidth
\setlength\@bsepwidth{\@boxoutlinewidth}
\addtolength\@bsepwidth{\dimexpr-\@boxoutlinewidth/4\relax}
\hspace*{-\@bsepwidth}\hspace*{-\@boxoutlinewidth}\begin{tikzpicture}%
\node[inner sep=0pt,outer sep=0pt](t){\hspace*{\@bsepwidth}\parbox[t]{\@btextwidth}{#1}};
\draw[gray,fill=gray] ($ (t.north west)+(0,0pt) $) rectangle ($ (t.south west)+(-\@boxoutlinewidth,-0pt) $);
\end{tikzpicture}\medskip\noindent}

%
% Bullet points suitable for handout. Not highly indented. Examples defined using linguex are not indented
% further if they appear inside a \item.
%
\newcommand\@triangle{%
\begin{tikzpicture}
\node[isosceles triangle,
isosceles triangle apex angle=60,
draw,
color=black,
thick,
minimum height=0.5em,
inner sep=0pt,
outer sep=0pt]{};
\end{tikzpicture}%
}
\newcommand\@thicktriangle{%
\begin{tikzpicture}
\node[isosceles triangle,
isosceles triangle apex angle=60,
draw,
color=black,
thick,
fill=black,
minimum height=0.5em,
inner sep=0pt,
outer sep=0pt]{};
\end{tikzpicture}%
}

\newdimen\@tmplinguexdimen
\newenvironment{xbullets}{%
  \@ifundefined{Exindent}{}{%
    \setlength\@tmplinguexdimen\Exindent%
    \addtolength\Exindent{-0em}}%
  \begin{enumerate}[label=\protect\@triangle,labelindent=0pt,labelwidth=0.75em,labelsep=0.25em,itemsep=\@parskip,leftmargin=0em,itemindent=0em]%
}{%
  \end{enumerate}%
  \@ifundefined{Exindent}{}{%
    \setlength\Exindent\@tmplinguexdimen}%
}

\newcommand\xitem{\item[\protect\@thicktriangle]}

%
% Load microtype with appropriate settings if LuaTeX is being used.
%
\newcommand\abd@lua{
  \ifluatex
    \usepackage[activate={true,nocompatibility},final,factor=1100,stretch=10,shrink=10]{microtype}
  \fi}

%
% Load natbib with sensible settings.
%
\AtEndOfPackage{
  \usepackage[comma]{natbib}
  \bibpunct{(}{)}{,}{a}{}{,}}

%
% AtBeginDocument
%
\AtBeginDocument{
  \abd@layout%
  \abd@layouttwo%
  \abd@notes%
  \abd@natbib%
  \abd@lua%
  \abd@setotherfontsizes%
  \abd@eleven%
  \abd@spacing%
%  \abd@handout%
}

\ProcessOptions

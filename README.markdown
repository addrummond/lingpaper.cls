This is a document class for LaTeX designed for writing linguistics
papers and handouts.  It's designed with my needs in mind, is very
unconfigurable, and most likely will not do what you want.  In
particular, this is *not* widely tested and may well fail to implement some
LaTeX features which you want to use.

The basic features are as follows:

* Fixed 12pt font size for main text and section headings.
* Wide margins.
* Footnotes same size as main text by default except in "handout" mode.
* "handout" option sets asymmetric margins for 2x2 printing and places headers only on even-numbered pages.
* Easy to switch betwen double/single spacing and footnotes/endnotes.
* Makes proper use of old style numerals in smallcaps section headings and in glosses.

Package options:

* `[letterpaper]` (default) and `[a4paper]`.
* `[doublespace]` Main text and footnotes are double-spaced if this is specified.
* `[indenty]` Turns on a more indent-heavy style, where section headings and the first paragraphs of sections are indented. Entire abstract is also indented by same amount. Looks nice in papers but not so great with handouts.
* `[handout]` Asymmetric margins for 2x2 printing. Margins narrower than the defauly unless `[marginnotes]` option is also set. Headers printed
only on even-numbered pages.
* `[nosectionperiods]` By default there is a period after the section number in section headings. This option removes it.
* `[nosmallcaps]` Don't use smallcaps for section headings, running headers, etc.
* `[endnotes]` Endnotes instead of footnotes (notes are still specified using the `footnote` command). You may specify position of endnotes using `\theendnotes`.
* `[marginnotes]` Margin notes instead of footnotes (notes are still specified using the `footnote` command). This works only if the `[handout]` option is also set. The right margins of odd pages and left margins of even pages are increased to make room for margin notes in the center of the handout. Margin notes are defined using the [marginfix](http://www.ctan.org/tex-archive/macros/latex/contrib/marginfix) package.
* `[largemarginnotes]` If this is set then margin notes use `\footnotesize` instead of `\scriptsize` (usually, margin notes need to be a bit smaller than footnotes would be).
* `[raggedmarginnotes]` If this is set then margin notes are ragged rather than justified.
* `[nosinglespmarginnotes]` If this is not set, then margin notes are single spaced even when the main text is double spaced.
* `[smallfootnotes]` Makes footnotes small (redundant in handout mode).
* `[bigtitle]` Makes paper/book title big (might want this for book drafts).
* `[largeabstract]` By default, text in the `abstract` environment is set to `\footnotesize`. If this option is set the normal font size is used.

Commands:

* `\affil` Defines (optional) affiliation to appear under author's name.

* `\location` Defines (optional) location which appears under date.

* `\begin{singlesp}` Single-space environment. Ignored if `[doublespace]` option is not set.

* `\glossc` A variant of the `textsc` macro for use in glosses. This turns on old-style (i.e. smaller) numerals where available, and also outputs dashes and periods outside of the smallcaps environment.

* `\boxout` For emphasizing a paragraph of text (e.g. `\boxout{Blah blah blah...}`). Currently, this prints a grey vertical bar on the left of the paragraph.

Commands that can be redefined:

* `\leftheader`, `\rightheader` and `\centerheader` can be redefined to make simple adjustments to the content of the page headers. The headers are set using the fancyhdr package, so you can also override them using fancyhdr directly.

* `\cftchapterfont`, `\cftsectionfont`, `\cftsubsectionfont` and `\cftsubsubsectionfont`. These set fonts for lines in TOC.

* `\abstractleftindent` and `\abstractrightindent` can be redefined to modify abstract indentation.

* `\marginnotevsep` Vertical separation between marginnotes.

* The sum of the values of `\marginnoteextraspace` and `\marginnotesep` is the additional space added to left/right margins to make room for margin notes. The latter specifies the distance between the left/right edge of the margin note and the main text. The distance between the right edge of odd pages and left edge of even pages is also reduced by double the value of `\marginnotesquish' (since generally opposite margin notes can be closer to each other than the main text).

Example:

    \documentclass[doublespace,endnotes]{lingpaper}
    \usepackage{linguex}

    \begin{document}
    \author{Joe Linguist}
    \title{My Analysis of Phenomenon X With a Long Title}
    \shorttitle{The Short Title}
    
    \maketitle

    \section{First section}
    Some text here...

    \ex. First example.

    ...More discussion...

    \begin{singlesp}
    Some single-spaced text here.
    \end{singlesp}

    \end{document}

This is a document class for LaTeX designed for writing linguistics
papers and handouts.  It's designed with my needs in mind, is very
unconfigurable, and most likely will not do what you want.  In
particular, this is *not* widely tested and may well to implement some
LaTeX features which you want to use.

The basic features are as follows:

    * Fixed 12pt font size for main text and section headings.
    * Wide margins.
    * "handout" option narrows margins and numbers pages on the assumption that handout will be printed 2 pages per page.
    * Footnotes same size as main text draft papers but size 11 in "handout" mode.
    * Easy to switch betwen double/single spacing and footnotes/endnotes.

Package options:

    * `[doublespace]` Main text and footnotes are double-spaced if this is specified.
    * `[handout]` Narrow asymmetric margins for 2x2 printing.
    * `[nosectionperiods]` By default there is a period after the section number in section headings. This option removes it.
    * `[endnotes]` Endnotes instead of footnotes (notes are still specified using the `footnote` command). You may specify position of endnotes using `\theendnotes`.

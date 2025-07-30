$bibtex = 'upbibtex';
$dvipdf = 'dvipdfmx %O -o %D %S';
$makeindex = 'upmendex -U %O -o %D %S';
$pdf_mode = 3; 

$latex = 'uplatex';
# $latex = "latexdiff main_v3.tex main.tex > main-diff.tex; uplatex %O main-diff"
FinalA19()
{
    for i in {1..4};
    do 
        pdflatex SolutionFinalA19_Question_$i.tex;
    done
}
FinalA19;

for i in {1..4};
do 
    bibtex SolutionFinalA19_Question_$i;
    pdflatex SolutionFinalA19_Question_$i.tex;
done

FinalA19;

for i in "aux" "log" "bbl" "blg" "dvi" "out" "toc" "synctex.gz" "idx";
do
    rm *.$i;
done

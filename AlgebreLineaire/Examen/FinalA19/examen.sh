FinalH20()
{
    for i in {1..4};
    do 
        pdflatex Hebert-Doutreloux_Final_Question_$i.tex;
    done
}

FinalH20;

for i in {1..4};
do 
    bibtex Hebert-Doutreloux_Final_Question_$i;
    pdflatex Hebert-Doutreloux_Final_Question_$i.tex;
done

FinalH20;

for i in "aux" "log" "bbl" "blg" "dvi" "out" "toc" "synctex.gz" "idx";
do
    rm *.$i;
done

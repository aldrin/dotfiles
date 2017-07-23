# Convert Markdown to PDF
function to-pdf() {
    if [ "$#" -eq 1 ]; then
        pandoc -f markdown $1 -o ${1:t:r}.pdf     \
        --latex-engine=xelatex                    \
        --variable fontsize=11pt                  \
        --variable geometry=margin=0.65in         \
        --variable mainfont=Avenir                \
        --variable monofont=Menlo                 \
        --include-in-header ~/.stationary.tex
    else
        echo "Usage: to-pdf <file.md>"
    fi
}

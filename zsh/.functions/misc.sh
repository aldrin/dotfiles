# Convert Markdown to PDF
function to-pdf() {
    if [ "$#" -eq 1 ]; then
        pandoc $1 -o ${1:t:r}.pdf                               \
               -V geometry=scale=0.85                           \
               -V mainfont=Palatino                             \
               --variable=colorlinks:yes                        \
               --include-in-header=$HOME/.stationary.tex    
    else
        echo "Usage: to-pdf <file.md>"
    fi
}

# Generate Terraform Graph
function terraform-graph() {
    terraform graph |
        grep -v meta.count-boundary |
        grep -v close |
        grep -v var. |
        dot -Tsvg > plan.svg
}

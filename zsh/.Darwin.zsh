export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# Python
source ~/.py/bin/activate

# Rust
source ~/.cargo/env

# Ruby
eval "$(rbenv init -)"

# Go
export GOPATH=~/Code/Go
export PATH="$GOPATH/bin:$PATH"

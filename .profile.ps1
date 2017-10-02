# First things first.
Set-PSReadlineOption -EditMode Emacs
 
# Git prompt support
Import-Module -Name posh-git

# Prompt
function prompt {
    Write-Host $(Get-Location) -NoNewline
    Write-VcsStatus
    return "> "
}

# Tail files
function tail {
    Get-Content -Tail 10 -Wait $args
}

# Git Shortcuts
function gwip {
    git add -A
    git rm (git ls-files --deleted) 2>&1 | out-null
    git commit -m "--wip--"
}

# Create
function work-on-feature {
    git checkout -b feature/$args
}

# Clean all feature branches
function clean-branches(){
    git branch | select-string feature | %{$_.ToString().Trim()} | %{git branch -D $_}
}

# Docker shortcuts
function docker-stop-all {
    $running = (docker ps -q)

    if($running) {
        docker stop $running
    }
}

# Clean all running containers
function docker-clean {
    docker-stop-all
    $containers = (docker ps -a -q)
    if($containers){
        docker rm -v $containers
    }
}

# Bring up development servers
function docker-up {
    docker-compose -f $HOME\Code\.dotfiles\docker\docker-compose.yml up -d
}

# Bring down development servers
function docker-down {
    docker-compose -f $HOME\Code\.dotfiles\docker\docker-compose.yml down -v
}

# Linux for windows
function lfw {
    docker build --rm -t lfw $HOME\Code\.dotfiles\docker
    docker run -i -t -v $HOME:/ajd --env HOME=/ajd lfw
}

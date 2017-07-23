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

function tail {
    Get-Content -Tail 10 -Wait $args
}

# Git Shortcuts
function gwip {
    git add -A
    git rm (git ls-files --deleted) 2>&1 | out-null
    git commit -m "--wip--"     
}

function work-on-feature {
    git checkout -b feature/$args     
}

# Clean all feature branches
function clean-branches(){
    git branch | select-string feature | %{$_.ToString().Trim()} | %{git branch -D $_}
}

# Prepare for commit
function sonar {
    mvn -DskipITs -Psonar-preview
    ii target\sonar\issues-report\issues-report.html
}

function docker-clean {
    docker-stop-all
    $containers = (docker ps -a -q)
    if($containers){
        docker rm -v $containers
    }
}

function docker-up {
    docker-compose -f ~\.dotfiles\docker\docker-compose.yml up -d
}

function docker-down {
    docker-compose -f ~\.dotfiles\docker\docker-compose.yml down -v
}

# Go
$env:GOPATH = "$env:HOME\Go"
$env:Path += ";$env:GOPATH\bin"


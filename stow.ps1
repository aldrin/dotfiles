# Windows has no GNU stow, so we need to manage symlinks manually

# Git status in prompt
if (!(Get-Module "posh-git")) {
    Install-Module posh-git
}

# Create a symlink
function symlink ($file, $dest) {
    New-Item -Force -Path $dest -ItemType SymbolicLink -Value $file
}

# Symlink simple files
$files = @()
$files += gci 'emacs\.emacs'
$files += gci 'emacs\.ajd.el'
$files += gci 'emacs\.custom.el'
$files += gci 'emacs\.key-bindings.el'
$files += gci 'git\.gitconfig'
$files += gci 'bash\.bashrc'

foreach ($file in $files) { 
  symlink $file (Join-Path -Path $env:HOME -ChildPath $file.Name)
}

symlink .\mvn\.m2\settings.xml ([io.path]::Combine($env:HOME, ".m2", "settings.xml"))
symlink .\.profile.ps1 $profile

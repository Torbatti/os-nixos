{ config, ... }:
{
    imports =
    [
        ./git/git.nix
        ./vscode/vscode.nix
    ];
}
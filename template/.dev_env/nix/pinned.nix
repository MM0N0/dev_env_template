import
  (builtins.fetchGit {
    name = "fixed-project-revision";
    url = "https://github.com/NixOS/nixpkgs/";
    ref = "refs/heads/nixpkgs-23.11-darwin";
    rev = "9d7a44754fae79c6b0821cbb0407418f79d24cc0";
  })
{ }

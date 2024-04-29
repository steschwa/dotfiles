export def bibformat [] {
    pbpaste | bibtex-tidy --curly --numeric --tab --no-align --duplicates=key --no-escape --sort-fields --remove-empty-fields --wrap=80 | pbcopy
}


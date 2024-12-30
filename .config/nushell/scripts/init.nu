export def "init yarn" [] {
    echo "set yarn version"
    yarn set version stable

    echo "copy yarn config"
    cp ~/.config/yarn/.yarnrc.yml .

    echo "run yarn install"
    yarn

    # https://yarnpkg.com/getting-started/qa#which-files-should-be-gitignored
    let git_ignore_yarn = (
        [
            ".pnp.*",
            ".yarn/*",
            "!.yarn/patches",
            "!.yarn/plugins",
            "!.yarn/releases",
            "!.yarn/sdks",
            "!.yarn/versions",
        ]
        | str join "\n"
    )

    echo "setup .gitignore"
    $git_ignore_yarn | save --append .gitignore
}

export def "init prettier" [] {
    echo "install prettier"
    yarn add -D prettier

    echo "add format script"
    let package_json = (cat package.json)
    $package_json | jq '.scripts.format = "prettier -w ./**/*.{ts,tsx,js,jsx,css,scss,html,json,md}"' | save -f package.json
}

export def "init biome" [] {
    echo "install biome"
    yarn add -D @biomejs/biome

    cp ~/.config/biome/biome.json .

    echo "add format script"
    mut package_json = (cat package.json)
    $package_json = ($package_json | jq '.scripts.format = "biome format --write"')

    echo "add lint script"
    $package_json = ($package_json | jq '.scripts.lint = "biome lint --fix"')

    $package_json | save -f package.json
}

export def "init sql-formatter" [] {
    let config = cat ~/.config/sql-formatter/config.json

    # https://github.com/sql-formatter-org/sql-formatter/blob/master/docs/language.md
    let languages = [sql, bigquery, db2, db2i, hive, mariadb, mysql, tidb, n1ql, plsql, postgresql, redshift, singlestoredb, snowflake, spark, sqlite, transactsql, trino] | sort
    let language = (
        $languages
        | str join "\n"
        | fzf --reverse --height=~100%
    )

    $config | jq $'.language = "($language)"' | save -f .sql-formatter.json
}

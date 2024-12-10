export def "init yarn" [] {
    yarn set version stable
    echo "set yarn version"

    cp ~/.config/yarn/.yarnrc.yml .
    echo "copied yarn config"

    yarn
    echo "ran yarn install"

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

    $git_ignore_yarn | save --append .gitignore
    echo "setup .gitignore"
}

export def "init prettier" [] {
    yarn add -D prettier
    echo "installed prettier"

    let package_json = (cat package.json)
    $package_json | jq '.scripts.format = "prettier -w ./**/*.{ts,tsx,js,jsx,css,scss,html,json,md}"' | save -f package.json
    echo "added format script"
}

export def "init biome" [] {
    yarn add -D @biomejs/biome
    echo "installed biome"

    cp ~/.config/biome/biome.json .

    mut package_json = (cat package.json)
    $package_json = ($package_json | jq '.scripts.format = "biome format --write"')
    echo "added format script"

    $package_json = ($package_json | jq '.scripts.lint = "biome lint --fix"')
    echo "added lint script"

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

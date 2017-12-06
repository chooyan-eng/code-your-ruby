# Code The Ruby

Code The Ruby is a workspace to practice ruby with ruby engineers around the world.

# これは何？

Code The Ruby は、Rubyを使ってみなさんが書いた小さなプログラムを同じリポジトリにプルリクすることで、Rubyの実践的な書き方を学ぼうという試みです。

同じ課題に対して多くの人が同じリポジトリへプルリクし、議論することで、自分一人では気づけない良い書き方や観点を身につけられる場になればと思います。

# 作業手順

1. このリポジトリをForkします。
1. Forkしたリポジトリをローカルマシンにcloneします。
1. 問題を確認します。問題はspecificationディレクトリに１問ずつテキストファイルで保存されています。
1. userディレクトリに、GitHubアカウント名でディレクトリを作成します。これが作業ディレクトリになります。
1. 作業ディレクトリに、課題の実装コードを配置するlibディレクトリとテストコードを配置するtestディレクトリを作成します。
1. 課題の仕様を満たす実装コードとそのテストコードが書けたらそれらをPushし、プルリクを出してください。

# ディレクトリ構成

例えばユーザー名が`chooyan-eng`の場合、ディレクトリ構成は以下のようになります。

```
$ tree
.
├── README.md
├── specification
│   └── fizz_buzz.txt
└── user
    └── chooyan-eng
        ├── lib
        │   └── fizz_buzz
        └── test
            └── fizz_buzz
```


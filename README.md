# Haskell 開発環境

このリポジトリは Docker 化された Haskell 開発環境を提供します。

## 必要条件

- Docker
- Docker Desktop

## セットアップと起動方法

1. Docker イメージのビルド:

```bash
docker compose build
```

2. コンテナの起動:

```bash
docker compose up -d
```

3. GHCi の起動:

```bash
docker compose exec haskell bash -c "cd src && ghci"
```

## 機能

- GHC 9.4.7
- Cabal
- Stack（ベースイメージに含まれる）
- 開発ツール（git, vim, curl）

## サンプルコードの説明

このプロジェクトには以下の 3 つのサンプルファイルが含まれています：

### 1. Main.hs

- 基本的な算術関数（add, multiply）
- 文字列操作（greet）
- リスト処理の基本例（doubleList）
- 実行例を含むメイン関数

### 2. ListOperations.hs

- リストの操作に関する様々な関数
- フィルタリング（filterEven）
- 合計計算（sumList）
- リストの反転（reverseList）
- 重複削除（removeDuplicates）
- カスタム zipWith 実装

### 3. Types.hs

- カスタムデータ型の定義と使用例
- 代数的データ型（Person, Shape）
- Maybe 型と Either 型の使用例
- 型クラスの実装例（Describable）

## GHCi でのコードの実行方法

GHCi を起動したら、以下のコマンドでモジュールを読み込んで実行できます：

1. Main.hs の実行:

```haskell
:l Main
main                    -- メイン関数を実行
add 5 3                -- 加算関数をテスト
greet "世界"           -- 挨拶関数をテスト
doubleList [1,2,3,4,5] -- リスト処理関数をテスト
```

2. ListOperations.hs の実行:

```haskell
:l ListOperations
filterEven [1..10]           -- 偶数のフィルタリング
sumList [1..5]               -- リストの合計
removeDuplicates [1,1,2,2,3] -- 重複の削除
```

3. Types.hs の実行:

```haskell
:l Types
let person = Person "田中太郎" 25  -- Person型のインスタンス作成
describe person                    -- 人物の説明
area (Circle 5)                    -- 円の面積計算
```

## 便利な GHCi コマンド

- `:l <モジュール名>` - モジュールをロード
- `:r` - 現在のモジュールをリロード（ファイル編集後）
- `:t <式>` - 式の型を表示
- `:q` - GHCi を終了
- `:?` - ヘルプを表示

## 開発について

コンテナ内の`/app`ディレクトリはローカルディレクトリにマウントされているため、
ローカルで行った変更はコンテナ内にすぐに反映されます。

## コンテナの停止

開発を終了する際は以下のコマンドでコンテナを停止できます：

```bash
docker compose down
```

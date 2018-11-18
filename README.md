# README

# 課題克服アプリ　「Complex」

## 概要

ユーザが抱える嫌な思い出を力に変えるお手伝いをするアプリです。  
ネガティブな出来事を可視化して、力に変える切っ掛けにします。

## コンセプト

ブログ（出来事や思いを投稿）＋タスク管理（コメント欄で進捗管理）

## バージョン

Ruby 2.4.0 Rails 5.1.6

## 機能一覧

- ログイン機能
- ユーザー登録機能
    - メールアドレス、名前、パスワードは必須
- パスワード再設定機能
- ブログ一覧表示機能
    - コメント数を表示
    - 優先度ラベルを選択することで記事のソートが可能
- ブログ投稿機能
    - タイトルと記事内容は必須
- ブログ編集機能
- ブログ削除機能
    - ブログ編集とブログ削除は投稿者のみ実行可能
- ブログラベル機能
    - ブログにABCの３種類のラベルを付ける。ランク機能と合わせて使用する。
- ブログランク機能
    - ABCの３段階のランクをつけることで優先順位がつき、掲載順が変わる。
- タスク管理機能
    - ブログ内にある★マークの状態で完了/未完了がわかる
- コメント投稿機能
- コメント削除機能
- コメント編集機能
    - コメント編集とコメント削除はコメントした本人のみ可能
    - コメント機能とタスク管理機能についてはページ遷移なしで実行できる

## カタログ設計
https://docs.google.com/spreadsheets/d/1509-2Kp_e7FihrLHP99TokWjNUVz8i8C7SEiR5jaH5I/edit?usp=sharing

## テーブル定義
https://docs.google.com/spreadsheets/d/1Rmt08vOyTc2q2P4Ma_bvEqNTucXWAOUmy4hr8hIkTbw/edit?usp=sharing

## 画面遷移図
https://docs.google.com/spreadsheets/d/1aFPAvI_eUDu_XiMEixJKqxJO-3LxXibVDKgsLcVDXsk/edit?usp=sharing

## 画面ワイヤーフレーム
https://docs.google.com/spreadsheets/d/1ZIEcSqfw20Foohazqib-bjjKMy9Dpu37wsSy3YpWh0I/edit?usp=sharing

## 使用予定gem
device  
Ajax  
kaminari  
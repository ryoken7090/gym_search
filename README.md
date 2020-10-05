# README

# Tokyo Gym Search

## URL
https://www.tokyo-gym-search.net/

## 概要
多くのチェック項目を設け、複数条件からジム検索ができるような施設の情報比較サービスです。


## コンセプト
検索を一度で済ませるジム検索サービス

## 使用技術
* Ruby 2.6.5
* Rails 5.2.4
* Rspec
* jQuery
* Bootstrap4
* PostgreSQL
* AWS(EC2 / RDS / Route53 / ELB)

## ER図
![ER図](https://user-images.githubusercontent.com/64633190/95099925-7faef680-076b-11eb-85f9-5ca4178a6f4b.png)

## サービス構成図
![構成図](https://user-images.githubusercontent.com/64633190/95070957-e3252e00-0743-11eb-82cd-531e5c54c2a7.png)

# 当サービスについて
## 作成動機
トレーニングジムを探そうと思ったときに、最寄り駅、月会費、営業時間を調べるくらいならすぐに出てくるのですが、設備はどれくらい充実してるのか、どんなマシンが置いてあるのかなどと調べようと思うとなかなか情報がヒットしません。特にマシンの情報などは個別HPにすら載っておらず、知ろうと思ったら問い合わせるほかない場合もあります。
「ジム選びにこだわりが出てきた人」のために、詳細な情報がまとまっており検索項目も充実したジム検索サービスを作ろうと考えこのアプリを制作することにしました。

## ユーザー調査
ポートフォリオを構想段階でユーザーに調査を行いました。

### ユーザーの声で修正した点
* レビュー機能作成の際、項目ごとに評価できるようにしていなかった  
→フリーウェイトエリア、マシーンエリア、有酸素エリアで項目ごとに評価をつけられるようにした。
* ビジター利用(月ごとでなく一回ごとにジムを利用)ができるかという項目がなかった  
→出先でビジター利用できるジムを探すことが多いとの声があったため、ビジター利用を登録・検索の情報に追加。


## 設計

[カタログ設計](https://docs.google.com/spreadsheets/d/1NnqOkuqFwCUUrP8dUjpJjEnQm-ybjvB7IAqeH-M-MCM/edit#gid=1177389026)


[テーブル定義](https://docs.google.com/spreadsheets/d/1eubihlLC9g_bCP-sC153ZDaeJy0ijF02CvrlFSkc_Kk/edit#gid=271623951)


[画面遷移図](https://docs.google.com/spreadsheets/d/1luWBHwJEdttW3AcxCSiDqK2NHNQeFx2mDTDbIZe1jc0/edit#gid=0)

[ワイヤーフレーム](https://docs.google.com/spreadsheets/d/1wsZxmldtGIEFIDORjKb8RfE7V58nvpCDhsSpxmRp07c/edit#gid=0)

## 機能一覧
* ジム情報投稿機能
* お気に入り機能(Ajax使用)
* レビュー投稿機能(Ajax使用)
* ジム情報検索機能(Ransack使用)
* ログイン/ログアウト機能(Devise使用)
* 管理者ログイン機能

## 使用Gem
* kaminari
* device
* rails-admin
* ransack

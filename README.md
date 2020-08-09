# README

# Tokyo Gym Search

## 概要
多くのチェック項目を設け、複数条件からジム検索ができるような施設の情報比較サービスです。
トレーニングジムを探そうと思ったときに、最寄り駅、月会費、営業時間を調べるくらいならすぐに出てくるのですが、設備はどれくらい充実してるのか、どんなマシンが置いてあるのかなどと調べようと思うとなかなか情報がヒットしません。特にマシンの情報などは個別HPにすら載っておらず、知ろうと思ったら問い合わせるほかない場合もあります。
「ジム選びにこだわりが出てきた人」のために、詳細な情報がまとまっており検索項目も充実したジム検索サービスを作ろうと考えこのアプリを制作することにしました。

## コンセプト
2度検索ボタンを押させないジム検索サービス

## バージョン
Ruby 2.6.5 Rails 5.2.4

## 機能一覧
* ジム情報投稿機能
* ジム情報検索機能
* 評価・レビュー投稿機能
* ジム情報一覧表示機能
* ジム詳細表示機能
* ジム情報編集機能
* ジム情報削除機能
* ログイン/ログアウト機能
* 管理者ログイン機能
* タグ管理機能
* ページネーション
* お気に入り機能


## カタログ設計
https://docs.google.com/spreadsheets/d/1NnqOkuqFwCUUrP8dUjpJjEnQm-ybjvB7IAqeH-M-MCM/edit#gid=1177389026

## テーブル定義
https://docs.google.com/spreadsheets/d/1eubihlLC9g_bCP-sC153ZDaeJy0ijF02CvrlFSkc_Kk/edit#gid=271623951

## ER図
https://docs.google.com/spreadsheets/d/1FuEdb3ykAkycW36tWjsp3To5IqwfS3r3KMELRruflxM/edit#gid=0

## 画面遷移図
https://docs.google.com/spreadsheets/d/1luWBHwJEdttW3AcxCSiDqK2NHNQeFx2mDTDbIZe1jc0/edit#gid=0

## ワイヤーフレーム
https://docs.google.com/spreadsheets/d/1wsZxmldtGIEFIDORjKb8RfE7V58nvpCDhsSpxmRp07c/edit#gid=0

## 使用予定Gem
* kaminari
* carrierwave
* mini_magick
* device
* cancancan
* ransack

# English Ver

## Overview
It is a facility information comparison service that allows you to search for gyms from multiple conditions by providing many check items.
When I try to find a training gym, it will come up soon if I look up the nearest station, monthly fee, business hours. When I think about it, information does not hit easily. In particular, the machine information is not even listed on the individual HP, and in some cases you may have no choice but to ask if you want to know.
For "people who are particular about choosing a gym", I decided to create this app in order to create a gym search service that has detailed information and complete search items.
## Concept
Gym search service that does not let you press the search button twice.

## Version
Ruby 2.6.5 Rails 5.2.4

## List of Functions
* Ability to post gym information
* Ability to search for gym information
* Ability to post ratings and reviews
* Ability to list gym information
* Ability to edit gym information
* Login function
* Administrator login function
* Function to add gym information to favorites
* Pagination

## Catalog Design
https://docs.google.com/spreadsheets/d/1NnqOkuqFwCUUrP8dUjpJjEnQm-ybjvB7IAqeH-M-MCM/edit#gid=1177389026

## Table Definition
https://docs.google.com/spreadsheets/d/1eubihlLC9g_bCP-sC153ZDaeJy0ijF02CvrlFSkc_Kk/edit#gid=271623951

## E-R diagram
https://docs.google.com/spreadsheets/d/1FuEdb3ykAkycW36tWjsp3To5IqwfS3r3KMELRruflxM/edit#gid=0

## Screen Transition Diagram
https://docs.google.com/spreadsheets/d/1luWBHwJEdttW3AcxCSiDqK2NHNQeFx2mDTDbIZe1jc0/edit#gid=0

## Wire Flame
https://docs.google.com/spreadsheets/d/1wsZxmldtGIEFIDORjKb8RfE7V58nvpCDhsSpxmRp07c/edit#gid=0

## To be used Gem
* kaminari
* carrierwave
* mini_magick
* device
* cancancan
* ransack

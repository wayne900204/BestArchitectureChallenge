# 📢📢📢 Flutter Best Architecture Challenge 📢📢📢
嗨！Flutter Taipei 的大家還好嗎？  
由於疫情嚴峻，Flutter Taipei 已經有一陣子沒有辦活動了🥲  
已經很多人在敲碗問有沒有線上活動可以參加，別急別急！我們可是都聽到了呢！  
Flutter Taipei 準備要來響應前幾週 GDG Taipei 辦的 Best practice challenge 活動啦 📢  
活動內容是將我們準備的一個 Code 非常 Free Style 的 Flutter Project  
目標是將它改寫成你自己心中認為最理想的樣子🤘  
不管你是要 BLoC/MVVM/MVC/MVP/MVI/Redux 或是各種架構通通都沒有問題😎  
再搭配你知道的好用 Library、分享你會如何做單元測試、UI整合測試等等  
讓你想怎麼 show 就怎麼 show，讓大家知道你多麽的 6⃣ (單押x3) 

也許在實際開發中，需求單純的專案不需套用過多 Pattern，畢竟殺雞焉用牛刀呢🔪  
但我們希望透過這次的活動，讓大家在面對專案架構時，產生更多元化的思考  
對於開發老手而言，可以分享自己的技術架構與思路、與其他經驗豐富的夥伴一起交流切磋  
對於剛入門的初心者，也能參考別人架構的實踐方式  
實作完後讓大家看有沒有自己原本沒注意到的地方，相信一定能收到很棒的回饋！  

在活動的尾聲，我們會從有參與這次活動的夥伴中  
徵求自願者，向大家分享自己在活動中的專案和思路  
若已經是 Flutter 開發者，也可以分享自己平時的開發習慣和慣用的程式架構 🙌  
當然～～～好康是絕對不能少的！我們已經向 Google 爭取到小禮物啦！  
準備送給自願分享者以及此次活動的優勝者囉🏆  

話不多說！趕快 Fork 專案！Let's get started !  
專案傳送門： https://github.com/flutterTaipei/BestArchitectureChallenge

**如果對活動有任何建議或想法的，也歡迎來信通知我們唷🥳**  
**聯絡方式：flutter.taipei@gmail.com**

## 活動時間
即日起至 2021 年 8 月 31 日晚上 00:00 分截止

## 評選方式
以 Github 專案獲得的星星數，由多到少排序，取前 3 名為優勝者

## 獲勝獎品
Google 贊助的 Flutter 馬克杯乙份 🎁

## 參賽方式

1. Fork Flutter Taipei 的 專案到你自己的 Github 上
2. 在專案 README 找地方註明「此為參加 Flutter Best Architecture Challenge 活動的專案」，並留下可以讓我們聯絡到你聯絡方式
3. 改寫架構後並提交，就這麼簡單！

## 增加星星小秘訣⭐️⭐️⭐️

1. 在 README 介紹你的架構、介紹你使用的第三方套件以及為什麼會去使用它，  
   甚至去分析你的架構優缺點在哪裡（小編看到詳細的README絕對第一個去Star 🙋‍♂️
2. 在 Flutter Taipei Facebook 社團 或 Discord 分享你的專案或提問，和大家一起討論，增加曝光度

___


## 開發環境

```
Flutter 2.2.2 • channel stable • https://github.com/flutter/flutter.git
Framework • revision d79295af24 (3 weeks ago) • 2021-06-11 08:56:01 -0700
Engine • revision 91c9fc8fe0
Tools • Dart 2.13.3
```
## 目標

- 將貼文API的內容呈現在畫面上，這裡使用 https://jsonplaceholder.typicode.com/posts
- 可以根據選擇的內容來排序（範例是用id/title來排序）
- 改造成你自己的 Best Architecture 🎉🎉🎉

## 備註
 - 此為參加 Flutter Best Architecture Challenge 活動的專案
 - [My Github](https://github.com/wayne900204),
 - 📫  Reach me  **wayne900204@gmail.com**

## 架構
MVVM

![](https://github.com/wayne900204/BestArchitectureChallenge/blob/main/flutter_mvvm.png)

這個架構是很類似於 MVVM 的
 - View 是 Widget
 - ViewModel 是 Provider 的 ChangeNotifier
 - Repository 是用拿資料溝通的，
 - 再來就是 Api 和 Local Database 的 classes 了
之所以選擇使用它。是因為他的結構可以方便測試，並且分工明確

## Library

### http
 - 這個主要是用來串接 API 的套件。簡單又快速
 - [http package](https://pub.dev/packages/http)

 - Http 有錯誤的 Log 訊息。如果想要自己客製化 Exception 或是需要一些特別的設定但 Http 沒有提供的話，你可以用用看 [Dio](https://pub.dev/packages/dio)
 
 但是我推薦使用 Http，簡單又方便，提供的功能應有盡有
 
 ### Provider
 
 #### 概念
  - 基於 InheritedWidget 的套件
 #### 作用
 - 作為畫面和邏輯的溝通橋樑
 - 控制畫面更新
 - 拿到父親節點
 - 方便把邏輯區分出來
 - 共享資料

 ## 整個 Project 的概念
![](https://github.com/wayne900204/BestArchitectureChallenge/blob/main/project_structure.png)

我在 MaterialApp 外面包了一個父親節點（ChangeNotifierProvider），並在 PostPage 裡面有一個 Widget 是 PopupMenuItem，另外裡面呼叫了一個 ListView 的 StatelessWidget Class。我在 PostPage 的 initState 裡面呼叫了
```dart
context.read<PostProvider>().fetchData(SortState.sortWithId);
```
並在 PopupMenuItem 裡面去做使用 id、userId、title、body 排序。
```dart
context.read<PostProvider>().fetchData(value);
```
接著，我們需要再 ListView 裡面知道資料更動了，而且我又不希望整個畫面更新，我只想更新 listView，因此我使用
```dart
context.select((PostProvider p) => p.posts);
```
來更新我的部分元件。

## Unit Test
### 測試項目
 - 我的 state 的狀態是否是我要的
 - 我的 api 成功回傳後是否是我要的型態。

這邊我並沒有測試 compare 後是不是我要的結果，因為邏輯相對簡單，因此我就沒有寫測試了。

### Library
 - [mockito](https://pub.dev/packages/mockito) 他是用來塞入假資料的。
 - [build_runner](https://pub.dev/packages/build_runner) 他是自動幫忙把 mockito 類似於 interface 的東西產生。

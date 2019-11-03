//
//  GameActionBranch.swift
//  Trump364
//
//  Created by 宏輝 on 21/07/2019.
//  Copyright © 2019 Hiroki Kondo. All rights reserved.
//

import Foundation



class GameActionBranch {
    
//ここではUserDefaultsで「選択した内容」をif文などの分岐をつかって、ゲーム内容を組み立ててのコードを書く箇所です。
//if文だと一つ一つを分けるのが大変だが、switch文で用意したら拡張を持たせるのが簡単かも。

    
    //タイムアタックモードでの見解。"正答率70%以上"かつ"短時間クリア"でランキングを掲載など条件を載せないと、早く終了することでランキング掲載だと、適当に押されて正解になりそう・・・。
    
    //リバースモード選択時に、画像を反転させる
    var reverseCardMode = false
    //選択されたゲームカードを入れる関数
    var gameProperty = GameProperty()
    
   
    
    
    //「はじめから」を選択時にゲームシナリオを分岐させるfunc
    func separateGamePattern(){
    
        let gameMode =  UserDefaults.standard.object(forKey: "gameMode") as! String
        let gameCource = UserDefaults.standard.object(forKey: "gameCource") as! String
        let gameDegree = UserDefaults.standard.object(forKey: "gameDegree") as! String
    
    //ここでgameModeを定義する。モードが増えたら、ここに追加することで拡張性を持たせる。
        //モードの分岐
        if gameMode == "Mission" {
            //ミッションモードへ移行 funcで定義
        } else if gameMode == "TimeAttack" {
            //タイムアタックモードへ移行 funcで定義
        } else if gameMode == "CountDown" {
            //カウントダウンモードへ移行 funcで定義
        } else if gameMode == "Free" {
            //フリーモードへ移行　funcで定義
        }

        
   
        
        
    //ここでgameCourseを定義する。モードが増えたら、ここに追加することで拡張性を持たせる。
        //コースの分岐,GameCourceImageから抽出
        if gameCource == "トランプ" {
           
            //リバースモードチェック
            reverseCardMode = false
            UserDefaults.standard.set(reverseCardMode, forKey: "reverseCardModeCheck")
           
            //トランプ配列をbeforeGameCalculateImage、beforeGameCalculateCountに入れる
        } else if gameCource == "ひらがな" {
           
            let hiragana = Hiragana()
            
            //リバースモードチェック
            reverseCardMode = false
            UserDefaults.standard.set(reverseCardMode, forKey: "reverseCardModeCheck")
        
            gameProperty.usedCardImageArray = hiragana.hiraganaImageArray
            gameProperty.usedCardIntArray = hiragana.hiraganaCountArray
            //ひらがな配列をbeforeGameCalculateImage、beforeGameCalculateCountに入れる
        } else if gameCource == "ひらがなリバース" {
           
            //リバースモードチェック
            reverseCardMode = true
            UserDefaults.standard.set(reverseCardMode, forKey: "reverseCardModeCheck")
            
            //ひらがなリバース配列をbeforeGameCalculateImage、beforeGameCalculateCountに入れる
            //ひらがなのimageを横に反転させる　ここはfunc(reverse:Bool){}という定義を入れて、必ず反転の有無を確認することにしよう
            //あるいは反転の画像を用意する？そのほうが簡単かな？
        } else if gameCource == "カタカナ" {
           
            //リバースモードチェック
            reverseCardMode = false
            UserDefaults.standard.set(reverseCardMode, forKey: "reverseCardModeCheck")
            //カタカナ配列をbeforeGameCalculateImage、beforeGameCalculateCountに入れる
        } else if gameCource == "カタカナリバース" {
            
            //リバースモードチェック
            reverseCardMode = true
            UserDefaults.standard.set(reverseCardMode, forKey: "reverseCardModeCheck")
            //カタカナりば〜す配列をbeforeGameCalculateImage、beforeGameCalculateCountに入れる
            //カタカナのimageを横に反転させる　　ここはfunc(reverse:Bool){}という定義を入れて、必ず反転の有無を確認することにしよう
            //あるいは反転の画像を用意する？そのほうが簡単かな？
        }
        
        
        
        
        
        //難易度の分岐、枚数を取得,将来的にはプラスマイナス計算も実装
        if gameDegree == "13枚プラス"  {
        //GameWindowViewControllerで、配列の最初から13枚を抜き出し、それをシャッフル
            //ループ処理を13回にする
            gameProperty.quantityOfCard = 13
            
        } else if gameDegree == "26枚プラス" {
            //GameWindowViewControllerで、配列の最初から26枚を抜き出し、それをシャッフル
            //ループ処理を26回にする
        } else if gameDegree == "26枚マイナス" {
            //GameWindowViewControllerで、配列の最初から26枚を抜き出し、それをシャッフル
            //ループ処理を26回にする
            //13枚はマイナスIntにする　ここはfunc(Minus:Bool){}という定義を入れて、必ずマイナスIntの有無を確認することにしよう
            //あるいはマイナスIntをGameCourceImageごとに用意する？　これは冗長的なコードになりそう・・・。
        } else if gameDegree == "52枚プラス" {
            //GameWindowViewControllerで、配列の最初から52枚を抜き出し、それをシャッフル
            //ループ処理を52回にする
        } else if gameDegree == "52枚マイナス" {
            //GameWindowViewControllerで、配列の最初から52枚を抜き出し、それをシャッフル
            //ループ処理を52回にする
            //26枚はマイナスIntにする　　ここはfunc(Minus:Bool){}という定義を入れて、必ずマイナスIntの有無を確認することにしよう
            //あるいはマイナスIntをGameCourceImageごとに用意する？　これは冗長的なコードになりそう・・・。
        }
    }
    
    
    
    
////    モードの分岐
//    switch gameMode {
//
//    case "Mission":
//        //ミッションモードへ移行
//    case "TimeAttack":
//        //タイムアタックモードへ移行
//    case "CountDown":
//        //カウントダウンモードへ移行
//    case "Free":
//        //フリーモードへ移行
//    }
    
//    //コースの分岐,GameCourceImageから抽出
//    switch gameCource {
//
//    case "トランプ":
//    //トランプ配列をbeforeGameCalculateImage、beforeGameCalculateCountに入れる
//
//    case "ひらがな":
//    //ひらがな配列をbeforeGameCalculateImage、beforeGameCalculateCountに入れる
//
//    case "ひらがなリバース":
//    //ひらがなリバース配列をbeforeGameCalculateImage、beforeGameCalculateCountに入れる
//    //ひらがなのimageを横に反転させる
//
//    case "カタカナ":
//    //カタカナ配列をbeforeGameCalculateImage、beforeGameCalculateCountに入れる
//
//    case "カタカナリバース"
//    //カタカナりば〜す配列をbeforeGameCalculateImage、beforeGameCalculateCountに入れる
//    //カタカナのimageを横に反転させる
//
//    }
    
    
//    //難易度の分岐、枚数を取得,将来的にはプラスマイナス計算も実装
//    switch gameDegree {
//
//    case "13枚プラス":
//    //GameWindowViewControllerで、配列の最初から13枚を抜き出し、それをシャッフル
//    //ループ処理を13回にする
//    case "26枚プラス":
//    //GameWindowViewControllerで、配列の最初から26枚を抜き出し、それをシャッフル
//    //ループ処理を26回にする
//    case "26枚マイナス":
//    //GameWindowViewControllerで、配列の最初から26枚を抜き出し、それをシャッフル
//    //ループ処理を26回にする
//    //13枚はマイナスIntにする
//
//    case "52枚プラス":
//    //GameWindowViewControllerで、配列の最初から52枚を抜き出し、それをシャッフル
//    //ループ処理を52回にする
//    case "52枚マイナス":
//    //GameWindowViewControllerで、配列の最初から52枚を抜き出し、それをシャッフル
//    //ループ処理を52回にする
//    //26枚はマイナスIntにする
//    }
    
}
 


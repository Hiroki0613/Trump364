//
//  GameWindowViewController.swift
//  Trump364
//
//  Created by 宏輝 on 28/07/2019.
//  Copyright © 2019 Hiroki Kondo. All rights reserved.
//

import Foundation

class GameWindowView {
    
    //ここはGameActionBranchで作成したゲーム内容を元に、実際のゲームに実装されるコードを書く場所です。
    //トランプ等のimageもここに集約していきます。（画像自体は別クラスに用意）
    //GenerateRandomNumberDoNotRepeatを継承して、ランダムに生成するところまでを行います。
    //ここでCircleProgressBarの色をゲームモードに応じて変更するのもアリかも。

    
    init() {
    }
    

    //ここでGameDegreeでUserDefaultsに入れた数値の数だけGameCourceImageの写真を取り出し、さらに乱数を用いて中身を入れ替える。
    var hiragana = Hiragana()
    var gameProperty = GameProperty()

//    var gameCalucImage:[String]

    
    
    func generateRamdomNumberUsedUserDefaultsImage() -> [String]{
        
    //最初にGameCourceImageから任意の枚数を取り出す。
    //イメージは「全トランプ54枚からスペードの13枚を取り出す」
    var beforeGameCalculateImage : [String] = [""]
    
        
        print(gameProperty.quantityOfCard)
    //ループ処理で取り出す。取り出す枚数は変数にしておく。
    //現時点では暫定で4を入れている
    for i in 0 ... gameProperty.quantityOfCard-1 {
    beforeGameCalculateImage.append(gameProperty.usedCardImageArray[i])
        }
        //ここで最初に入れた空白のものを取り除く
        beforeGameCalculateImage.remove(at: 0)
    
    //ここで取り出した配列を確認する。
    print(beforeGameCalculateImage)
    
        let generateRandomNumberDoNotRepeat = GenerateRandomNumberDoNotRepeat()
    var randomNumber = generateRandomNumberDoNotRepeat.generateRandomNumber(0, 4, nil)
    
    var gameCalculateImage : [String] = [""]
        
        print(randomNumber)
        
    
    //ループ処理で取り出す。取り出す枚数は変数にしておく。
    //現時点では暫定で4を入れている
    
    for j in 0 ... gameProperty.quantityOfCard - 1 {
    gameCalculateImage.append(beforeGameCalculateImage[randomNumber[j]])
        }
        //ここで最初に入れた空白のものを取り除く
        gameCalculateImage.remove(at: 0)
        print(gameCalculateImage)
        return gameCalculateImage
    }
    
        
        
        
        
        
    func generateRamdomNumberUsedUserDefaultsCount() -> [Int] {
        
        //最初にGameCourceImageから任意の枚数を取り出す。
        //イメージは「全トランプ54枚からスペードの13枚を取り出す」
        //現時点では5枚取り出すことにする。
        var beforeGameCalculateCount : [Int] = [0]
        
        //ループ処理で取り出す。取り出す枚数は変数にしておく。
        //現時点では暫定で4を入れている
        for i in 0 ... 4 {
            beforeGameCalculateCount.append(gameProperty.usedCardIntArray[i])
        }
        
        //ここで最初に入れた空白のものを取り除く
         beforeGameCalculateCount.remove(at: 0)
        
        //ここで取り出した配列を確認する。
        print(beforeGameCalculateCount)
        
        
        let generateRandomNumberDoNotRepeat = GenerateRandomNumberDoNotRepeat()
        var randomNumber = generateRandomNumberDoNotRepeat.generateRandomNumber(0, 4, nil)
        
        var gameCalculateCount : [Int] = [0]
        
        print(randomNumber)
        
        //ループ処理で取り出す。取り出す枚数は変数にしておく。
        //現時点では暫定で4を入れている
        
        for j in 0 ... 4 {
                gameCalculateCount.append(beforeGameCalculateCount[randomNumber[j]])
        }
        
        //ここで最初に入れた空白のものを取り除く
        gameCalculateCount.remove(at: 0)
        print(gameCalculateCount)
        return gameCalculateCount
    
        }
    
}
        


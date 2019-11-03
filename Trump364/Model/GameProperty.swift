//
//  GameProperty.swift
//  Trump364
//
//  Created by 宏輝 on 04/08/2019.
//  Copyright © 2019 Hiroki Kondo. All rights reserved.
//

import Foundation

//ここでは各プロパティを入れておく。
//例えば、使用するカードの枚数を usedCard:Int = 0 といった感じ。
class GameProperty {
    
    //ゲームで使用するカードの種類
    var usedCardImageArray: [String] = [""]
    //ゲームで使用するカードの枚数13,26,52
    //カスタムゲームで使用するカードの枚数 2〜99枚まで
    var usedCardIntArray: [Int] = [0]

    //使用するカードの枚数
    var quantityOfCard: Int = 13
    
}

//
//  GenerateRandomNumberDoNotRepeat.swift
//  Trump364
//
//  Created by 宏輝 on 16/07/2019.
//  Copyright © 2019 Hiroki Kondo. All rights reserved.
//

import Foundation

class GenerateRandomNumberDoNotRepeat{
    
//ここではランダムに生成された値（重複無し）を作成するコードが実装されています。
//可能ならば、Controllerの中に新規グループを作成して、GenerateRandomNumberDoNotRepeatとCircleProgressBarをその中に入れたい。
    
    func generateRandomNumber(_ from:Int, _ to:Int, _ qut:Int?) -> [Int]
    {
        var myRandomNumbers = [Int]() //All our generated numbers
        var numberOfNumbers = qut //How many numbers to generate
        
        let lower = UInt32(from) //Generate from this number..
        let higher = UInt32(to+1) //To this one
        
        if numberOfNumbers == nil || numberOfNumbers! > (to-from) + 1
        {
            numberOfNumbers = (to-from) + 1
        }
        
        
        while myRandomNumbers.count != numberOfNumbers
        {
        
            let myNumber = arc4random_uniform(higher - lower) + lower
            
            if !myRandomNumbers.contains(Int(myNumber))
            {
                myRandomNumbers.append(Int(myNumber))
            }
        
        }
        
        return myRandomNumbers
    }
}

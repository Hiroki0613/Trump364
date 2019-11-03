//
//  UIImageFlipHorizontal.swift
//  Trump364
//
//  Created by 宏輝 on 28/07/2019.
//  Copyright © 2019 Hiroki Kondo. All rights reserved.
//

//ここではUIImageを反転させるコードを記述する

import UIKit

class MillerUIImage {

    //ここでUIImageViewの画像を反転するfuncを記載
    func miller(imageView:UIImageView) -> UIImageView {
       
        var transMiller = CGAffineTransform() 
        transMiller = CGAffineTransform(scaleX: -1, y: 1)
        imageView.transform = transMiller
        
        return imageView
    }
    
}

/*参考資料
Swift4でUIImageの反転
 https://qiita.com/knou/items/500d2af0ceaa6ac54958
 
 CGAffineTransform
 https://qiita.com/tasuku1/items/e8bc500a5e8f37e278b8
 */


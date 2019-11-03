//
//  ViewController.swift
//  Trump364
//
//  Created by 宏輝 on 01/07/2019.
//  Copyright © 2019 Hiroki Kondo. All rights reserved.
//

//ここではホーム画面を表示する。初めから、続きからの２つを表示させる。

import UIKit

class StartViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        //「はじめから」ボタンを実装
//        let startButton = UIButton()
//        startButton.addTarget(self, action: #selector(goToGameModeButton(_ :)), for: .touchUpInside)
//        startButton.setTitle("はじめから", for: .normal)
//        startButton.center = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height/3)
//        startButton.sizeToFit()
//        self.view.addSubview(startButton)
//
//
//        //「つづきから」ボタンを実装
//        let continueButton = UIButton()
//        continueButton.addTarget(self, action: #selector(goToContinue(_ :)), for: .touchUpInside)
//        continueButton.setTitle("つづきから", for: .normal)
//        continueButton.center = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height/3*2)
//        continueButton.sizeToFit()
//        self.view.addSubview(continueButton)
//
//    }
//
//    @objc func goToGameModeButton(_ sender:UIButton){
//        performSegue(withIdentifier: "goToGameMode", sender: nil)
//    }
//
//    @objc func goToContinue(_ sender:UIButton){
//        //ここで前回の続きのモードが呼び出される
//    }
    
    

        //ナビゲーションコントローラーをHiddenにする
        //viewDidAppearで実装しているので、ここでは不要
//        navigationController?.isNavigationBarHidden = true
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        //ゲームモードの選択肢から戻ってきたときにナビゲーションコントローラーを非表示にする。
        navigationController?.isNavigationBarHidden = true
    }
    
    
    @IBAction func startButton(_ sender: Any) {
        
        performSegue(withIdentifier: "goToGameMode", sender: nil)
        
        //ここでUserDefaultsを削除する
        //と思いましたが、都度書き込むのが大変なので、上書き保存に変更
        //エラーが出ていたのでカットしているという側面もある。
//        UserDefaults.removeObject("gameMode")
//        UserDefaults.removeObject("gameCource")
//        UserDefaults.removeObject("gameDegree")
        
        //次のページ以降ででナビゲーションコントローラーが表示されるようにする。
        navigationController?.isNavigationBarHidden = false
    }
    
    
    
    
    @IBAction func goToContinue(_ sender: Any) {
        //ここで前回の続きのモードが呼び出される
        //すぐにゲームが始められるように工夫する
        
        
        //暫定でストーリーボードIDにて、画面遷移
                let viewVC = storyboard?.instantiateViewController(withIdentifier: "gameActionViewController") as! GameActionViewController

                navigationController?.pushViewController(viewVC, animated: true)
        navigationController?.isNavigationBarHidden = false
        
    }
    
        
        
        
        
        


}


//
//  GameActionViewController.swift
//  Trump364
//
//  Created by 宏輝 on 17/07/2019.
//  Copyright © 2019 Hiroki Kondo. All rights reserved.
//

import UIKit

class GameActionViewController: UIViewController {

    //ここはゲーム画面のコードを書く箇所です。
    //GameActionBranchで決定したゲーム内容UXをクラスを使って実装
    //GameWindowViewで実装したUIをクラスを使って実装
    //このようにして、最低限の内容をここに記載することでゲームの拡張性を持たせます。
    
    //丸型プログレスバーの実装
    @IBOutlet weak var circleProgressBar: CircleProgressBar!
   
    var gameWindowView = GameWindowView()
    var gameActionBranch = GameActionBranch()
    
    
    //暫定 ボタンを押すと絵が変わるようにする
    @IBOutlet weak var gameCourseImageView: UIImageView!
    var count = 0
    var imageArray = GameWindowView().generateRamdomNumberUsedUserDefaultsImage()
    
    
    
    //ゲームスタートボタンの実装
    let gameStartButton = UIButton()
    
    //ゲームスタート時の3,2,1のカウントダウンタイマーの実装
    var countDownTimer = Timer()
    var countDownTimerProgress = Timer()
    
    
    //3,2,1の数値を用意
    var countDownTimerCount = 4
    var countDownTimerLabel = UILabel()
//    var countFired: CGFloat = 4
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ゲームスタートボタンを表示する
        gameStartButton.frame = CGRect(x: 0, y: self.view.frame.size.height/3*2, width: self.view.frame.size.width, height: self.view.frame.size.height/3)
        gameStartButton.backgroundColor = .clear
        gameStartButton.setTitle("ゲームスタート", for: .normal)
        gameStartButton.setTitleColor(UIColor.black, for: .normal)
        gameStartButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        gameStartButton.addTarget(self, action: #selector(gameStartButtonFire), for: .touchUpInside)
        self.view.addSubview(gameStartButton)
        
        
        //プログレスバーが全部フル点滅するように設定。
        circleProgressBar.progress = 1
        
        
        
        //GameWindowViewControllerで選んだ物（配列から取り出し、ランダムに入れ替えたもの）を呼び出す。
        //ここで配列を呼び出そうとしても、おかしな配列が出てしまう・・・
//        print(gameWindowView.generateRamdomNumberUsedUserDefaults())
//        print(gameWindowView.generateRamdomNumberUsedUserDefaults().self)
        
        
        
        //CircleProgressBarで使用するモードを呼び出す（タイマーor進捗状況など）
        //今回は進捗状況のみにする


        
        

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        navigationController?.isNavigationBarHidden = true
        
    }
    
    
    @objc func gameStartButtonFire(_ sender:UIButton){
        
        //カウントダウンタイマーが表示されるようにする
        countDownTimerLabel.frame = CGRect(x: view.frame.size.width / 2, y: self.view.frame.size.height/3*1, width: self.view.frame.size.width, height: self.view.frame.size.height/3)
        countDownTimerLabel.backgroundColor = .clear
        countDownTimerLabel.font = UIFont(name: "HiraginoSans-W6", size: 60)
        countDownTimerLabel.textColor = UIColor.black
        self.view.addSubview(countDownTimerLabel)

        
        print("startButtonが押されました")
        gameStartButton.isHidden = true
        
        countDownTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        countDownTimerProgress = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(countDownProgress), userInfo: nil, repeats: true)
    }
    
    //ゲームスタート時のカウントダウンを数字で表現
    @objc func countDown(){
        countDownTimerCount = countDownTimerCount - 1
        if self.countDownTimerCount == 0 {
            
            countDownTimer.invalidate()
            countDownTimerCount = 4
            countDownTimerLabel.isHidden = true
            //ゲームをスタートさせる
            print("ゲームスタート")
            
        } else {
            countDownTimerLabel.isHidden = false
            countDownTimerLabel.text = String(countDownTimerCount)
            
        }
        
    }
    
    //ここでカウントダウン時にprogressBarを回す
    //おかしな動きをしているので、ここは要検討・・・
    @objc func countDownProgress(){
        
        let progress = circleProgressBar.progress
        circleProgressBar.progress = circleProgressBar.progress + 0.001
        
        if progress < 1.1 { // 浮動小数点誤差のため、<= 1.0 だとtrueにならないことがある
        } else {
            countDownTimerProgress.invalidate()
        }
        
    }
    
    
    

    
    //ゲーム終了後
    //ナビゲーションバーを再表示するコードを入れる、画面遷移前に用意する？
    
    
    
    //ゲーム終了後←将来的な実装
    //正答率の答え合わせをする画面に移行する（ここに広告）。詳細はさらに別画面で紹介

    
    
    
    
    
    //暫定
    @IBAction func rotateButton(_ sender: Any) {
        
        if count > 4 {
            
//            gameCourseImageView.image = UIImage(named: "\(gameWindowView.generateRamdomNumberUsedUserDefaultsImage()[count])")
            gameCourseImageView.image = UIImage(named: "\(imageArray[count])")
            
            count = -1
        } else {
//            gameCourseImageView.image = UIImage(named: "\(gameWindowView.generateRamdomNumberUsedUserDefaultsImage()[count])")
            gameCourseImageView.image = UIImage(named: "\(imageArray[count])")
        }
         count = count + 1
    }
    
}

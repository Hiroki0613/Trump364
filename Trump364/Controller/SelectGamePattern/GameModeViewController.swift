//
//  GameModeViewController.swift
//  Trump364
//
//  Created by 宏輝 on 01/07/2019.
//  Copyright © 2019 Hiroki Kondo. All rights reserved.
//

import UIKit

class GameModeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    //ここはゲーム選択肢のコードを書く場所です。ここから下↓↓↓をコピーペーストすることでゲームの拡張性を持たせています。
    
    @IBOutlet weak var gameModeTableView: UITableView!
    
    //ここは後日ClassにString情報を格納して拡張性を出す
    //後日、モード選択の画面はUIImageに変更する
    var gameModeArray = ["Mission","TimeAttack","CountDown","Free"]

    
//    var gameModeArray = [GameActionBranch.gameMode.Mission,
//                          GameActionBranch.gameMode.TimeAttack,
//                          GameActionBranch.gameMode.CountDown,
//                          GameActionBranch.gameMode.Free]
    
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableViewのデリゲードをgameCourceTableViewへ適用
        gameModeTableView.delegate = self
        gameModeTableView.dataSource = self
        
        gameModeTableView.frame = self.view.frame
        
        // Do any additional setup after loading the view.
    }
    
    //セクションは１で固定
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameModeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //cellはストーリボードを使った再利用を採用
        let cell = gameModeTableView.dequeueReusableCell(withIdentifier: "gameMode", for: indexPath)
        
        //後日、UIImageに変更する
        cell.textLabel?.text = gameModeArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //        print(gameModeArray[indexPath.row])
        
        //選択されたセルをUserDefaultsへ入れる。この選択が元でゲーム内容を分岐させる。分岐させるクラスは、後日して作成予定
        UserDefaults.standard.set(gameModeArray[indexPath.row], forKey: "gameMode")
        print(UserDefaults.standard.object(forKey: "gameMode") as! String )
        
        //goToGameDegreeへ画面遷移、ゲームの選択肢が増えたら、ここはメンテが必要
        performSegue(withIdentifier: "goToGameCourse", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        //選択肢の多さは5つが最も見やすそうなので5で固定
        //後日変更するかも
        return self.view.frame.size.height / 5
    }

    
    
//    var gameMode = String()
//
//    let timeAttackButton = UIButton()
//    let countDownkButton = UIButton()
//    let freeModeButton = UIButton()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        //tableviewで全画面をtableviewにする方法
////        tableView.frame = self.view.frame
//
//        //hegihtFowRowAtでの5分割は
//        //return self.view.frame.height / 5
//
//        //タイムアタックボタンを実装
//        timeAttackButton.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height/3)
//        //文字は後日、画像にする予定
//        timeAttackButton.setTitle("タイムアタック", for: .normal)
//        timeAttackButton.backgroundColor = .blue
//        timeAttackButton.addTarget(self, action: #selector(timeAttackButtonFire), for: .touchUpInside)
//
//        self.view.addSubview(timeAttackButton)
//
//        //カウントダウンボタンを実装
//        countDownkButton.frame = CGRect(x: 0, y: self.view.frame.size.height/3*1, width: self.view.frame.size.width, height: self.view.frame.size.height/3)
//        //文字は後日、画像にする予定
//        countDownkButton.setTitle("カウントダウン", for: .normal)
//        countDownkButton.backgroundColor = .brown
//        countDownkButton.addTarget(self, action: #selector(countDownButtonFire), for: .touchUpInside)
//        self.view.addSubview(countDownkButton)
//
//
//        //フリーモードのボタンを実装
//        freeModeButton.frame = CGRect(x: 0, y: self.view.frame.size.height/3*2, width: self.view.frame.size.width, height: self.view.frame.size.height/3)
//        //文字は後日、画像にする予定
//        freeModeButton.setTitle("フリーモード", for: .normal)
//        freeModeButton.backgroundColor = .cyan
//        freeModeButton.addTarget(self, action: #selector(freeModeButtonFire), for: .touchUpInside)
//        self.view.addSubview(freeModeButton)
//        // Do any additional setup after loading the view.
//    }
//
//
//
//
//
//    @objc func timeAttackButtonFire(_ sender:UIButton){
//        //ここでUserDefaultにキーを入れてモードの分岐を行う
//        UserDefaults.standard.set("timeAttack", forKey: "gameMode")
//        print("timeAttackが押されました。")
//
//        performSegue(withIdentifier: "goToGameMode", sender: nil)
//    }
//
//    @objc func countDownButtonFire(_ sender:UIButton){
//        //ここでUserDefaultにキーを入れてモードの分岐を行う
//        UserDefaults.standard.set("countDown", forKey: "gameMode")
//        print("countDownが押されました。")
//    }
//
//    @objc func freeModeButtonFire(_ sender:UIButton){
//        //ここでUserDefaultにキーを入れてモードの分岐を行う
//        UserDefaults.standard.set("freeMode", forKey: "gameMode")
//        print("freeModeが押されました。")
//    }
//
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */

}

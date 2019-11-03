//
//  GameCourceViewController.swift
//  Trump364
//
//  Created by 宏輝 on 01/07/2019.
//  Copyright © 2019 Hiroki Kondo. All rights reserved.
//

import UIKit

class GameCourseViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
//ここはゲーム選択肢のコードを書く場所です。ここから下をコピーペーストすることでゲームの拡張性を持たせています。
    
    
    @IBOutlet weak var gameCourseTableView: UITableView!
    
    //ここは後日ClassにString情報を格納して拡張性を出す
    //後日、モード選択の画面はUIImageに変更する
    var gameCourseArray = ["トランプ","ひらがな","ひらがなリバース","カタカナ","カタカナりば〜す"]

    override func viewDidLoad() {
        super.viewDidLoad()

        //tableViewのデリゲードをgameCourceTableViewへ適用
        gameCourseTableView.delegate = self
        gameCourseTableView.dataSource = self
        
        gameCourseTableView.frame = self.view.frame
        
        // Do any additional setup after loading the view.
    }
    
    //セクションは１で固定
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameCourseArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //cellはストーリボードを使った再利用を採用
        let cell = gameCourseTableView.dequeueReusableCell(withIdentifier: "gameCourse", for: indexPath)

        //後日、UIImageに変更する
        cell.textLabel?.text = gameCourseArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        print(gameModeArray[indexPath.row])
    
        //選択されたセルをUserDefaultsへ入れる。この選択が元でゲーム内容を分岐させる。分岐させるクラスは、後日して作成予定
    UserDefaults.standard.set(gameCourseArray[indexPath.row], forKey: "gameCourse")
        print(UserDefaults.standard.object(forKey: "gameCourse") as! String )
        
        //goToGameDegreeへ画面遷移、ゲームの選択肢が増えたら、ここはメンテが必要
        performSegue(withIdentifier: "goToGameDegree", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        //選択肢の多さは5つが最も見やすそうなので5で固定
        //後日変更するかも
        return self.view.frame.size.height / 5
    }

}

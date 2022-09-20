//
//  GrowViewController.swift
//  calender
//
//  Created by 藤井玖光 on 2022/09/20.
//

import UIKit

class GrowViewController: UIViewController {
    
    @IBOutlet var CharacterImageVIew: UIImageView!
    @IBOutlet var levelLavel: UILabel!

    //レベル数字の箱
    var levelnumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //アイテムを渡すアクション
    @IBAction func Giveaction() {
        
        //アイテムを渡すとレベルアップする
        levelnumber = levelnumber + 1
        
        //上がったレベルをラベルに反映する
        levelLavel.text = String(levelnumber)
        
        //アラートを出す
        let alert: UIAlertController = UIAlertController(title: "アイテムを渡した", message: "レベルが○上がった！", preferredStyle: .alert)
        
        //アラートのボタンを作る
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: .default,
                handler: { action in
                    self.navigationController?.popViewController(animated: true)
                }
            )
        )
        present(alert, animated: true, completion: nil)
        
        
    }

}

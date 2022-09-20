//
//  AddViewController.swift
//  calender
//
//  Created by 藤井玖光 on 2022/09/19.
//

import UIKit
import RealmSwift

class AddViewController: UIViewController, UITextFieldDelegate {
    
    let realm = try! Realm()
    
    @IBOutlet var todayLabel: UILabel!
    @IBOutlet var ContentTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ContentTextField.delegate = self
        
        //現在の日付を取得
        let date:Date = Date()
        
        //日付のフォーマットを指定する。
        let format = DateFormatter()
        format.dateFormat = "yyyy/MM/dd"
        
        //日付をStringに変換する
        let sDate = format.string(from: date)
        
        print(sDate)
        todayLabel.text = String(sDate)
    }
    
    func read() -> Memo? {
        return realm.objects(Memo.self).first
    }
    
    @IBAction func saveBotton(){
        let title: String = ContentTextField.text!
        
        
        let newMemo = Memo()
        newMemo.Content = title
        //newMemo.content = content
        //newMemo.date = date
        
        try! realm.write{
            realm.add(newMemo)
            
            
            //アラートを出す
            let alert: UIAlertController = UIAlertController(title: "保存", message: "メモの保存が完了しました", preferredStyle: .alert)
            
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
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
            
        }
    }
    
}

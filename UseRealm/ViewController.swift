//
//  ViewController.swift
//  UseRealm
//
//  Created by kashitaka on 2015/12/25.
//  Copyright © 2015年 kashitaka. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    @IBOutlet weak var IdTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func InsertButtonTapped(sender: AnyObject) {
        guard let id = IdTextField.text , name = nameTextField.text else {
            return
        }
        
        // userインスタンス
        let user = User()
        user.id = id
        user.name = name
        user.createdAt = NSDate().timeIntervalSince1970
        
        // realmの初期化
        let realm = try! Realm()
        //書き込み
        try! realm.write {
            realm.add(user)
            IdTextField.text = ""
            nameTextField.text = ""
            textView.text = "\(id),\(name)のユーザーを保存したよ"
        }
    }
    
    @IBAction func fetchAllButtonTapped(sender: AnyObject) {
        
        var resultString: String = ""

        // realmの初期化
        let realm = try! Realm()
        // Userオブジェクト全部取得
        let users = realm.objects(User)
        for user in users {
            if let id: String = user["id"]! as! String,
            name: String = user["name"]! as! String,
            createdAt: Double = user["createdAt"]! as! Double
            {
                resultString.appendContentsOf("ID:\(id)/name:\(name)/createdAt:\(createdAt)\n")
            }
        }
        textView.text = resultString
    }
}


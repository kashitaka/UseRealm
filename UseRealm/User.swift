//
//  User.swift
//  UseRealm
//
//  Created by kashitaka on 2015/12/25.
//  Copyright © 2015年 kashitaka. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object{
    
    // 属性
    var id = ""
    var name = ""
    var createdAt: Double = 0
    
    // プライマリーキーの指定
    override class func primaryKey() -> String {
        return "id"
    }
}
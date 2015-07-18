//
//  Info.swift
//  ITBLOG
//
//  Created by Apple tom on 15/6/1.
//  Copyright (c) 2015年 Apple tom. All rights reserved.
//

import Foundation

public class Info
{
    let ID:Int
    let sex:Int
    let birthday:String
    let QQ:String
    let email:String
    let introduce:String
    
    init(ID:Int,sex:Int,birthday:String,QQ:String,email:String,introduce:String){
        self.ID = ID
        self.sex = sex
        self.birthday = birthday
        self.QQ = QQ
        self.email = email
        self.introduce = introduce
    }
    
    init(){
        self.ID = 0
        self.sex = 0
        self.birthday = ""
        self.QQ = ""
        self.email = ""
        self.introduce = ""
    }
}
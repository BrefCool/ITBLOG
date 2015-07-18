//
//  UserBasic.swift
//  ITBLOG
//
//  Created by Apple tom on 15/6/5.
//  Copyright (c) 2015年 Apple tom. All rights reserved.
//

import Foundation

public class UserBasic
{
    var userID:Int
    var username:String
    
    init(userID:Int,username:String){
        self.userID = userID
        self.username = username
    }
    
    init(){
        self.userID = 0
        self.username = ""
    }
}
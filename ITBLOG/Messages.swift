//
//  Messages.swift
//  ITBLOG
//
//  Created by Apple tom on 15/6/1.
//  Copyright (c) 2015年 Apple tom. All rights reserved.
//

import Foundation

public class Messages
{
    public let ID:Int
    public let senderID:Int
    public let receiverID:Int
    public let sendtime:String
    public let content:String
    
    init(ID:Int,senderID:Int,receiverID:Int,sendtime:String,content:String){
        self.ID = ID
        self.senderID = senderID
        self.receiverID = receiverID
        self.sendtime = sendtime
        self.content = content
    }
    
    init(){
        self.ID = 0
        self.senderID = 0
        self.receiverID = 0
        self.sendtime = ""
        self.content = ""
    }
}
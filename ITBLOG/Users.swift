//
//  Users.swift
//  ITBLOG
//
//  Created by Apple tom on 15/6/1.
//  Copyright (c) 2015年 Apple tom. All rights reserved.
//

import Foundation

public class Users
{
    public let userID:Int
    public let username:String
    public let userpwd:String
    public let infoID:Int
    public let headImgID:Int
    public let blogHot:Int
    public let rgtime:NSDate
    
    init(userID:Int,username:String,userpwd:String,infoID:Int,headImgID:Int,blogHot:Int,rgtime:NSDate){
        self.userID = userID
        self.username = username
        self.userpwd = userpwd
        self.infoID = infoID
        self.headImgID = headImgID
        self.blogHot = blogHot
        self.rgtime = rgtime
    }
}
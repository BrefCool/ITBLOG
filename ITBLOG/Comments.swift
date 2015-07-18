//
//  Comments.swift
//  ITBLOG
//
//  Created by Apple tom on 15/6/1.
//  Copyright (c) 2015年 Apple tom. All rights reserved.
//

import Foundation

public class Comments
{
    public let ID:Int
    public let commenterID:Int
    public let articleID:Int
    public let content:String
    public let publishtime:String
    
    init(ID:Int,commenterID:Int,articleID:Int,content:String,publishtime:String){
        self.ID = ID
        self.commenterID = commenterID
        self.articleID = articleID
        self.content = content
        self.publishtime = publishtime
    }
    
    init(){
        self.ID = 0
        self.commenterID = 0
        self.articleID = 0
        self.content = ""
        self.publishtime = ""
    }
}
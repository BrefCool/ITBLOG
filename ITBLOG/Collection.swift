//
//  Collection.swift
//  ITBLOG
//
//  Created by Apple tom on 15/6/1.
//  Copyright (c) 2015年 Apple tom. All rights reserved.
//

import Foundation

public class Collection
{
    public let ID:Int
    public let hostID:Int
    public let articleID:Int
    public let webpath:String
    public let title:String
    public let description:String
    
    init(ID:Int,hostID:Int,articleID:Int,webpath:String,title:String,description:String){
        self.ID = ID
        self.hostID = hostID
        self.articleID = articleID
        self.webpath = webpath
        self.title = title
        self.description = description
    }
    
    init(){
        self.ID = 0
        self.hostID = 0
        self.articleID = 0
        self.webpath = ""
        self.title = ""
        self.description = ""
    }
}
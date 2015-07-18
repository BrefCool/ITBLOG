//
//  Articles.swift
//  ITBLOG
//
//  Created by Apple tom on 15/6/1.
//  Copyright (c) 2015年 Apple tom. All rights reserved.
//

import Foundation

public class Articles
{
    public let ID:Int
    public let writerID:Int
    public let title:String
    public let description:String
    public let readtimes:Int
    public let publishtime:String
    
    init(ID:Int,writerID:Int,title:String,description:String,readtimes:Int,publishtime:String){
        self.ID = ID
        self.writerID = writerID
        self.title = title
        self.description = description
        self.readtimes = readtimes
        self.publishtime = publishtime
    }
    
    init(){
        self.ID = 0
        self.writerID = 0
        self.title = ""
        self.description = ""
        self.readtimes = 0
        self.publishtime = ""
    }
}
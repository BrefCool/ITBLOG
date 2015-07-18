//
//  HeadImg.swift
//  ITBLOG
//
//  Created by Apple tom on 15/6/1.
//  Copyright (c) 2015年 Apple tom. All rights reserved.
//

import Foundation

public class HeadImg
{
    public let ID:Int
    public let imgPath:String
    
    init(ID:Int,imgPath:String){
        self.ID = ID
        self.imgPath = imgPath
    }
    
    init(){
        self.ID = 0
        self.imgPath = ""
    }
}
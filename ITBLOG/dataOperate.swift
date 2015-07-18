//
//  dataOperate.swift
//  ITBLOG
//
//  Created by Apple tom on 15/6/1.
//  Copyright (c) 2015年 Apple tom. All rights reserved.
//

import Foundation

public class dataOperate
{
    let connectURL = "http://221.239.196.140:2222"
    
    public func getAllArticlesByRequest(requestID:Int,request:String) -> [Articles]{
        //根据request进行判断
        var articles = [Articles](count: 0, repeatedValue: Articles())
        var requestUrlString = connectURL
        if(request == "category")
        {
            requestUrlString += "/GetAllArticlesByCategory/" + "\(requestID)"
        }
        else if(request == "writer")
        {
            requestUrlString += "/GetAllArticlesByWriter/" + "\(requestID)"
        }
        var url = NSURL(string:requestUrlString)
        let request = NSURLRequest(URL:url!)
        
        let data:NSData? = NSURLConnection.sendSynchronousRequest(request,returningResponse:nil,error:nil)
        var json:AnyObject = NSJSONSerialization.JSONObjectWithData(data!,options:NSJSONReadingOptions.AllowFragments,error:nil)!
        var i:Int = 0
        
        if let articlesArray = json as? NSArray{
            while i < articlesArray.count{
                if let article = articlesArray[i] as? NSDictionary{
                    var dateFormatter = NSDateFormatter()
                    var newarticle = Articles(ID: article["ID"] as! Int, writerID: article["writerID"] as! Int , title: article["title"] as! String, description: article["description"] as! String, readtimes: article["readtimes"] as! Int, publishtime:article["publishtime"] as! String)
                        articles.append(newarticle)
                }
                i++
            }
        }
        return articles
    }
    
    
    public func loadArticleByArticleID(article:Int) -> Articles{
        var requestUrlString = connectURL + "/getArticlleByArticleID/" + "\(article)"
        var url = NSURL(string:requestUrlString)
        let request = NSURLRequest(URL:url!)
        var newarticle = Articles()
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler:{
            (response, data, error) -> Void in
            if (error != nil) {
                //Handle Error here
            }else{
                //Handle data in NSData type
                var json:AnyObject = NSJSONSerialization.JSONObjectWithData(data,options:NSJSONReadingOptions.AllowFragments,error:nil)!
                
                if let articleArray = json as? NSArray{
                    if let article = articleArray[0] as? NSDictionary{
                        newarticle = Articles(ID: article["ID"] as! Int, writerID: article["writerID"] as! Int, title: article["title"] as! String, description: article["description"] as! String, readtimes: article["readtimes"] as! Int,publishtime:article["publishtime"] as! String)
                    }
                }
            }
        })
        return newarticle
    }
    
    public func deleteArticle(articleID:Int) -> Bool{
        var url = NSURL(string:"这里填写api url")
        let request = NSURLRequest(URL:url!)
        var flag:Bool = false
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler:{
            (response, data, error) -> Void in
            if (error != nil) {
                //Handle Error here
            }else{
                //Handle data in NSData type
                var json:AnyObject = NSJSONSerialization.JSONObjectWithData(data,options:NSJSONReadingOptions.AllowFragments,error:nil)!
                
                var result = json.objectForKey("bool") as! Bool
                flag = result
            }
        })
        if flag == true{
            return true
        }
        else{
            return false
        }
    }
    
    public func getAllCommentsByArticleID(articleID:Int) -> [Comments]{
        var requestUrlString = connectURL + "/GetAllCommentsByArticleID/" + "\(articleID)"
        var url = NSURL(string:requestUrlString)
        let request = NSURLRequest(URL:url!)
        var comments = [Comments](count:0, repeatedValue: Comments())
        var i:Int = 0
        
        let data:NSData? = NSURLConnection.sendSynchronousRequest(request,returningResponse:nil,error:nil)
        var json:AnyObject = NSJSONSerialization.JSONObjectWithData(data!,options:NSJSONReadingOptions.AllowFragments,error:nil)!
        
        if let commentsArray = json as? NSArray{
            while i < commentsArray.count {
                if let comment = commentsArray[i] as? NSDictionary{
                    var newcomment = Comments(ID: comment["ID"] as! Int, commenterID: comment["commenterID"] as! Int, articleID: comment["articleID"] as! Int, content: comment["content"] as! String, publishtime: comment["commentTime"] as! String)
                            
                        comments.append(newcomment)
                }
                i++
            }
        }
        return comments
    }
    
    public func getAllCollectionsByHostID(hostID:Int) -> [Collection]{
        var requestUrlString = connectURL + "/GetAllCollectionsByHostID/" + "\(hostID)"
        var url = NSURL(string:requestUrlString)
        let request = NSURLRequest(URL:url!)
        var collections = [Collection](count:0, repeatedValue: Collection())
        var i:Int = 0
        
        let data:NSData? = NSURLConnection.sendSynchronousRequest(request,returningResponse:nil,error:nil)
        var json:AnyObject = NSJSONSerialization.JSONObjectWithData(data!,options:NSJSONReadingOptions.AllowFragments,error:nil)!
                
        if let collectionsArray = json as? NSArray{
            while i < collectionsArray.count {
                if let collection = collectionsArray[i] as? NSDictionary{
                    var newcollection = Collection(ID: collection["ID"] as! Int, hostID: collection["hostID"] as! Int, articleID: collection["articleID"] as! Int, webpath: collection["webpath"] as! String, title: collection["title"] as! String, description: collection["description"] as! String)
                    
                    collections.append(newcollection)
                }
                i++
            }
        }
        return collections
    }
    
    public func getAllMessagesByUser(userID:Int) -> [Messages]{
        var requestUrlString = connectURL + "/GetAllMessagesByUser/" + "\(userID)"
        var url = NSURL(string:requestUrlString)
        let request = NSURLRequest(URL:url!)
        var messages = [Messages](count:0, repeatedValue: Messages())
        var i:Int = 0
        
        let data:NSData? = NSURLConnection.sendSynchronousRequest(request,returningResponse:nil,error:nil)
        var json:AnyObject = NSJSONSerialization.JSONObjectWithData(data!,options:NSJSONReadingOptions.AllowFragments,error:nil)!
        
        if let messagesArray = json as? NSArray{
            while i < messagesArray.count {
                if let message = messagesArray[i] as? NSDictionary{
                    var newmessage = Messages(ID: message["ID"] as! Int, senderID: message["senderID"] as! Int, receiverID: message["receiverID"] as! Int, sendtime: message["sendtime"] as! String, content: message["content"] as! String)
                    println(newmessage.ID)
                    messages.append(newmessage)
                }
                i++
            }
        }
        return messages
    }
    
    public func loadUserInfoByUser(userID:Int) -> Info{
        var requestUrlString = connectURL + "/GetUserInfoByUser/" + "\(userID)"
        var url = NSURL(string: requestUrlString)
        let request = NSURLRequest(URL: url!)
        var newInfo = Info()
        
        let data:NSData? = NSURLConnection.sendSynchronousRequest(request,returningResponse:nil,error:nil)
        var json:AnyObject = NSJSONSerialization.JSONObjectWithData(data!,options:NSJSONReadingOptions.AllowFragments,error:nil)!
        
        if let info = json as? NSDictionary{
                newInfo = Info(ID: info["ID"] as! Int, sex: info["sex"] as! Int, birthday: info["birthday"] as! String, QQ: info["QQ"] as! String, email: info["email"] as! String, introduce: info["introduce"] as! String)
                println(newInfo.ID)
        }
        return newInfo
    }
    
    public func loadHeadImgByUser(userID:Int) -> HeadImg{
        var requestUrlString = connectURL + "/GetHeadImgByUser/" + "\(userID)"
        var url = NSURL(string:requestUrlString)
        let request = NSURLRequest(URL: url!)
        var newHeadImg = HeadImg()
        
        let data:NSData? = NSURLConnection.sendSynchronousRequest(request,returningResponse:nil,error:nil)
        var json:AnyObject = NSJSONSerialization.JSONObjectWithData(data!,options:NSJSONReadingOptions.AllowFragments,error:nil)!
        
        if let headimg = json as? NSDictionary{
                var tempimgPath:String =  headimg["imgpath"] as! String
                newHeadImg = HeadImg(ID: headimg["ID"] as! Int, imgPath: connectURL + "/" + tempimgPath)
        }
        return newHeadImg
    }
    
    public func tryLogIn(username:String,userpwd:String) -> UserBasic{
        var requestUrlString = connectURL + "/GettryLogIn/" + username + "/" + userpwd
        var url = NSURL(string:requestUrlString)
        let request = NSURLRequest(URL:url!)
        var userbasic = UserBasic()
        
        let data:NSData? = NSURLConnection.sendSynchronousRequest(request,returningResponse:nil,error:nil)
        var json:AnyObject = NSJSONSerialization.JSONObjectWithData(data!,options:NSJSONReadingOptions.AllowFragments,error:nil)!
        
        if let userbasics = json as? NSDictionary{
            userbasic = UserBasic(userID: userbasics["userID"] as! Int, username: userbasics["username"] as! String)
        }
        return userbasic
    }
    
    public func getSenderName(senderID:Int) -> String{
        var requestUrlString = connectURL + "/GetSenderName/" + "\(senderID)"
        var url = NSURL(string:requestUrlString)
        let request = NSURLRequest(URL: url!)
        
        
        let data:NSData? = NSURLConnection.sendSynchronousRequest(request,returningResponse:nil,error:nil)
        var json:AnyObject = NSJSONSerialization.JSONObjectWithData(data!,options:NSJSONReadingOptions.AllowFragments,error:nil)!
        
        if let sendername = json as? String{
            return sendername
        }
        else
        {
            return ""
        }
    }
}
//
//  ArticleViewController.swift
//  ITBLOG
//
//  Created by Apple tom on 15/6/6.
//  Copyright (c) 2015年 Apple tom. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController {
    var articleID:Int = 0
    var Operate = dataOperate()

    override func viewDidLoad() {
        super.viewDidLoad()
        var url:String = Operate.connectURL + "/articleDetails.aspx?articleID=" + "\(articleID)"
        articleWebView.loadRequest(NSURLRequest(URL:NSURL(string:url)!))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var articleWebView: UIWebView!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destination = segue.destinationViewController as? UIViewController
        if let navCon = destination as? UINavigationController {
            destination = navCon.visibleViewController
        }
        if let VCTableView = destination as? viewCommentsTableViewController {
            if let identifier = segue.identifier{
                switch identifier{
                case "toComments":VCTableView.articleID = self.articleID
                default:break
                }
            }
        }

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

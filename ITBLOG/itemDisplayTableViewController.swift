//
//  itemDisplayTableViewController.swift
//  ITBLOG
//
//  Created by Apple tom on 15/6/1.
//  Copyright (c) 2015年 Apple tom. All rights reserved.
//

import UIKit

class itemDisplayTableViewController: UITableViewController {
    
    var menuItems = ["全部分类","移动开发","编程语言","web开发","系统运维","博客频道"]
    var articles = [Articles](count: 0, repeatedValue: Articles())
    let Operate = dataOperate()
    
    var requestID:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        if requestID < 5{
            articles = Operate.getAllArticlesByRequest(requestID, request: "category")
        }
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        title = menuItems[requestID]
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return articles.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if requestID < 5{
            let cell = tableView.dequeueReusableCellWithIdentifier("toarticle", forIndexPath: indexPath) as! UITableViewCell
            
            var TitleLabel = cell.viewWithTag(103) as! UILabel
            TitleLabel.text = articles[indexPath.row].title
            var dateFormatter = NSDateFormatter()
            var DateLabel = cell.viewWithTag(104) as! UILabel
            DateLabel.text = articles[indexPath.row].publishtime
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCellWithIdentifier("tosbBlog", forIndexPath: indexPath) as! UITableViewCell
            return cell
        }
        

        // Configure the cell...

        }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destination = segue.destinationViewController as? UIViewController
        if let navCon = destination as? UINavigationController {
             destination = navCon.visibleViewController
        }
        if let ArticleView = destination as? ArticleViewController{
            if let identifier = segue.identifier{
                switch identifier{
                case "viewArticle":
                    if let row = tableView.indexPathForSelectedRow()?.row{
                        ArticleView.articleID = articles[row].ID
                    }
                default:break
                }
            }
        }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}

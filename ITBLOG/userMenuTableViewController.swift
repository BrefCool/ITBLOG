//
//  userMenuTableViewController.swift
//  ITBLOG
//
//  Created by Apple tom on 15/6/1.
//  Copyright (c) 2015年 Apple tom. All rights reserved.
//

import UIKit

class userMenuTableViewController: UITableViewController,UITableViewDataSource {
    var menuItems = [String](count: 0, repeatedValue: "")
    var appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    var userbasic = UserBasic()
    var headimg = HeadImg()
    var userinfo = Info()
    let Operate = dataOperate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuItems = ["全部分类","移动开发","编程语言","web开发","系统运维"]
        self.userbasic = appDelegate.userbasic
        headimg = Operate.loadHeadImgByUser(self.userbasic.userID)
        userinfo = Operate.loadUserInfoByUser(self.userbasic.userID)
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
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
        return menuItems.count + 1
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if(indexPath.row > 0)
        {
            let cell = tableView.dequeueReusableCellWithIdentifier("toblog", forIndexPath: indexPath) as! UITableViewCell

            var label = cell.viewWithTag(104) as! UILabel
            label.text = menuItems[indexPath.row - 1]
            
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCellWithIdentifier("touser", forIndexPath: indexPath) as! UITableViewCell
            
            var nameLabel = cell.viewWithTag(102) as! UILabel
            var imageview = cell.viewWithTag(101) as! UIImageView
            var introduceLabel = cell.viewWithTag(103) as! UILabel
            let url = NSURL(string:headimg.imgPath)
            var data = NSData(contentsOfURL: url!)
            let Image = UIImage(data:data!)
            nameLabel.text = userbasic.username
            introduceLabel.text = userinfo.introduce
            imageview.image = Image
            return cell
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destination = segue.destinationViewController as? UIViewController
        if let navCon = destination as? UINavigationController {
            destination = navCon.visibleViewController
            if let ID = tableView.indexPathForSelectedRow()?.row{
            }
        }
        if let iDTableView = destination as? itemDisplayTableViewController {
            if let identifier = segue.identifier{
                switch identifier{
                case "userBlog": if let ID = tableView.indexPathForSelectedRow()?.row{
                                        iDTableView.requestID = ID - 1
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

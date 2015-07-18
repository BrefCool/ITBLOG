//
//  userInfoTableViewController.swift
//  ITBLOG
//
//  Created by Apple tom on 15/6/5.
//  Copyright (c) 2015年 Apple tom. All rights reserved.
//

import UIKit

class userInfoTableViewController: UITableViewController {
    var Operate = dataOperate()
    var userinfo = Info()
    var headimg = HeadImg()
    var appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    var userbasic = UserBasic()
    var item = ["性别:","出生年月:","个人简介:","E-mail:","QQ"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userbasic = appDelegate.userbasic
        userinfo = Operate.loadUserInfoByUser(self.userbasic.userID)
        headimg = Operate.loadHeadImgByUser(self.userbasic.userID)
        tableView.estimatedRowHeight = tableView.rowHeight
        //tableView.rowHeight = UITableViewAutomaticDimension
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
        return 6
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if (indexPath.row > 0)
        {
            let cell = tableView.dequeueReusableCellWithIdentifier("Details", forIndexPath: indexPath) as! UITableViewCell
            
            var itemLabel = cell.viewWithTag(110) as! UILabel
            var detailsLabel = cell.viewWithTag(111) as! UILabel
            itemLabel.text = item[indexPath.row - 1]
            switch (indexPath.row){
            case 1:
                if userinfo.sex != 0{
                    detailsLabel.text = "男"
                }
                else{
                    detailsLabel.text = "女"
                }
            case 2:detailsLabel.text = userinfo.birthday
            case 3:detailsLabel.text = userinfo.introduce
            case 4:detailsLabel.text = userinfo.email
            case 5:detailsLabel.text = userinfo.QQ
            default:break
            }
            
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCellWithIdentifier("Header", forIndexPath: indexPath) as! UITableViewCell
            var imageview = cell.viewWithTag(108) as! UIImageView
            var nameLabel = cell.viewWithTag(109) as! UILabel
            let url = NSURL(string:headimg.imgPath)
            var data = NSData(contentsOfURL:url!)
            let Image = UIImage(data:data!)
            nameLabel.text = self.userbasic.username
            imageview.image = Image
            return cell
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

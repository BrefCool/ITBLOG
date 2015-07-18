//
//  viewCommentsTableViewController.swift
//  ITBLOG
//
//  Created by Apple tom on 15/6/7.
//  Copyright (c) 2015年 Apple tom. All rights reserved.
//

import UIKit

class viewCommentsTableViewController: UITableViewController {
    var articleID:Int = 0
    var Operate = dataOperate()
    var comments = [Comments](count: 0, repeatedValue: Comments())

    override func viewDidLoad() {
        super.viewDidLoad()
        comments = Operate.getAllCommentsByArticleID(articleID)
        
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
        return comments.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("comments", forIndexPath: indexPath) as! UITableViewCell
        var commenterimage = cell.viewWithTag(101)as! UIImageView
        var commenterName = cell.viewWithTag(102) as! UILabel
        var content = cell.viewWithTag(103) as! UILabel
        var headimg = HeadImg()
        
        headimg = Operate.loadHeadImgByUser(comments[indexPath.row].commenterID)
        let url = NSURL(string:headimg.imgPath)
        var data = NSData(contentsOfURL:url!)
        let Image = UIImage(data:data!)
        commenterimage.image = Image
        
        commenterName.text = Operate.getSenderName(comments[indexPath.row].commenterID)
        content.text = comments[indexPath.row].content
        // Configure the cell...

        return cell
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

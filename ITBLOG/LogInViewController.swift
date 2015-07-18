//
//  LogInViewController.swift
//  ITBLOG
//
//  Created by Apple tom on 15/6/4.
//  Copyright (c) 2015年 Apple tom. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    let Operate = dataOperate()
    var userbasic = UserBasic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameField.attributedText = NSAttributedString(string:"请输入用户名")
        userpwdField.attributedText = NSAttributedString(string:"请输入密码")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var lodEditingView: UIView!

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var userpwdField: UITextField!
    
    @IBAction func usernameFieldGotTouched(sender: UITextField) {
        var frame:CGRect = lodEditingView.frame
        var offset = frame.origin.y - 200 //- (self.view.frame.size.height - 216.0)
        println(offset)
        if(offset > 0){
            self.view.frame = CGRectMake(0.0,-offset,self.view.frame.size.width,self.view.frame.size.height)
        }
    }
    
    @IBAction func userpwdGotTouched(sender: AnyObject) {
        userpwdField.secureTextEntry = true
        var frame:CGRect = lodEditingView.frame
        var offset = frame.origin.y - 200 //- (self.view.frame.size.height - 216.0)
        println(offset)
        if(offset > 0){
            self.view.frame = CGRectMake(0.0,-offset,self.view.frame.size.width,self.view.frame.size.height)
        }

    }
    
    @IBAction func loginBtn_Click(sender: UIButton) {
        let username = usernameField.text
        let userpwd = userpwdField.text
        if(username != "" && userpwd != ""){
            self.userbasic = Operate.tryLogIn(username, userpwd: userpwd )
            var appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            appDelegate.userbasic = self.userbasic
            if userbasic.userID > 0{
                self.performSegueWithIdentifier("login", sender: self)
            }
            else
            {
                var alert = UIAlertView()
                alert.title = "alert!"
                alert.delegate = self
                alert.addButtonWithTitle("确定")
                alert.message = "登录失败!\n用户名或密码不正确"
                alert.show()
            }
        }
        else{
            var alert = UIAlertView()
            alert.title = "alert!"
            alert.delegate = self
            alert.addButtonWithTitle("确定")
            alert.message = "用户名和密码不能为空"
            alert.show()
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

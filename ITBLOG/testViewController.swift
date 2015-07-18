//
//  testViewController.swift
//  ITBLOG
//
//  Created by Apple tom on 15/6/3.
//  Copyright (c) 2015年 Apple tom. All rights reserved.
//

import UIKit

class testViewController: UIViewController {

    var articles = [Articles](count:0, repeatedValue: Articles())
    var Operate = dataOperate()
    
    @IBOutlet weak var testLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        println("haha!")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func getAllArticles(sender: UIButton) {
        var temparticles:Optional = articles
        testLabel.text = "\(temparticles?.count)"
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

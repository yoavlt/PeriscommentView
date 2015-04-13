//
//  ViewController.swift
//  PeriscommentViewDemo
//
//  Created by Takuma Yoshida on 2015/04/13.
//  Copyright (c) 2015年 Takuma Yoshida. All rights reserved.
//

import UIKit
import PeriscommentView

class ViewController: UIViewController {
    
    @IBOutlet weak var periscommentView: PeriscommentView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addCells()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addCells() {
        let profileImage = UIImage(named: "twitterProfile")!
        let name = "@yoavlt"
        dispatchOnMainThread(delay: 1) {
            let comment = "Awesome!"
            self.periscommentView.addCell(profileImage, name: name, comment: comment)
        }
        
        dispatchOnMainThread(delay: 5) { () -> () in
            let comment = "Hooooo!"
            self.periscommentView.addCell(profileImage, name: name, comment: comment)
        }
        
        dispatchOnMainThread(delay: 7) { () -> () in
            let comment = "Supported looooooong line comments."
            self.periscommentView.addCell(profileImage, name: name, comment: comment)
        }
    }
    
    func dispatchOnMainThread(delay: Double = 0, block: () -> ()) {
        if delay == 0 {
            dispatch_async(dispatch_get_main_queue()) {
                block()
            }
            return
        }
        
        let d = dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC)))
        dispatch_after(d, dispatch_get_main_queue()) {
            block()
        }
    }
}


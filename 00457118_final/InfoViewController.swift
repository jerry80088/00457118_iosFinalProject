
//
//  InfoViewController.swift
//  00357125_final
//
//  Created by user_03 on 2018/1/11.
//  Copyright © 2018年 test. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController{
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var weight: UILabel!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var attackHeight: UILabel!
    @IBOutlet weak var blockHeight: UILabel!
    
    @IBOutlet weak var S: UIImageView!
    @IBOutlet weak var OS: UIImageView!
    @IBOutlet weak var O: UIImageView!
    @IBOutlet weak var MB: UIImageView!
    @IBOutlet weak var L: UIImageView!
    var user: Info!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.text = user.Name
        height.text = user.Height
        weight.text = user.Weight
        attackHeight.text = user.AttackHeight
        blockHeight.text = user.BlockHeight
        
        if(user.BlockHeight>="320"){
            MB.isHidden = false
        }
        else if(user.BlockHeight>="310" && user.BlockHeight<"320"){
            O.isHidden = false
        }
        else if(user.BlockHeight>="300" && user.BlockHeight<"310"){
            OS.isHidden = false
        }
        else if(user.BlockHeight>="290" && user.BlockHeight<"300"){
            S.isHidden = false
        }
        else{
            L.isHidden = false
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  FoodViewController.swift
//  00357125_final
//
//  Created by user_03 on 2018/1/12.
//  Copyright © 2018年 test. All rights reserved.
//

import UIKit

class FoodViewController: UIViewController {
    

    @IBOutlet weak var Date: UILabel!
    @IBOutlet weak var Weather: UILabel!
    @IBOutlet weak var Description: UITextView!
    
    var user: Food!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        Date.text = user.Date
        Weather.text = user.Weather
        Description.text = user.Description
                // Do any additional setup after loading the view.
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

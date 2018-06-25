//
//  AddLoverTableViewController.swift
//  AddData
//
//  Created by SHIH-YING PAN on 22/12/2017.
//  Copyright © 2017 SHIH-YING PAN. All rights reserved.
//

import UIKit

class AddWeightTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
     var isChangeImage = false
    @IBOutlet weak var heightText: UITextField!
    @IBOutlet weak var image: UIButton!
    @IBOutlet weak var weightText: UITextField!
    @IBOutlet weak var blockHeightText: UITextField!
    @IBOutlet weak var attackHeightText: UITextField!
    @IBOutlet weak var nameText: UITextField!
    
    var info: Info!
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        image.setBackgroundImage(info[UIImagePickerControllerOriginalImage] as? UIImage, for: .normal)
        
        isChangeImage = true
        dismiss(animated: true, completion: nil)
        
    }
    @IBAction func changePhoto(_ sender: Any) {
        let controller = UIImagePickerController()
        controller.delegate = self
        controller.sourceType = .photoLibrary
        present(controller, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
  
    
    
    
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.view.endEditing(true)
        return true
        
    }
    // MARK: - Table view data source
    
    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    func showAlert(message: String) {
        let controller = UIAlertController(title: "錯誤", message: message, preferredStyle: UIAlertControllerStyle.alert)
        let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        controller.addAction(action)
        present(controller, animated: true, completion: nil)
        
    }
    
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        guard let height = heightText.text, height.count > 0 else {
            
            showAlert(message: "請輸入身高")
            return false
        }
        
        guard let weight = weightText.text, weight.count > 0 else {
            
            showAlert(message: "請輸入體重")
            
            return false
        }
        guard let name = nameText.text, name.count > 0 else {
            
            showAlert(message: "請輸入姓名")
            return false
        }
        guard let attackHeight = attackHeightText.text, attackHeight.count > 0 else {
            
            showAlert(message: "請輸入打點高度")
            return false
        }
        guard let blockHeight = blockHeightText.text, blockHeight.count > 0 else {
            
            showAlert(message: "請輸入攔網高度")
            return false
        }
        
       
        var imageName: String?
        if isChangeImage {
            imageName = "\(Date().timeIntervalSinceReferenceDate)"
            let url = Info.documentsDirectory.appendingPathComponent(imageName!)
            let data = UIImageJPEGRepresentation(image.backgroundImage(for: .normal)!, 0.9)
            
            try? data?.write(to: url)
        }

        
        info = Info(Height: height + "cm", Weight: weight + "kg", Name: name,AttackHeight: attackHeight + "cm",BlockHeight:blockHeight + "cm",imageName: imageName)
        
        
        return true
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
    }
    
    
}


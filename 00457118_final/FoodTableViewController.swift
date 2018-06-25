//
//  FoodTableViewController.swift
//  00357125_final
//
//  Created by user_03 on 2018/1/12.
//  Copyright © 2018年 test. All rights reserved.
//

import UIKit

class FoodTableViewController: UITableViewController {

    var Infos = [Food]()
    var date = String()
    var weather = String()
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        Infos.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        Food.saveToFile(infos: Infos)
        tableView.reloadData()
        
    }
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: UIButton) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     
     let controller = segue.destination as?  InfoViewController
     if let row = tableView.indexPathForSelectedRow?.row {
     let lover = lovers[row]
     controller?.lover = lover
     
     }
     }*/
    
    
    @IBAction func goBackToInfosTableViewController(segue: UIStoryboardSegue) {
        if let controller = segue.source as? AddFoodTableViewController {
            Infos.append(controller.info)
            Food.saveToFile(infos: Infos)
            tableView.reloadData()
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        if let Infos = Food.readInfosFromFile() {
            self.Infos = Infos
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Infos.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath) as? FoodTableViewCell else  {
            assert(false)
        }
        
        // Configure the cell...
        let info = Infos[indexPath.row]
        cell.date.text = info.Date
        
        cell.weather.text = info.Weather
        weather = info.Weather
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let Controller = segue.destination as? FoodViewController
        if let row = tableView.indexPathForSelectedRow?.row
        {
            let infosent = Infos[row]
            
            Controller?.user = infosent
        }
        
        
    }
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
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */

}

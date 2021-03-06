//
//  RestaurantTableTableViewController.swift
//  FoodPin
//
//  Created by vialley-imac on 2015/8/9.
//  Copyright © 2015年 ookiwi. All rights reserved.
//

import UIKit

class RestaurantTableTableViewController: UITableViewController {
    
    var restaurantNames = ["Cafe Deadend","Homei","Teakha","Cafe Loisl","Petite Oyster","For Kee Restaurant","Po's Atelier","Bourke Street Bakery","Haigh's Chocolate","Palomino Espresso","Upstate","Traif","Graham Avenue Meats","Five Leaves","Cafe Lore","Confessional","Barrafina","Donostia","Royal Oak","Thai Cafe"]
    
    var restaurantImages = ["cafedeadend.jpg","homei.jpg","teakha.jpg","cafeloisl.jpg","petiteoyster.jpg","forkeerestaurant.jpg","posatelier.jpg","bourkestreetbakery.jpg","haighschocolate.jpg","palominoespresso.jpg","upstate.jpg","traif.jpg","grahamavenuemeats.jpg","fiveleaves.jpg","cafelore.jpg","confessional.jpg","barrafina.jpg","donostia.jpg","royaloak.jpg","thaicafe.jpg"]
    
    var restaurantLocations = ["Hong Kong","Hong Kong","Hong Kong","Hong Kong","Hong Kong","Hong Kong","Hong Kong","Sydney","Sydney","Sydney","Sydney","New York","New York","New York","New York","London","London","London","London","London"]
    
    var restaurantTypes = ["Cafe","Cafe","Coffee & Tea Shop","Coffee & Tea Shop","French","French","Spanish","Spanish","Breakfast","Thai","Coffee & Tea Shop","Coffee & Tea Shop","Cafe","Cafe","French","French","Thai","Cafe","Coffee & Tea Shop","Coffee & Tea Shop"]
    

    override func viewDidLoad() {
        super.viewDidLoad()

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
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.restaurantNames.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! CustomTableViewCell
        // Configure the cell...
        
        // 設定餐廳名稱
        cell.nameLabel.text = restaurantNames[indexPath.row]
        
        // cell中的縮圖
        //cell.imageView?.image = UIImage(named: "restaurant.jpg")
        // 由array中取得相對應的cell縮圖
        cell.thumbnailImageView.image = UIImage(named: restaurantImages[indexPath.row])
        
        //將縮圖改成圓形
        //cell.thumbnailImageView.layer.cornerRadius = 10 如同設定border-radius
        cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.frame.size.width / 2
        cell.thumbnailImageView.clipsToBounds = true
        
        cell.locationLabel.text = restaurantLocations[indexPath.row]
        cell.typeLabel.text = restaurantTypes[indexPath.row]
        
        return cell
    }

    // 按下cell後出現的彈出視窗
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // 建立動作清單的選單  preferredStyle .Alert是置中的彈出視窗樣式 .ActionSheet是置底的彈出視窗樣式
        let optionMenu = UIAlertController(title: nil, message: "What do you want to to do?", preferredStyle: .ActionSheet)
        
        // 加入動作至選單中
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        
        optionMenu.addAction(cancelAction)
        
        // Call的動作
        let callActionHandler = { (action:UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .Alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alertMessage, animated: true, completion: nil)
        }
        
        let callAction = UIAlertAction(title: "Call" + "123-0000-\(indexPath.row)", style: UIAlertActionStyle.Default, handler: callActionHandler)
        optionMenu.addAction(callAction)
        
        
        // I've been here
        let isVisitedAction = UIAlertAction(title: "I've been here", style: .Default, handler: {
            (action:UIAlertAction!) -> Void in
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            cell?.accessoryType = .Checkmark
        })
        optionMenu.addAction(isVisitedAction)
        
        
        
        // 呈現選單
        self.presentViewController(optionMenu, animated: true, completion: nil)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
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
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

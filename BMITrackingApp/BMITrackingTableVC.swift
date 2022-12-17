//
//  BMITrackingTableVC.swift
//  BMITrackingApp
//
//  Created by Manmeen Kaur (301259638) on 2022-12-15.
//  Version: 1.0.0
//  Changes: Created BMI Tracking Table View Controller to store BMI with personal information in a table view.

import UIKit
import CoreData

var bmiTrackingList = [BMITracker]()

class BMITrackingTableVC: UITableViewController {

    var firstLoad = true
    
//    func nonDeletedBMI() -> [BMITracker]
//    {
//        var noDeleteBMI = [BMITracker]()
//        for bmiList in bmiTrackingList
//        {
//            if(bmiList.date == nil)
//            {
//                noDeleteBMI.append(bmiList)
//            }
//        }
//        return noDeleteBMI
//    }
    
    override func viewDidLoad()
    {
        if(firstLoad)
        {
            firstLoad = false
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "BMITracker")
            do {
                let results:NSArray = try context.fetch(request) as NSArray

                for result in results
                {
                    let bmiTrack = result as! BMITracker
                    print("BMITrack :  ", bmiTrack)
                    bmiTrackingList.append(bmiTrack)
                }
            }
            catch
            {
                print("Fetch Failed")
            }
        }
        print("Printing BMI Tracking List from Table View Controller Class: ", bmiTrackingList)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let bmiTrackingCell = tableView.dequeueReusableCell(withIdentifier: "BMITrackingCellID", for: indexPath) as! BMITrackingCell
        
        let thisBMI: BMITracker!
        thisBMI = bmiTrackingList[indexPath.row]
        
        bmiTrackingCell.nameLabel.text = thisBMI.name
        bmiTrackingCell.weightLabel.text = String(describing: thisBMI.weight)
        
        let dateBMI = thisBMI.date!
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MMM-yyyy"
        let formatteddate = formatter.string(from: dateBMI)
        bmiTrackingCell.dateLabel.text = formatteddate
        
        bmiTrackingCell.bmiLabel.text = String(describing: thisBMI.bmiResult)
//        let bmiResultToString = String(format: "%.2f", bmiResult)
//        bmiTrackingCell.bmiLabel.text = bmiResultToString
        return bmiTrackingCell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return bmiTrackingList.count
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        tableView.reloadData()
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
//    {
//        self.performSegue(withIdentifier: "editNote", sender: self)
//    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
//    {
//        if(segue.identifier == "editNote")
//        {
//            let indexPath = tableView.indexPathForSelectedRow!
//
//            let noteDetail = segue.destination as? NoteDetailVC
//
//            let selectedNote : BMITracker!
//            selectedNote = nonDeletedBMI()[indexPath.row]
//            noteDetail!.selectedNote = selectedNote
//
//            tableView.deselectRow(at: indexPath, animated: true)
//        }
//    }


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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  BMIViewController.swift
//  BMITrackingApp
//
//  Created by Manmeen Kaur (301259638) on 2022-12-15.
//  Version: 1.0.0
//  Changes: Created BMI Calculator View Controller to calculate BMI with personal information.

import UIKit
import CoreData


var selectedBMITracking: BMITracker? = nil


class BMIViewController: UIViewController {
    
    
    var segment = "Imperial"
    
    @IBOutlet weak var nameBMITextField: UITextField!
    
    @IBOutlet weak var ageBMITextField: UITextField!
    
    @IBOutlet weak var heightBMITextField: UITextField!
    
    @IBOutlet weak var weightBMITextField: UITextField!
    
    @IBOutlet weak var resultBMILabel: UILabel!
    
    @IBOutlet weak var bmiObserveLabel: UILabel!
    
    @IBAction func imperialMetricSegment(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            segment = "Imperial"
            heightBMITextField.attributedPlaceholder = NSAttributedString(
                string: "Height in Inches"
            )
            weightBMITextField.attributedPlaceholder = NSAttributedString(
                string: "Weight in Pounds"
            )
        }
        else
        {
            segment = "Metric"
            heightBMITextField.attributedPlaceholder = NSAttributedString(
                string: "Height in Meters"
            )
            weightBMITextField.attributedPlaceholder = NSAttributedString(
                string: "Weight in KGs"
            )
        }
    }
    
    @IBAction func calculateBMIButton(_ sender: UIButton) {
        
        let age: Int32? = Int32(self.ageBMITextField.text!)
        let height: Float? = Float(self.heightBMITextField.text!)
        let weight: Float? = Float(self.weightBMITextField.text!)
        var bmi: Float? = 0.0
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        
        
        if height != nil && weight != nil {
            
            if segment == "Imperial" {
                bmi = (weight!)/(height! * height!)
                bmi = 703*(bmi ?? 1)
            }
            else {
                bmi = (weight!)/(height! * height!)
            }
            
            let bmiToString = String(format: "%.2f", bmi!)
            
//            let numberFormat = NumberFormatter()
//            numberFormat.numberStyle = .decimal
//            let bmiInString = numberFormat.string(from: bmi! as NSNumber)
            
            resultBMILabel.text = bmiToString
            
            if(selectedBMITracking == nil)
            {
                let entity = NSEntityDescription.entity(forEntityName: "BMITracker", in: context)
                let newBMITracker = BMITracker(entity: entity!, insertInto: context)
                newBMITracker.id = bmiTrackingList.count as NSNumber
                newBMITracker.name = nameBMITextField.text
                newBMITracker.age = age! as NSNumber
                newBMITracker.height = height as? NSNumber
                newBMITracker.weight = weight as? NSNumber
                newBMITracker.bmiResult = bmi as? NSNumber
                print("-----------------------")
                print("Newly calculated BMI: ", newBMITracker.bmiResult!)
                print("-----------------------")
                
                newBMITracker.date = Date()
                do
                {
                    try context.save()
                    bmiTrackingList.append(newBMITracker)
                    print("-----------------------")
                    print("This is the newly added BMI Tracking List in Core Data: ", bmiTrackingList)
                    print("-----------------------")
                }
                catch
                {
                    print("context save error")
                }
            }
            else //edit
            {
                let request = NSFetchRequest<NSFetchRequestResult>(entityName: "BMITracker")
                do {
                    let results:NSArray = try context.fetch(request) as NSArray
                    for result in results
                    {
                        let bmiTrack = result as! BMITracker
                        if(bmiTrack == selectedBMITracking)
                        {
                            bmiTrack.name = nameBMITextField.text
                            bmiTrack.bmiResult = bmi as? NSNumber
                            bmiTrack.date = Date()
                            try context.save()
                        }
                    }
                }
                catch
                {
                    print("Fetch Failed")
                }
            }
            
            var bmiObservation = ""
            if(bmi! < 16){
                bmiObservation = "Severe Thinness"
            }else if(bmi! < 17){
                bmiObservation = "Moderate Thinness"
            }else if(bmi! < 18.5){
                bmiObservation = "Mild Thinness"
            }else if(bmi! < 25){
                bmiObservation = "Normal"
            }else if(bmi! < 30){
                bmiObservation = "Overweight"
            }else if(bmi! < 35){
                bmiObservation = "Obese Class 1"
            }else if(bmi! < 40){
                bmiObservation = "Obese Class 2"
            }else{
                bmiObservation = "Obese Class 3"
            }
            bmiObserveLabel.text = bmiObservation
        }
        else {
            if height == nil {
                let alert = UIAlertController(title: "Alert", message: "Please Enter Height", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            if weight == nil {
                let alert = UIAlertController(title: "Alert", message: "Please Enter Weight", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    

    override func viewDidLoad()
    {
        super.viewDidLoad()

    }
    

    @IBAction func trackBMIButton(_ sender: UIButton) {
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

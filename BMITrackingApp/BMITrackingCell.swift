//
//  BMITrackingCell.swift
//  BMITrackingApp
//
//  Created by Manmeen Kaur (301259638) on 2022-12-15.
//  Version: 1.0.0
//  Changes: Created BMI Tracking Cell for Name, Date, Weight and BMI to be displayed on the table view cell.

import UIKit

class BMITrackingCell: UITableViewCell {

   
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var bmiLabel: UILabel!
    
    @IBOutlet weak var weightLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

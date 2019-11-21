//
//  RepresentativeTableViewCell.swift
//  APIProject
//
//  Created by Jared Detro on 11/13/19.
//  Copyright © 2019 Jared Detro. All rights reserved.
//

import UIKit

class RepresentativeTableViewCell: UITableViewCell {
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var officeAddressLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

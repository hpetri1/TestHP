//
//  DetailViewControllerTableViewCell.swift
//  TestHP
//
//  Created by Helena Petri on 2020-01-19.
//  Copyright © 2020 HelenaPetri. All rights reserved.
//

import UIKit

class DetailViewControllerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellData: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

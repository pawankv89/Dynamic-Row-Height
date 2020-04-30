//
//  ListCell.swift
//  Dynamic Row Height
//
//  Created by Pawan kumar on 30/04/20.
//  Copyright © 2020 Pawan Kumar. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell {
    
    static let identifier = "ListCell"
    
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        //super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//
//  TableViewCell1.swift
//  beltPrep
//
//  Created by Erine Natnat on 9/20/18.
//  Copyright © 2018 Erine Natnat. All rights reserved.
//

import UIKit

class TableViewCell1: UITableViewCell {

    
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var btnCheckMark: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}

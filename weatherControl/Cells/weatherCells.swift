//
//  weatherCells.swift
//  weatherControl
//
//  Created by Kevin Ducker Marin on 11/9/17.
//  Copyright © 2017 Kevin Ducker Marin. All rights reserved.
//

import UIKit

class weatherCells: UITableViewCell {

    @IBOutlet weak var lb_title: UILabel!
    @IBOutlet weak var lb_subtitle: UILabel!
    @IBOutlet weak var lb_trititle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

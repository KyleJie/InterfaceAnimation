//
//  SimpleAnimationTableViewCell.swift
//  InterfaceAnimation
//
//  Created by NightSword on 7/5/21.
//

import UIKit

class SimpleAnimationTableViewCell: UITableViewCell {

    @IBOutlet weak var showLabel: UILabel!
    @IBOutlet weak var bgImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

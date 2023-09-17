//
//  InfoAdressHotelCell.swift
//  HotelApp-Test
//
//  Created by Александр on 9/17/23.
//

import UIKit

class InfoAdressHotelCell: UITableViewCell {
    
    @IBOutlet weak var horatingL: UILabel!
    @IBOutlet weak var ratingNameL: UILabel!
    @IBOutlet weak var reservationHotelAdressL: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

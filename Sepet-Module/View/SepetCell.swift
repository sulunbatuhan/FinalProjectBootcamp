//
//  SepetCell.swift
//  FoodCourt
//
//  Created by batuhan on 20.09.2022.
//

import UIKit

class SepetCell: UITableViewCell {

    @IBOutlet weak var sepetlbl: UILabel!
    @IBOutlet weak var sepetImage: UIImageView!
    @IBOutlet weak var sepetAdet: UILabel!
    @IBOutlet weak var hucreFiyat: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

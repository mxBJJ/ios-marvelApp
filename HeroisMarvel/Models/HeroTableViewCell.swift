//
//  HeroTableViewCell.swift
//  HeroisMarvel
//
//  Created by Max Mendes on 10/09/19.
//  Copyright © 2019 Max Mendes. All rights reserved.
//

import UIKit
import Kingfisher

class HeroTableViewCell: UITableViewCell {

    
    @IBOutlet weak var ivThumb: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    
    
    func prepare(with hero: Hero){
        lbName.text = hero.name
        lbDescription.text = hero.description
        if let url = URL(string: hero.thumbnail.urls){
            ivThumb.kf.indicatorType = .activity
            ivThumb.kf.setImage(with: url)
            ivThumb.layer.cornerRadius = 40
            ivThumb.clipsToBounds = true
           
        }else{
            ivThumb.image = nil
        }
        
    }

}

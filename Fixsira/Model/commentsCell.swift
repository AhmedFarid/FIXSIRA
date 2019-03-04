//
//  commentsCell.swift
//  Fixsira
//
//  Created by farido on 12/20/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class commentsCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var comments: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configuerCell(prodect: commets) {
        name.text = prodect.name
        comments.text = prodect.comment
        rating.text = prodect.rating
        date.text = prodect.date
    }
}

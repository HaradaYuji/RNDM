//
//  ThoughtCell.swift
//  RNDM
//
//  Created by 原田悠嗣 on 2020/01/26.
//  Copyright © 2020 原田悠嗣. All rights reserved.
//

import UIKit

class ThoughtCell: UITableViewCell {

    // Outlets
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var thoughtTextLabel: UILabel!
    @IBOutlet weak var likesImg: UIImageView!
    @IBOutlet weak var likesNumLabel: UILabel!



    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func congfigureCell(thought: Thought) {


        
    }

}

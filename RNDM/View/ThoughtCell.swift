//
//  ThoughtCell.swift
//  RNDM
//
//  Created by 原田悠嗣 on 2020/01/26.
//  Copyright © 2020 原田悠嗣. All rights reserved.
//

import UIKit
import Firebase

class ThoughtCell: UITableViewCell {

    // Outlets
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var thoughtTextLabel: UILabel!
    @IBOutlet weak var likesImg: UIImageView!
    @IBOutlet weak var likesNumLabel: UILabel!


    // Variables
    private var thought: Thought!

    override func awakeFromNib() {
        super.awakeFromNib()

        let tap = UITapGestureRecognizer(target: self, action: #selector(likeTapped))
        likesImg.addGestureRecognizer(tap)
        likesImg.isUserInteractionEnabled = true

    }

    @objc func likeTapped() {

//        // method1(merge)
//        Firestore.firestore().collection(THOUGHT_REF).document(thought.documentId)
//            // mergeで情報が新規ではなく更新される
//            .setData([NUM_LIKES : thought.numLikes + 1], merge: true)


        // method2(update)やっていることは1と同じ
        Firestore.firestore().document("thoughts/\(thought.documentId!)").updateData([NUM_LIKES : thought.numLikes + 1])
    }

    func congfigureCell(thought: Thought) {

        self.thought = thought

        usernameLabel.text = thought.username
        thoughtTextLabel.text = thought.thoughtText
        likesNumLabel.text = String(thought.numLikes)

        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, hh:mm"
        let timestamp = formatter.string(from: thought.timestamp)
        timestampLabel.text = timestamp
    }

}

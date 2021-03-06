//
//  AddThoughtVC.swift
//  RNDM
//
//  Created by 原田悠嗣 on 2020/01/25.
//  Copyright © 2020 原田悠嗣. All rights reserved.
//

import UIKit
import Firebase

class AddThoughtVC: UIViewController, UITextViewDelegate {


    // Outlets
    @IBOutlet private weak var categorySegment: UISegmentedControl!
    @IBOutlet private weak var userNameText: UITextField!
    @IBOutlet private weak var thoughtText: UITextView!
    @IBOutlet private weak var postBtn: UIButton!

    // Variables
    private var selectedCategory = ThoughtCategory.funny.rawValue


    override func viewDidLoad() {
        super.viewDidLoad()
        postBtn.layer.cornerRadius = 4
        thoughtText.layer.cornerRadius = 4
        thoughtText.text = "My random thought ..."
        thoughtText.textColor = .lightGray

        thoughtText.delegate = self
    }


    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
        textView.textColor = .darkGray
    }

    @IBAction func categoryChanged(_ sender: Any) {
        switch categorySegment.selectedSegmentIndex {
        case 0:
            selectedCategory = ThoughtCategory.funny.rawValue
        case 1:
            selectedCategory = ThoughtCategory.serious.rawValue
        default:
            selectedCategory = ThoughtCategory.serious.rawValue
        }
    }


    @IBAction func postBtnTapped(_ sender: Any) {
        guard let username = userNameText.text else { return }
        guard let thoughtText = thoughtText.text else { return }
        Firestore.firestore().collection(THOUGHT_REF).addDocument(data: [
            CATEGORY : selectedCategory,
            NUM_COMMENTS : 0,
            NUM_LIKES : 0,
            THOUGHT_TEXT : thoughtText,
            TIMESTAMP : Timestamp(date: Date()),//FieldValue.serverTimestamp(),
            USERNAME : username]) { (err) in
            if let err = err {
                debugPrint("Error adding document: \(err)")
            } else {
                self.navigationController?.popViewController(animated: true)
            }
        }





    }

}


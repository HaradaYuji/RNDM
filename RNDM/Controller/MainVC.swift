//
//  ViewController.swift
//  RNDM
//
//  Created by 原田悠嗣 on 2020/01/22.
//  Copyright © 2020 原田悠嗣. All rights reserved.
//

import UIKit
import Firebase

enum ThoughtCategory: String {
    case serious = "serious"
    case funny = "funny"
    case crazy = "crazy"
    case popular = "popular"
}


class MainVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // Outlets
    @IBOutlet private weak var segmentControl: UISegmentedControl!
    @IBOutlet private weak var tableView: UITableView!

    // Variables
    private var thoughts = [Thought]()
    private var thoughtsCollectionRef: CollectionReference!
    private var thoughtsListener: ListenerRegistration!
    private var selectedCategory = ThoughtCategory.funny.rawValue

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        // 要勉強
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension

        thoughtsCollectionRef = Firestore.firestore().collection(THOUGHT_REF)
    }


    @IBAction func categoryChanged(_ sender: Any) {

        switch segmentControl.selectedSegmentIndex {
        case 0:
            selectedCategory = ThoughtCategory.funny.rawValue
        case 1:
            selectedCategory = ThoughtCategory.serious.rawValue
        case 2:
            selectedCategory = ThoughtCategory.crazy.rawValue
        default:
            selectedCategory = ThoughtCategory.popular.rawValue
        }

        thoughtsListener.remove()
        setListerner()
    }

    override func viewWillAppear(_ animated: Bool) {
        setListerner()    }

    private func setListerner() {
        // listernerの実装
        thoughtsListener = thoughtsCollectionRef.whereField(CATEGORY, isEqualTo: selectedCategory).addSnapshotListener { (snapshot, error) in
            if let err = error {
                debugPrint("Error fetching docs: \(err)")
            } else {
                // 初期化
                self.thoughts.removeAll()
                guard let snap = snapshot else { return }
                for document in (snap.documents) {
                    let data = document.data()
                    let username = data["username"] as? String ?? "Anonymous"
                    let timestamp = data["timestamp"] as? Date ?? Date()
                    let thoughtText = data["thoughtText"] as? String ?? "Anonymous"
                    let numLikes = data[NUM_LIKES] as? Int ?? 0
                    let numComments = data[NUM_COMMENTS] as? Int ?? 0
                    let documentId = document.documentID


                    let newThought = Thought(username: username, timestamp: timestamp, thoughText: thoughtText, numLikes: numLikes, numComments: numComments, documentId: documentId)
                    self.thoughts.append(newThought)
                }
                self.tableView.reloadData()
            }
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        // リスナを解放
        thoughtsListener.remove()
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return thoughts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if let cell = tableView.dequeueReusableCell(withIdentifier: "thoughtCell", for: indexPath) as? ThoughtCell {
            cell.congfigureCell(thought: thoughts[indexPath.row])
            return cell
        } else {
            return UITableViewCell()
        }
    }
}


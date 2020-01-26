//
//  ViewController.swift
//  RNDM
//
//  Created by 原田悠嗣 on 2020/01/22.
//  Copyright © 2020 原田悠嗣. All rights reserved.
//

import UIKit

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

    // Variobles
    private var thoughts = [Thought]()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return thoughts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

}


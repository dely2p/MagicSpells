//
//  ResultViewController.swift
//  MagicSpells
//
//  Created by dely on 2019. 3. 10..
//  Copyright © 2019년 dely. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var magicSpellsSearchBar: UISearchBar!
    @IBOutlet weak var magicSpellsTableView: UITableView!
    var list: [HarryPotterMagicSpells] = {
        var dataList = [HarryPotterMagicSpells]()
        return dataList
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ResultViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "spellCell")
        cell?.textLabel?.text = list[indexPath.row].spellTitle
        return cell!
    }
}

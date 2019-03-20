//
//  ResultViewController.swift
//  MagicSpells
//
//  Created by dely on 2019. 3. 10..
//  Copyright © 2019년 dely. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController, UISearchResultsUpdating {
    @IBOutlet weak var magicSpellsTableView: UITableView!
    var list: [HarryPotterMagicSpells] = {
        var dataList = [HarryPotterMagicSpells]()
        return dataList
    }()
    var spells = [String]()
    var searchSpells = [String]()
    var searching = false
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        self.definesPresentationContext = true
        self.navigationItem.titleView = searchController.searchBar
        searchController.hidesNavigationBarDuringPresentation = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        searchController.isActive = true
        DispatchQueue.main.async{
            self.searchController.searchBar.becomeFirstResponder()
        }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            searchSpells = spells.filter({$0.prefix(searchText.count).uppercased() == searchText.uppercased()})
            print(searchSpells)
            searching = true
            self.magicSpellsTableView.reloadData()
        }
    }
}

extension ResultViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchSpells.count
        }else {
            return list.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "spellCell") {
            if searching {
                cell.textLabel?.text = searchSpells[indexPath.row]
            }else {
                cell.textLabel?.text = list[indexPath.row].spellTitle
            }
            
            return cell
        }
        return UITableViewCell()
    }
}

extension ResultViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        searchSpells = spells.filter({$0.prefix(searchText.count).uppercased() == searchText.uppercased()})
        print(searchSpells)
        searching = true
        self.magicSpellsTableView.reloadData()
    }
}

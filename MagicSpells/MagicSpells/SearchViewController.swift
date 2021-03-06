//
//  SearchViewController.swift
//  MagicSpells
//
//  Created by dely on 2019. 3. 10..
//  Copyright © 2019년 dely. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SearchViewController: UIViewController {
    var list: [HarryPotterMagicSpells] = {
        var dataList = [HarryPotterMagicSpells]()
        return dataList
    }()
    
    @IBOutlet weak var searchBarButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        searchMagicSpells()
//        Alamofire.request("http://34.85.30.131:3000/list", method: .get, encoding: URLEncoding.default).validate().responseJSON { response in
//            switch response.result {
//            case .success(let value):
//                print(value)
//                let json = JSON(value)
//                print("JSON: \(json)")
//            case .failure(let error):
//                print(error)
//            }
//        }
    }
    
    func searchMagicSpells() {
        Alamofire.request("http://34.85.30.131:3000/list", method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                for item in json{
                    let spell = HarryPotterMagicSpells()
                    let data = SpellData()
                    spell.spellTitle = item.0
                    data.title = item.1["title"].stringValue
                    data.effect = item.1["effect"].stringValue
                    data.source = item.1["source"].stringValue
                    spell.spellData = data

                    self.list.append(spell)
                }
            case .failure(let error):
                print("error")
                print(error)
            }
        }
    }
    
    @IBAction func searchBarButton(_ sender: UIButton) {
        performSegue(withIdentifier: "showResultView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResultView"{
            let resultView = segue.destination as! ResultViewController
            resultView.list = self.list
            resultView.spells = self.list.map({$0.spellTitle ?? ""})
        }
    }
    
}

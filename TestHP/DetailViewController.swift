//
//  DetailViewController.swift
//  TestHP
//
//  Created by NAIT Library on 2020-01-18.
//  Copyright © 2020 HelenaPetri. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var table: UITableView!
    
    var allHeroDetails = [String]()
    var detailsLabels = [String]()
    
    var heroName: String = ""
    var heroIdentity: String = ""
    var heroGroup: String = ""
    var heroPlaceOfOrigin:String = ""
    var heroCompany: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .dark

        allHeroDetails = [heroName, heroIdentity, heroGroup, heroPlaceOfOrigin, heroCompany]
        detailsLabels = ["Name", "Secret Identity", "Group Alliance", "Place of Origin", "Company"]
        
        table.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allHeroDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "heroDetailsCell", for: indexPath) as! DetailViewControllerTableViewCell
        
        cell.cellLabel.text = detailsLabels[indexPath.row]
        cell.cellData.text = allHeroDetails[indexPath.row]
        
        return cell
    }
}

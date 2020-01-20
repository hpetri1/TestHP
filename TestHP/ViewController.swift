//
//  ViewController.swift
//  TestHP
//
//  Created by Helena Petri on 2020-01-18.
//  Copyright © 2020 HelenaPetri. All rights reserved.
//

import UIKit

struct Data: Decodable{
    let data: [Hero]
}

struct Hero: Decodable {
    let name: String
    let identity: String
    let group: String
    let place_of_origin: String
    let publisher: String
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    final let url = "http://ios-prod.aivia.dev/api/production/heros"
    
    var herosData = [Hero]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        overrideUserInterfaceStyle = .dark
        pullJson()
    }
    
    func pullJson() {
        let urlObj = URL(string: url)
        
        URLSession.shared.dataTask(with: urlObj!) {(data, response, error) in
            
            do {
                let decoder = JSONDecoder()
                let heros = try decoder.decode(Data.self, from: data!)
                
                self.herosData = heros.data.sorted(by: {$0.name < $1.name})
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("Error with getting the JSON data")
            }
            
        }.resume()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return herosData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "heroCell", for: indexPath)
        cell.textLabel?.text = herosData[indexPath.row].name
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let tableViewCell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: tableViewCell)!
        
        let sendData : DetailViewController = segue.destination as! DetailViewController
            
            sendData.heroName = herosData[indexPath.row].name
            sendData.heroIdentity = herosData[indexPath.row].identity
            sendData.heroGroup = herosData[indexPath.row].group
            sendData.heroPlaceOfOrigin = herosData[indexPath.row].place_of_origin
            sendData.heroCompany = herosData[indexPath.row].publisher
    }
}


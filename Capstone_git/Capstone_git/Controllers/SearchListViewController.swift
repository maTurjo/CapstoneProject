//
//  SearchListViewController.swift
//  Capstone_git
//
//  Created by user202461 on 3/24/22.
//

import UIKit

class SearchListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var txtSearchRestaurent: UITextField!
    @IBOutlet weak var searchTableView: UITableView!
   // var restaurentData = nil
    var restaurentData:[Restaurent] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTableView.delegate = self
        searchTableView.dataSource = self
                // Do any additional setup after loading the view.
    }
    
    
    private func readLocalFile(_ name: String) -> Data? {
        do
        {
            if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        }
        catch {
            print(error)
        }
        
        return nil
    }

    @IBAction func btnSearch_click(_ sender: Any) {
        
        restaurentData = [Restaurent]()
        if let fileLocation = Bundle.main.path(forResource: "Restaurents", ofType: "json")
        {
            // do catch in case of error
            do
            {
                let data = try Data.init(contentsOf: URL(fileURLWithPath: fileLocation))
                let JsonDecoder = JSONDecoder()
                let datafromJson = try JsonDecoder.decode([Restaurent].self, from: data)
                restaurentData  = datafromJson.filter{$0.name.starts(with: txtSearchRestaurent.text!) }
                searchTableView.reloadData()
            }
            catch
            {
                print(error)
            }
        }
       // var  d:Data = Data()
        //d = readLocalFile("Restaurents.json")!
        //print(d)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurentData.count
    }
    	
  
    //Fill the table view with todo lost
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1",for:indexPath) as! RestaurentTableCell
        let restaurent = restaurentData[indexPath.row]
        //cell.lblResName?.text = restaurent.name
        cell.lblResName?.text =  restaurent.name
        cell.lblDescription?.text =  restaurent.description
        cell.imgRestaurentLogo.image=UIImage(named: restaurent.logo)
        return cell
    }
    
}

struct Restaurent:Codable{
    let name: String
    let description: String
    let logo: String    
}


class RestaurentTableCell:UITableViewCell {
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var imgRestaurentLogo: UIImageView!
    @IBOutlet weak var lblResName: UILabel!
}



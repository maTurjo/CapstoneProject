//Code Created by Sohilmahammad Liyakatali

import UIKit

class SearchListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {

    @IBOutlet weak var txtSearchRestaurent: UITextField!
    @IBOutlet weak var searchTableView: UITableView!
    var CategoryName:String = ""
    var restaurantList = DataController.Restaurants
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtSearchRestaurent.text = FeaturedViewController.SharedCategoryName
        searchTableView.delegate = self
        searchTableView.dataSource = self
        txtSearchRestaurent.delegate = self
        LoadDataInTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        txtSearchRestaurent.text = FeaturedViewController.SharedCategoryName
        searchTableView.delegate = self
        searchTableView.dataSource = self
        txtSearchRestaurent.delegate = self
        LoadDataInTableView()
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
       LoadDataInTableView()
    }
    
    func LoadDataInTableView()
    {
        restaurantList = DataController.Restaurants
        if(txtSearchRestaurent.text != "")
        {
          restaurantList = restaurantList.filter({$0.RestaurantsName.starts(with: txtSearchRestaurent.text!) || $0.Description.contains(txtSearchRestaurent.text!)})
        }
        searchTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(restaurantList.count)
        return restaurantList.count
    }
  
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1",for:indexPath) as! RestaurentTableCell
        cell.lblResName?.text = restaurantList[indexPath.row].RestaurantsName
        cell.lblDescription?.text = restaurantList[indexPath.row].Description
        cell.imgRestaurentLogo.image=UIImage(named: restaurantList[indexPath.row].HotelImage)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let restaurent = restaurantList[indexPath.row]
        let vc = self.storyboard?.instantiateViewController(identifier: "SingleRestaurantViewController") as! SingleRestaurantViewController
        vc.RestaurantName = restaurent.RestaurantsName
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           textField.resignFirstResponder()
           return true;
    }
}

class RestaurentTableCell:UITableViewCell {
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var imgRestaurentLogo: UIImageView!
    @IBOutlet weak var lblResName: UILabel!
}



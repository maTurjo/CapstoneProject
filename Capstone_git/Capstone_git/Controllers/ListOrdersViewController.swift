//  ListOrdersViewController.swift
//  Capstone_git
//  Created by Vidhi Jadav

import UIKit

class ListOrdersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var TableViewOrderItem: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderItem.orderItemName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1",for:indexPath) as! OrderViewTableCell
        cell.itemName?.text =  orderItem.orderItemName[indexPath.row]
        cell.orderPrice?.text =  orderItem.orderItemPrice[indexPath.row]
        cell.orderNumber?.text = orderItem.orderNumber[indexPath.row]
        cell.orderDate?.text = orderItem.orderDate[indexPath.row]
        cell.orderImage.image=UIImage(named: orderItem.orderItemImage[indexPath.row])
        cell.orderImage.layer.cornerRadius = 30
        return cell        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        TableViewOrderItem.delegate = self
        TableViewOrderItem.dataSource = self
        TableViewOrderItem.estimatedRowHeight = UITableView.automaticDimension
        
    }
}

    
class OrderViewTableCell: UITableViewCell {
   
    @IBOutlet weak var orderPrice: UILabel!
    @IBOutlet weak var orderNumber: UILabel!
    
    @IBOutlet weak var itemName: UILabel!
    
    @IBOutlet weak var orderDate: UILabel!
    @IBOutlet weak var orderImage: UIImageView!
}

class orderItem
{
    static var orderItemName:[String]=["Wendy's","Subway"]
    static var orderNumber:[String]=["040495","39574"]
    static var orderDate:[String]=["Apr. 09 2022","Mar.14,2022"]
    static var orderItemPrice:[String]=["CAD 30","CAD 20"]
    static var orderItemImage:[String]=["wendys","subway"]
}

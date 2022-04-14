//
//  Created by Sohilmahammad Liyakatali Polara
//

import UIKit

class CartViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var lblSubTotalAmount: UILabel!
    @IBOutlet weak var lblTaxAmount: UILabel!
    @IBOutlet weak var lblFinalTotalAmount: UILabel!
    
    @IBOutlet weak var summaryView: UIView!
    @IBOutlet weak var TableViewCartItem: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        TableViewCartItem.delegate = self
        TableViewCartItem.dataSource = self
        TableViewCartItem.estimatedRowHeight = UITableView.automaticDimension
        summaryView.layer.cornerRadius = 20
        CalculateSummary()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItem.cartItemName.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1",for:indexPath) as! CartviewTableCell
        cell.lblItemNAme?.text =  cartItem.cartItemName[indexPath.row]
        cell.lblItemDescription?.text =  cartItem.cartItemDescription[indexPath.row]
        cell.lblAmount?.text =  cartItem.cartItemPrice[indexPath.row]
        cell.imgCart.image=UIImage(named: cartItem.cartItemImage[indexPath.row])
        cell.imgCart.layer.cornerRadius = 30
        return cell
    }
    
    //Wipe left delete
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteaction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandeler) in
            cartItem.cartItemName.remove(at: indexPath.row)
            cartItem.cartItemDescription.remove(at: indexPath.row)
            cartItem.cartItemImage.remove(at: indexPath.row)
            cartItem.cartItemPrice.remove(at: indexPath.row)
            self.CalculateSummary()
            tableView.reloadData()
        }
        return UISwipeActionsConfiguration(actions: [deleteaction])
    }
    
    func CalculateSummary()
    {
        var TotalPrice:Double = 0.0
        var TaxAmount:Double = 0.0
        var FinalAmount:Double = 0.0
        for i in 0..<cartItem.cartItemPrice.count {
            TotalPrice += Double(cartItem.cartItemPrice[i].replacingOccurrences(of: "CAD ", with: ""))!
        }
        TaxAmount = (TotalPrice * 13) / 100
        FinalAmount = TotalPrice + TaxAmount
        lblSubTotalAmount.text =  "CAD " + String(TotalPrice)
        lblTaxAmount.text = "CAD " +  String(TaxAmount)
        lblFinalTotalAmount .text =  "CAD " + String(FinalAmount)
    }
    
}

class CartviewTableCell:UITableViewCell{
    
    @IBOutlet weak var imgCart: UIImageView!
    @IBOutlet weak var lblItemNAme: UILabel!
    @IBOutlet weak var lblAmount: UILabel!
    @IBOutlet weak var lblItemDescription: UILabel!
}


class cartItem
{
    static var cartItemName:[String]=["Pizaa (*2)","Chicken Wings (*1)"]
    static var cartItemDescription:[String]=["Med Fries [350.0 Cals], Med Coke[1.0 Cals]","Med Fried, Coca Cola, Mac Sause"]
    static var cartItemPrice:[String]=["CAD 30","CAD 20"]
    static var cartItemImage:[String]=["pizza_1","chicken_wings"]
}



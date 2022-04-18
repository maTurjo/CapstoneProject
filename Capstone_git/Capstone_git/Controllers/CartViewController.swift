//Created by Sohilmahammad Liyakatali Polara, Shruti

import UIKit

class CartViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    //Variables and outlet declaration---------------------
    @IBOutlet weak var lblSubTotalAmount: UILabel!
    @IBOutlet weak var lblTaxAmount: UILabel!
    @IBOutlet weak var lblFinalTotalAmount: UILabel!
    @IBOutlet weak var summaryView: UIView!
    @IBOutlet weak var TableViewCartItem: UITableView!
    //Variables and outlet declaration---------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableViewCartItem.delegate = self
        TableViewCartItem.dataSource = self
        TableViewCartItem.estimatedRowHeight = UITableView.automaticDimension
        summaryView.layer.cornerRadius = 20
        CalculateSummary()
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        TableViewCartItem.reloadData()
        CalculateSummary()
    }
    
    //This function returns count of items in cart
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItem.cartItemName.count
    }
    
    //This fucntion is called for every row of the tabe view
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
    
    //Swipe left action of the table view
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
    
    //This function calculates summary amount for all items in the cart
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
        lblSubTotalAmount.text =  "CAD " +  String(format: "%.2f",TotalPrice)
        lblTaxAmount.text = "CAD " +  String(format: "%.2f",TaxAmount)
        lblFinalTotalAmount .text =  "CAD " + String(format: "%.2f",FinalAmount)		
    }
    
}

class CartviewTableCell:UITableViewCell{
    
    @IBOutlet weak var imgCart: UIImageView!
    @IBOutlet weak var lblItemNAme: UILabel!
    @IBOutlet weak var lblAmount: UILabel!
    @IBOutlet weak var lblItemDescription: UILabel!
}

//All members of this class are static so that they can be accessed by all other controllers without a need to create an instance of the class cartItem
class cartItem
{
    static var cartItemName:[String]=["Pizaa (*2)","Chicken Wings (*1)"]
    static var cartItemDescription:[String]=["Med Fries [350.0 Cals], Med Coke[1.0 Cals]","Med Fried, Coca Cola, Mac Sause"]
    static var cartItemPrice:[String]=["CAD 30","CAD 20"]
    static var cartItemImage:[String]=["pizza_1","chicken_wings"]
}




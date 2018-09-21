//
//  ViewController.swift
//  beltPrep
//
//  Created by Erine Natnat on 9/20/18.
//  Copyright © 2018 Erine Natnat. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

   
    @IBOutlet var tableList: UITableView!
    
    var itemArray : [String] = ["Hello", "Good Morning", "Buy Some Cheese Biscuits"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Mark: Connects the custom cell to the table view cell
        tableList.register(UINib.init(nibName: "TableViewCell1", bundle: nil), forCellReuseIdentifier: "CheckListIdentifier")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    //MARK: Controls the number of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    //MARK: Controls the styling of each cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListIdentifier") as! TableViewCell1
        cell.cellLabel.text = itemArray[indexPath.row]
        cell.selectionStyle = .none
        cell.btnCheckMark.addTarget(self, action: #selector(checkMarkButtonClicked), for: .touchUpInside)
        return cell
    }
    
    
    //MARK: When custom button is clicked
    @objc func checkMarkButtonClicked(sender: UIButton)  {
        print("button preseed")
        if sender.isSelected {
            //uncheck btn
            sender.isSelected = false
        } else {
            //check the btn
            sender.isSelected = true
        }
        tableList.reloadData()
    }


}


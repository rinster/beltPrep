//
//  ViewController.swift
//  beltPrep
//
//  Created by Erine Natnat on 9/20/18.
//  Copyright © 2018 Erine Natnat. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {

    @IBOutlet var tableList: UITableView!
    

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//    var itemArray = [Item]()
    var itemArray : [String] = ["Hello", "Good Morning", "Buy Some Cheese Biscuits"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Connects the custom cell to the table view cell
        tableList.register(UINib.init(nibName: "TableViewCell1", bundle: nil), forCellReuseIdentifier: "CheckListIdentifier")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    //MARK: Creates the number of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    //MARK: Controls the styling of each cell as well as checkmark button
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListIdentifier") as! TableViewCell1
        cell.cellLabel.text = itemArray[indexPath.row]
        cell.selectionStyle = .none
        cell.btnCheckMark.addTarget(self, action: #selector(checkMarkButtonClicked), for: .touchUpInside)
        return cell
    }
    
    //MARK: When custom check mark button is clicked
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

    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let edit = editAction(at: indexPath)
        let delete = deleteAction(at: indexPath)
        
        //TODO: ADD Edit to actions below
        return UISwipeActionsConfiguration(actions: [edit, delete])
    }
    
    func editAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .normal, title: "Edit") { (action, view, completion) in
            self.performSegue(withIdentifier: "goToEditVC" , sender: indexPath.row)
            completion(true)
        }
        action.title = "Edit"
        action.backgroundColor = .blue
        return action
    }
    
    func deleteAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completion) in
            self.itemArray.remove(at: indexPath.row)
            self.tableList.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        action.title = "Delete"
        action.backgroundColor = .red
        return action
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //will go to the VC content to view the note
        performSegue(withIdentifier: "goToNoteViewVC", sender: indexPath.row)
       
    }

    
    
    
    //MARK: - Model Manipulation Methods
//    func saveItems()  {
//
//        do {
//            try context.save()
//        } catch {
//            print("Error saving context \(error)")
//        }
//
//        self.tableView.reloadData()
//    }
    
    //MARK: READING - Getting items from the DB to display onto the tableview
//    func loadItems(with request: NSFetchRequest<Item> = Item.fetchRequest())  {
//
//        do {
//
//            itemArray = try context.fetch(request)
//        } catch {
//            print("Error fetching data from context \(error)")
//        }
//    }
}




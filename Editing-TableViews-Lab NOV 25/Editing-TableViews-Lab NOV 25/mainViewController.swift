//
//  ViewController.swift
//  Editing-TableViews-Lab NOV 25
//
//  Created by World Domination a Brand on 11/25/19.
//  Copyright © 2019 Pursuitful stuff. All rights reserved.
//

import UIKit

class mainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    //var UserEnteredItem: String?
    
    var UserEnteredItem = [String]() {
    // array - is this another way to do it
    didSet{
        tableView.reloadData()
    }
    }
    
     var isEditingTableView = false {
        didSet{
            tableView.isEditing = isEditingTableView
            navigationItem.leftBarButtonItem?.title = isEditingTableView ? "Done" : "Edit"

        }
        
    }
    
    override func viewDidLoad() {
        tableView.dataSource = self
  
    }
    
    @IBAction func addNewItem(segue: UIStoryboardSegue) {
        print("adding item to list.....")
        
        // need to hold a reference of addingStuffViewController
        
       guard let referenceOfAddingStuffVC = segue.source as? AddingStuffViewController else {
            fatalError("failed to access addingStuffViewController ")
        }
        // after the segue happens then things will be added
        UserEnteredItem.append(referenceOfAddingStuffVC.addedItem!)
    }

    
    
    
    @IBAction func editButton(_ sender: UIBarButtonItem) {
        isEditing.toggle()
    }
    
    
}
extension mainViewController: UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserEnteredItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groceryCell", for: indexPath)
        
        cell.textLabel?.text = UserEnteredItem[indexPath.row]
        
        // type casting using as? only for custom cells because they need to know what they should reference
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .insert:
            print("something is being added to the tableView")
        case .delete:
            print("something is getting removed")
            UserEnteredItem.remove(at: indexPath.row)
            
            // why is it [indexPath] and not indexPath.row
            tableView.deleteRows(at: [indexPath], with: .automatic)
        default:
            print("nothing is happening")
        
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let itemToBeMoved = UserEnteredItem[sourceIndexPath.row]
            UserEnteredItem.remove(at: sourceIndexPath.row)
            UserEnteredItem.insert(itemToBeMoved, at: destinationIndexPath.row)
    }
    
    
}

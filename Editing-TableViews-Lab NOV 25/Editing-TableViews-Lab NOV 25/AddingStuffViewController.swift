//
//  addingStuffViewController.swift
//  Editing-TableViews-Lab NOV 25
//
//  Created by World Domination a Brand on 11/25/19.
//  Copyright © 2019 Pursuitful stuff. All rights reserved.
//

import UIKit

class AddingStuffViewController: UIViewController {
    
    @IBOutlet weak var addingStufftextField: UITextField!
    @IBOutlet weak var addItemButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        addingStufftextField.delegate = self
    }
}

extension AddingStuffViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }

}
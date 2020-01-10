//
//  AddContactViewController.swift
//  HomeWork_3
//
//  Created by Sasza Niehaj on 1/6/20.
//  Copyright © 2020 Sasza Niehaj. All rights reserved.
//

import UIKit

class AddContactViewController: UIViewController {

    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var createButton: UIButton!
    
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var addPhotoButton: UIButton!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    
    var delegate: AddContactViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        photo.layer.cornerRadius = photo.frame.size.height / 2
        photo.layer.masksToBounds = true
    }
    
    @IBAction func cancelButtonDidTap(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createButtonDidTap(_ sender: UIButton) {
        print("createButtonDidTap")
        
        let newContactPhoto = photo.image ?? nil
        let newContactFirstName = firstNameTextField.text ?? nil
        let newContactLastName = lastNameTextField.text ?? nil
        let newContactCompany = companyTextField.text ?? nil
        let newContactPhoneNumber = phoneNumberTextField.text ?? nil
        let newContactEmail = emailTextField.text ?? nil
        let newContactCountry = countryTextField.text ?? nil
        let newContactCity = cityTextField.text ?? nil
        
        let contact = Contact(photo: newContactPhoto, firstName: newContactFirstName, lastName: newContactLastName, company: newContactCompany, phoneNumber: newContactPhoneNumber, email: newContactEmail, country: newContactCountry, city: newContactCity)
        
        delegate?.didCreate(contact: contact)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addPhotoButtonDidTap(_ sender: UIButton) {
        print("addPhotoButtonDidTap")
    }
    
}

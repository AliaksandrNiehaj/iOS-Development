//
//  ContactViewController.swift
//  HomeWork_3
//
//  Created by Sasza Niehaj on 12/23/19.
//  Copyright © 2019 Sasza Niehaj. All rights reserved.
//

import UIKit

//MARK: - ContactViewController
class ContactViewController: BaseViewController {
    
    //MARK: - outlets
    @IBOutlet weak var contactTableView: UITableView!
    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    
    //MARK: - default properties
    let detailSegueID = "detailSegueID"
    var selectedContact: Contact?
    var detailedStoryboardID = "detailedStoryboard"
    
    //MARK: - lifeCycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Contacts"
        contactTableView.delegate = self
        contactTableView.dataSource = self
    }
    
    //MARK: - actions
    @IBAction func addButtonDidTap(_ sender: Any) {
        print("Add Button Did Tap")
        
        performSegue(withIdentifier: "addContact", sender: self)
        
    }
    
    @IBAction func editButtonDidTap(_ sender: Any) {
        contactTableView.isEditing = !contactTableView.isEditing
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addContactVC = segue.destination as? AddContactViewController {
            addContactVC.delegate = self
        }
    }
}


//MARK: - ContactViewControllerExtension: UITableViewDataSource
extension ContactViewController: UITableViewDataSource {
    
    
    //MARK: - default methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let contactCellIdentifier = "contactCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: contactCellIdentifier, for: indexPath) as? BaseCell
            else { fatalError("Can't not find cell with identifier \(contactCellIdentifier) at indexPath: \(indexPath).") }
        
        let contact = contacts[indexPath.row]
        cell.update(with: contact)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            contacts.remove(at: indexPath.row)
            contactTableView.deleteRows(at: [indexPath], with: .left)
        }
    }
}


//MARK: - ContactViewControllerExtension: UITableViewDelegate
extension ContactViewController: UITableViewDelegate {
    
    //MARK: - default methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        let contact = contacts[indexPath.row]
        selectedContact = contact
        
        if let detailedVC = storyboard?.instantiateViewController(identifier: detailedStoryboardID) as? DetailContactViewController {
            detailedVC.contact = selectedContact
            navigationController?.pushViewController(detailedVC, animated: true)
        }
    }
}

extension ContactViewController: AddContactViewControllerDelegate {
    func didCreate(contact: Contact) {
        contacts.append(contact)
        contactTableView.reloadData()
    }
}

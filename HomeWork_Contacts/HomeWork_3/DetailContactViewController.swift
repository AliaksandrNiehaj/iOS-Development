//
//  DetailContactViewController.swift
//  HomeWork_3
//
//  Created by Sasza Niehaj on 12/25/19.
//  Copyright © 2019 Sasza Niehaj. All rights reserved.
//

import UIKit

//MARK: - DetailContactViewController
class DetailContactViewController: UIViewController {
    
    //MARK: - outlets
    @IBOutlet weak var contactPhoto: UIImageView!
    @IBOutlet weak var contactFullName: UILabel!
    @IBOutlet weak var contactPlace: UILabel!
    @IBOutlet weak var messageButton: UIButton!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var videoButton: UIButton!
    @IBOutlet weak var mailButton: UIButton!
    
    //MARK: - default properties
    var contact: Contact!
    
    //MARK: - lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactPhoto.image = contact.photo ?? UIImage(named: "unknown")
        contactFullName.text = contact.description
        contactPlace.text = contact.placeDescription
    }
    
    //MARK: - outlets
    override func viewWillAppear(_ animated: Bool) {
        contactPhoto.layer.cornerRadius = contactPhoto.frame.size.height / 2
        contactPhoto.layer.masksToBounds = true
        
        messageButton.layer.cornerRadius = messageButton.frame.size.height / 2
        messageButton.layer.masksToBounds = true
        
        callButton.layer.cornerRadius = callButton.frame.size.height / 2
        callButton.layer.masksToBounds = true
        
        videoButton.layer.cornerRadius = videoButton.frame.size.height / 2
        videoButton.layer.masksToBounds = true
        
        mailButton.layer.cornerRadius = mailButton.frame.size.height / 2
        mailButton.layer.masksToBounds = true
    }
    
    @IBAction func messageButtonDidTap(_ sender: Any) {
        print("messageButtonDidTap")
    }
    
    @IBAction func calButtonDidTap(_ sender: Any) {
        print("calButtonDidTap")
    }
    
    @IBAction func videoButtonDidTap(_ sender: Any) {
        print("videoButtonDidTap")
    }
    
    @IBAction func mailButtonDidTap(_ sender: Any) {
        print("mailButtonDidTap")
    }
}

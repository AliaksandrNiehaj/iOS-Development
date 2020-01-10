//
//  Contact.swift
//  HomeWork_3
//
//  Created by Sasza Niehaj on 12/23/19.
//  Copyright © 2019 Sasza Niehaj. All rights reserved.
//

import UIKit

//MARK: - Contact
public struct Contact: CustomStringConvertible {
    
    //MARK: - public properties
    public var description: String {
        return "\(firstName ?? "")" + " " + "\(lastName ?? "")"
    }
    
    public var placeDescription: String {
        var place: String!
        
        if let country = country, let city = city { place = "\(country), \(city)" }
        else if let country = country { place = "\(country)" }
        else if let city = city { place = "\(city)" }
        else { place = "" }
        
        return place
    }
    
    //MARK: - default properties
    var photo: UIImage?
    var firstName: String?
    var lastName: String?
    var company: String?
    var phoneNumber: String?
    var email: String?
    var country: String?
    var city: String?
    
    
    var isFavorite: Bool {
        get { UserDefaults.standard.bool(forKey: description) }
        set { UserDefaults.standard.setValue(newValue, forKey: description) }
    }
}

//
//  FavoriteViewController.swift
//  HomeWork_3
//
//  Created by Sasza Niehaj on 12/23/19.
//  Copyright © 2019 Sasza Niehaj. All rights reserved.
//

import UIKit

//MARK: - FavoriteViewController
class FavoriteViewController: BaseViewController {
    
    //MARK: - outlets
    @IBOutlet weak var favoriteTableView: UITableView!
    
    //MARK: - lifeCycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Favorites"
        favoriteTableView.dataSource = self
        favoriteTableView.delegate = self
    }
}

//MARK: - FavoriteViewControllerWithUITableViewDelegate
extension FavoriteViewController: UITableViewDelegate {
}


//MARK: - FavoriteViewControllerWithUITableViewDataSource
extension FavoriteViewController: UITableViewDataSource {
    
    
    //MARK: - default methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let favoriteCellIdentifier = "favoriteCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: favoriteCellIdentifier, for: indexPath) as? BaseCell,
            let favoriteContacts = favoriteContacts
        else { return UITableViewCell() }
        
        let favoriteContact = favoriteContacts[indexPath.row]
        cell.update(with: favoriteContact)
        
        return cell
    }
    
}

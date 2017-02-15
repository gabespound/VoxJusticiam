//
//  TagTableVC.swift
//  Social Justice
//
//  Created by Gabriel Spound on 1/30/17.
//  Copyright © 2017 Gabriel Spound. All rights reserved.
//

import Foundation
import UIKit

class TagCell: UITableViewCell{
    
    @IBOutlet weak var cellLabel: UILabel!
}

class TagTableVC: UITableViewController{
    
    //Table Content
    
    var filteredTags = [Tag]()
    
    //Searchbar Initialization
    let searchController = UISearchController(searchResultsController: nil)
    
    //Required Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.contentInset = UIEdgeInsetsMake(20.0, 0.0, 0.0, 0.0)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(searchController.isActive && searchController.searchBar.text != ""){
            if(!globUs.alreadyHasTag(t: self.filteredTags[indexPath.row].index)){
                globUs.tags.append(self.filteredTags[indexPath.row].index)
                dismiss(animated: true, completion: nil)
            }
        } else {
            if(!globUs.alreadyHasTag(t: indexPath.row)){
                globUs.tags.append(indexPath.row)
                dismiss(animated: true, completion: nil)
            }
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchController.isActive && searchController.searchBar.text != "") {
            return filteredTags.count
        }
        return globTA.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tagcell", for: indexPath) as! TagCell
        
        var text = ""
        if (searchController.isActive && searchController.searchBar.text != ""){
            text = globTA[filteredTags[indexPath.row].index].title
        } else {
            text = globTA[indexPath.row].title
        }
        
        cell.cellLabel.text = text
        return cell
    }
    
    //Filters Tags array into Filtered array based on search query
    func filterContentForSearchText(searchText: String, scope: String = "All"){
        filteredTags = globTA.filter{ $0.title.lowercased().contains(searchText.lowercased())}
        self.tableView.reloadData()
    }
}

extension TagTableVC: UISearchResultsUpdating {
    
    //calls the filter function everytime the searchbar is activated
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
}

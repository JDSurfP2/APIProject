//
//  RepresentativeTableViewController.swift
//  APIProject
//
//  Created by Jared Detro on 11/11/19.
//  Copyright © 2019 Jared Detro. All rights reserved.
//

import UIKit

class RepresentativeTableViewController: UITableViewController {

    @IBOutlet var repSearchBar: UITableView!
    
    
    var representativeList: [Representative] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return representativeList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 || indexPath.row == 1 || indexPath.row == 2 || indexPath.row == 3 || indexPath.row == 4 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "RepresentativeCell", for: indexPath) as? RepresentativeTableViewCell else { return UITableViewCell() }
            cell.nameLabel.text = representativeList[indexPath.row].name
            cell.partyLabel.text = representativeList[indexPath.row].party
            cell.websiteLabel.text = representativeList[indexPath.row].link
            cell.officeAddressLabel.text = representativeList[indexPath.row].office
            cell.stateLabel.text = representativeList[indexPath.row].state
            cell.districtLabel.text = representativeList[indexPath.row].district
            cell.phoneLabel.text = representativeList[indexPath.row].phone

            return cell
        } else {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepresentativeCell", for: indexPath)

        return cell
        }
    }
}

extension RepresentativeTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let zipCode = searchBar.text
        if let unwrappedZipCode = zipCode {
            RepresentativeListNetworkController(path: unwrappedZipCode).getRepresentativeList { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let representativeList):
                        print(representativeList)
                        self.representativeList = representativeList
                        self.tableView.reloadData()
                    case .failure:
                        let alert = UIAlertController(title: "Error", message: "Failed to load data", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        
                        self.present(alert, animated: true, completion: nil)
                    }
                }
            }
        }
    }
}

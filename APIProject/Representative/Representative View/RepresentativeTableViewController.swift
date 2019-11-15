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
    
    let representativeListController = RepresentativeListNetworkController()
    
    var representativeList: RepresentativeList = RepresentativeList(repName: "Jared", repParty: "Rep", repState: "UT", repDistrict: "Utah County", repPhone: "9879879879", repOffice: "School", repLink: URL(string: "google.com")!, repResults: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()

        representativeListController.getRepresentativeList { result in
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
    
    // MARK: - Table view data source

//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        return 1
//    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RepresentativeCell", for: indexPath)
            cell.textLabel?.text = representativeList.repResults[indexPath.row].repName

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
            let newBaseURL = ("\(representativeListController.baseURL)\(unwrappedZipCode)")
            print("Received New URL \(newBaseURL)")
        }
    }
}

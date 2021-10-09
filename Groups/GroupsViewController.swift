//
//  GroupsTableViewController.swift
//  PerfApp-1436
//
//  Created by Oschepkov Aleksandr on 07.10.2021.
//

import UIKit
import Alamofire
import PromiseKit

class GroupsViewController: UIViewController {
    
    var groups: [Groups] = []
    let groupsAPI = GroupsAPI()
    
    let groupService = groupsPromise()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        groupService.getGroups()
            .then { [weak self] groups -> Promise<[Groups]> in

                return self!.groupService.searchById(for: 21755531)
            }
        
            .done { [weak self] groups in
                print(groups)
            }

            .catch {error in print(error)}


   }

}

    


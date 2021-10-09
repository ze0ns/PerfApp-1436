//
//  GroupsAPIPromiseKit.swift
//  PerfApp-1436
//
//  Created by Oschepkov Aleksandr on 07.10.2021.
//

import Foundation
import Alamofire
import PromiseKit

class groupsPromise {

    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let clientId = Session.shared.userId
    let version = "5.181"
    
    //Метод сбора всех групп пользователя, выдается ID групп пользователя
    func getGroups()->  Promise<[groupsID]>{
        let (promise, resolver) = Promise<[groupsID]>.pending()
        let method = "/groups.get"
        
        let parameters: Parameters = [
            "owner_id": clientId,
            "access_token": Session.shared.token,
            "v":version,
            "extended": 0
            ]
        let url = baseUrl + method
        AF.request(url, method: .get, parameters: parameters).responseJSON {
            response in

            if let error = response.error {
                          resolver.reject(error)
                      }
                      
                      if let data = response.data {
                          do {
                              let groupsID = try JSONDecoder().decode([groupsID].self, from: data)
                              resolver.fulfill(groupsID)
                          } catch {
                              resolver.reject(ApplicationError.noID)
                          }
                      }
                  }
        return promise
    }
        
    // Метод, вывести информацию о группе по ID
    func searchById(for groupId: Int) -> Promise<[Groups]>
     {
        let (promise, resolver) = Promise<[Groups]>.pending()
        let method = "/groups.getById"
   //      var nameGroup: String = ""

        let parameters: Parameters = [
            "access_token": Session.shared.token,
            "v":version,
            "group_id":groupId,
            "fields": "description"
        ]
        let url = baseUrl + method
        AF.request(url, method: .get, parameters: parameters).responseJSON {
            response in
            if let error = response.error{
                resolver.reject(error)
            }
            
            if let data = response.data {
                         do {
                             let groups = try JSONDecoder().decode([Groups].self, from: data)
                             resolver.fulfill(groups)
                             
                         } catch {
                             resolver.reject(ApplicationError.noGroups)
                         }
                     }
          }
         return promise
}
    
    
}



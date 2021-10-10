//
//  GroupsAPI.swift
//  client-server-1436
//
//  Created by Oschepkov Aleksandr on 19.08.2021.
//
//print("----------------PRINT-----------------")
//print(response.data?.prettyJSON)

import Foundation
import Alamofire
import DynamicJSON

struct User2{
    
}

final class GroupsAPI{
    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let clientId = Session.shared.userId
    let version = "5.131"
    
    // Метод, вывести информацию о группе по ID
    func searchById(id: Int, comletion: @escaping((String)->()))
     {
        let method = "/groups.getById"

        let parameters: Parameters = [
            "access_token": Session.shared.token,
            "v":version,
            "group_id":id,
            "fields": "description"
        ]
        let url = baseUrl + method
        AF.request(url, method: .get, parameters: parameters).responseJSON {
            response in
            guard let data =  response.data else {return} //Распаковали наш ответ, и проверили его. Если все хорошо - идём дальше
            guard let items = JSON(data).response.array else {return}
            let groups = items.map {GroupsDynamic(json: $0)}
            let name = groups[0].name
            comletion(name)
        }
}
    
    //метод, вывести все группы пользователя
    func getGroups(comletion: @escaping(([Groups]?)->())){
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
            guard let data = response.data else {return} //Распаковали наш ответ, и проверили его. Если все хорошо - идём дальше
           
            //добавим проверку на ошибку, если будет ошибка она выведется в консоль
            do {
                let groupResponse = try? JSONDecoder().decode(Groups.self, from: data)
                
                let groups = groupResponse?.response.items

           //     comletion(groups)
                
                print("----------------PRINT-----------------")
                print(response.data?.prettyJSON)
            }
        }
      }

}



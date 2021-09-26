//
//  NewsFeedAPI.swift
//  client-server-1436
//
//  Created by Oschepkov Aleksandr on 08.09.2021.
//

//print("----------------PRINT-----------------")
//print(response.data?.prettyJSON)

import Foundation
import Alamofire
import DynamicJSON
import SwiftUI


final class NewsFeedAPI{
    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let clientId = Session.shared.userId
    let version = "5.131"
    let filters = "note"
    let count = "31"
    
    

      //метод, поиск группы по ключевому слову
    func getNews(comletion: @escaping(([Any]?)->())){
              let method = "/newsfeed.get"

              let parameters: Parameters = [
                  "filters": filters,
                  "count":count,
                  "access_token": Session.shared.token,
                  "v": version
                  ]
              let url = baseUrl + method
                let newsItems: [Item] = []
                let newsGroup: [GroupNews] = []
                let newsProfiles: [Profile] = []
                let newsPhoto: [Attachment] = []
          
              var newsFeeds: [Any] = [newsItems, newsGroup, newsProfiles, newsPhoto]
          
              ///Группа очереди
              let dispatchGroup = DispatchGroup()
          
              AF.request(url, method: .get, parameters: parameters).responseJSON {
                response in
                guard let data = response.data else {return} //Распаковали наш ответ, и проверили его. Если все хорошо - идём дальше

                  DispatchQueue.global().async(group: dispatchGroup) {
                      do {
                          let NewsFeedResponse = try JSONDecoder().decode(NewsFeed.self, from: data)
                          
                          let newsFeed = NewsFeedResponse.response.items
                          
                          print(Thread.current)
                          newsFeeds.self.append(newsFeed)
                          
                      } catch let error as NSError {
                          NSLog("Error in read(from:ofType:) domain= \(error.domain), description= \(error.localizedDescription)")
                      }}
                  DispatchQueue.global().async(group: dispatchGroup) {
                      do {
                          let NewsFeedResponse = try JSONDecoder().decode(NewsFeed.self, from: data)
                          
                          let newsGroup = NewsFeedResponse.response.groups
                          print(Thread.current)
                          newsFeeds.self.append(newsGroup)
                          
                      } catch let error as NSError {
                          NSLog("Error in read(from:ofType:) domain= \(error.domain), description= \(error.localizedDescription)")
                      }}
                  DispatchQueue.global().async(group: dispatchGroup) {
                      do {
                          let NewsFeedResponse = try JSONDecoder().decode(NewsFeed.self, from: data)
                          
                          let newsProfiles = NewsFeedResponse.response.profiles
                          
                          print(Thread.current)
                          newsFeeds.self.append(newsProfiles)
                          
                      } catch let error as NSError {
                          NSLog("Error in read(from:ofType:) domain= \(error.domain), description= \(error.localizedDescription)")
                      }}
                  DispatchQueue.global().async(group: dispatchGroup) {
                      do {
                          let NewsFeedResponse = try JSONDecoder().decode(NewsFeed.self, from: data)
                          
                          let newsPhoto = NewsFeedResponse.response.items.first?.attachments
                          
                          
                          print(Thread.current)
                         

                        newsFeeds.self.append(newsPhoto)
                          
                      } catch let error as NSError {
                          NSLog("Error in read(from:ofType:) domain= \(error.domain), description= \(error.localizedDescription)")
                      }}

                  dispatchGroup.notify(queue: DispatchQueue.main){
                      comletion(newsFeeds)
                      
                  }
           }
        }
}

    





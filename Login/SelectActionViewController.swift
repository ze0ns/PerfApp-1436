//
//  ViewController.swift
//  PerfApp-1436
//
//  Created by zeons on 22.09.2021.
//

import UIKit

class SelectActionViewController: UIViewController {
    var friends: [Friend] = []
    
    //Блок работы с фотографиями
    let photoAPI = PhotosAPI()
    var photos: [Photo] = []

    
    func photoCache(_ photo: [Photo]) -> [UIImage]{
        var photos: [Photo] = []
        photos = photo
        let e = photos.count
        var imagesArray:[UIImage] = [UIImage]()
        var i = 0
        while i < e {
            
            let urlImage = URL(string:photos[i].sizes.first!.url)
            if let data = try? Data(contentsOf: urlImage!) {
                // Create Image and Update Image View
                imagesArray.append(UIImage(data: data)!)
            }
            
            i = i + 1
        }
        return(imagesArray)
    }
    
    @IBAction func actionsNewsFeed(_ sender: Any) {
        let newsVC = NewsWallController()
        self.navigationController?.pushViewController(newsVC, animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        photoAPI.getPhotos {[weak self]  users in
            self?.photos = users!
          }
        
        
    }
// Очередь разбиата на несколько потоков парралельно, поэтому мы видим разный результат
    @IBAction func actionTest(_ sender: Any) {
        let newsVC = NewsFeedsController()
       self.navigationController?.pushViewController(newsVC, animated: true)
    }
    
    @IBAction func frendsViewActions(_ sender: Any) {
        let FriendsVC = DisplayFrendsTableViewController()
        self.navigationController?.pushViewController(FriendsVC, animated: true)
        
    }
    @IBAction func actionGroupsPromise(_ sender: Any) {
        let GroupVC = GroupsViewController()
        self.navigationController?.pushViewController(GroupVC, animated: true)
    }
    @IBAction func actionPerf(_ sender: Any) {
        let PhotoVC = DisplayPhotoViewController()
        PhotoVC.photos = photoCache(photos)
        self.navigationController?.pushViewController(PhotoVC, animated: true)
    }
}



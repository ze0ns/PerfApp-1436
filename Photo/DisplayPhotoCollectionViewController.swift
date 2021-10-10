//
//  DisplayPhotoCollectionViewController.swift
//  client-server-1436
//
//  Created by zeons on 21.08.2021.
//

import UIKit

class DisplayPhotoViewController: UIViewController {

    let photosAPI = PhotosAPI()
    var photos: [UIImage] = [UIImage]()
    let reusableNIB = "PhotosCollectionViewCell"
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Регистрируем ячейку, созданную через xib
        let nib = UINib(nibName: reusableNIB, bundle: nil)
        collectionView?.register(nib, forCellWithReuseIdentifier: reusableNIB)
        print(photos)
       
    }


}
extension DisplayPhotoViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{


    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusableNIB, for: indexPath) as! PhotosCollectionViewCell
        cell.photosImage.image = photos[indexPath.row]
        return cell
    }

}

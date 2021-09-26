//
//  ViewController.swift
//  PerfApp-1436
//
//  Created by zeons on 22.09.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func actionsNewsFeed(_ sender: Any) {
        let newsVC = NewsWallController()
        self.navigationController?.pushViewController(newsVC, animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
// Очередь разбиата на несколько потоков парралельно, поэтому мы видим разный результат

}


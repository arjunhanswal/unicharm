//
//  PhotoDetialsVC.swift
//  UniCharm
//
//  Created by Kavita on 11/08/20.
//  Copyright © 2020 Kavita. All rights reserved.
//

import UIKit

class PhotoDetialsVC: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var lblPhotoCount: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func bcak(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)

    }
    
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        return cell
    }
    
    
}
extension PhotoDetialsVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.collectionView.frame.width - 20) / 2, height: 200)
    }
}

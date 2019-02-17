//
//  ViewController.swift
//  PhotoDeleteApp
//
//  Created by coco j on 2019/02/17.
//  Copyright © 2019 amaocha. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate ,UICollectionViewDelegateFlowLayout {
    
    let photos = ["aomori", "atami", "fukuoka", "kanazawa", "kobe", "kyoto", "okinawa"]
    
    var selectedImage: UIImage?
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //コレクションビューから識別子「TestCell」のセルを取得する。
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TestCell", for: indexPath) as UICollectionViewCell
        
        let imageView = cell.contentView.viewWithTag(1) as! UIImageView
        let cellImage = UIImage(named: photos[indexPath.row])
        imageView.image = cellImage
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // section数は１つ
        return 1
    }
    
    // UICollectionViewDelegateFlowLayoutの設定が必要
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // 横方向のスペース調整
        let horizontalSpace:CGFloat = 2
        let cellSize:CGFloat = self.view.bounds.width/2 - horizontalSpace
        // 正方形で返すためにwidth,heightを同じにする
        return CGSize(width: cellSize, height: cellSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        selectedImage = UIImage(named: photos[indexPath.row])
        
        if selectedImage != nil {
            performSegue(withIdentifier: "goToSubVC", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToSubVC") {
            let subVC: SubViewController = (segue.destination as? SubViewController)!
            // SubViewController のselectedImgに選択された画像を設定する
            subVC.selectedImage = selectedImage
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
}


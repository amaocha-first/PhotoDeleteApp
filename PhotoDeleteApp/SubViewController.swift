//
//  SubViewController.swift
//  PhotoDeleteApp
//
//  Created by coco j on 2019/02/17.
//  Copyright © 2019 amaocha. All rights reserved.
//

import UIKit

class SubViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    var selectedImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = selectedImage
        // 画像のアスペクト比を維持しUIImageViewサイズに収まるように表示
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
    }
    

}

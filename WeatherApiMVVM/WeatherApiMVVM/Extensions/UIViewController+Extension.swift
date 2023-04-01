//
//  UIViewController+Extension.swift
//  WeatherApiMVVM
//
//  Created by Ali Amanvermez on 1.04.2023.
//

import Foundation
import UIKit
extension UIViewController {
    func assignBackground(named: String) {
        let background = UIImage(named: named)
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
}

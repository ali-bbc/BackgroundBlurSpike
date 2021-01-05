//
//  ViewController.swift
//  BackgroundBlurSpike
//
//  Created by Ali Hassan on 04/01/2021.
//  Copyright © 2021 Ali Hassan. All rights reserved.
//

import UIKit
import CoreImage
import CoreGraphics

class ViewController: UIViewController {

//    @IBOutlet weak var leftImageView: UIImageView!
//    @IBOutlet weak var rightImageView: UIImageView!

    @IBOutlet weak var testImageView: UIImageView!
    @IBOutlet weak var overlayView: UIVisualEffectView!

    override func viewDidLoad() {
        super.viewDidLoad()

//        let leftImage = UIImage(named: "image1")
//        let rightImage = UIImage(named: "image2")
//
//        let size = CGSize(width: leftImageView.frame.width + rightImageView.frame.width, height: leftImageView.frame.height)
//        UIGraphicsBeginImageContext(size)
//
//        let leftAreaSize = CGRect(x: 0, y: 0, width: leftImageView.frame.width, height: size.height)
//        let rightAreaSize = CGRect(x: leftImageView.frame.width, y: 0, width: rightImageView.frame.width, height: size.height)
//
//        leftImage!.draw(in: leftAreaSize)
//        rightImage!.draw(in: rightAreaSize, blendMode: .normal, alpha: 1)
//
//        let newImage = UIGraphicsGetImageFromCurrentImageContext()!.applyGussianBlur()
//        UIGraphicsEndImageContext()
//
//        let newImageView = UIImageView(image: newImage)
//        view.addSubview(newImageView)
//        newImageView.center = view.center

        let testImage = UIImage(named: "testImage")?.applyGussianBlur()
        testImageView.image = testImage
//
        

//        overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.25)
    }
}

extension UIImage {

    func applyGussianBlur() -> UIImage {
        let context = CIContext()
        guard let currentFilter = CIFilter(name: "CIGaussianBlur") else { return self }

        let beginImage = CIImage(image: self)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        currentFilter.setValue(50, forKey: kCIInputRadiusKey)

        if let cgimg = context.createCGImage(currentFilter.outputImage!, from: beginImage!.extent) {
            return UIImage(cgImage: cgimg)
        }
        return self
    }

}


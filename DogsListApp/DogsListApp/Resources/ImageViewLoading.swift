//
//  ImageViewLoading.swift
//  DogsListApp
//
//  Created by Jyoti on 20/11/2022.
//

import Foundation
import UIKit


let imageCache = NSCache<NSString, UIImage>()

class CustomImageView: UIImageView {
    
    var imageUrlString: String?
    func loadImageUsingUrlString(urlString: String) {
        imageUrlString = urlString
        guard let url = URL(string: urlString) else { return }
        image = nil
        if let imageFromCache = imageCache.object(forKey: urlString as NSString) {
            self.image = imageFromCache
            return
        }
        URLSession.shared.dataTask(with: url, completionHandler: { (data, respones, error) in
            if error != nil {
                //uncomment it if you want to see error while getting url of image
//                UIApplication.shared.keyWindowPresentedController?.presentAlertWithTitleAndMessage(title: "OOPS!", message: error, options: "OK", completion: { option in
//                })
                ////print(error ?? "")
                return
            }
            DispatchQueue.main.async {
                guard let imageToCache = UIImage(data: data!) else { return }
                
                if self.imageUrlString == urlString {
                    self.image = imageToCache
                }
                imageCache.setObject(imageToCache, forKey: urlString as NSString)
            }
        }).resume()
    }
}

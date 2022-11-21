//
//  UIViewController + Extension.swift
//  DogsListApp
//
//  Created by Jyoti on 20/11/2022.
//

import Foundation
import UIKit

extension UIViewController {

    //MARK : - setup position for loadingIndicator in screen
    func setupPositionOfProgressView(loadingIndicator : ProgressView) {
        NSLayoutConstraint.activate([
            loadingIndicator.centerXAnchor
                .constraint(equalTo: self.view.centerXAnchor),
            loadingIndicator.centerYAnchor
                .constraint(equalTo: self.view.centerYAnchor),
            loadingIndicator.widthAnchor
                .constraint(equalToConstant: 50),
            loadingIndicator.heightAnchor
                .constraint(equalTo: loadingIndicator.widthAnchor)
        ])
    }
}

extension UIViewController {
    /// Display message in prompt view
    ///
    /// — Parameters:
    /// — title: Title to display Alert
    /// — message: Pass string of content message
    /// — options: Pass multiple UIAlertAction title like “OK”,”Cancel” etc
    /// — completion: The block to execute after the presentation finishes.
    func presentAlertWithTitleAndMessage(title: String, message: String, options: String..., completion: @escaping (Int) -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, option) in options.enumerated() {
            alertController.addAction(UIAlertAction.init(title: option, style: .default, handler: { (action) in
                completion(index)
            }))
        }
        UIApplication.shared.keyWindowPresentedController?.present(alertController, animated: true, completion: nil)
        //topMostViewController().present(alertController, animated: true, completion: nil)
    }
    
    /// Get the top most view in the app
    /// — Returns: It returns current foreground UIViewcontroller
    func topMostViewController() -> UIViewController {
        var topViewController: UIViewController? = AppDelegate.appDelegate().window?.rootViewController
        while ((topViewController?.presentedViewController) != nil) {
            topViewController = topViewController?.presentedViewController
        }
        return topViewController ?? UIViewController()
    }
    
    func setBackButton(){
        let yourBackImage = UIImage(named: "back")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        navigationController?.navigationBar.backIndicatorImage = yourBackImage
        navigationController?.navigationBar.backItem?.title = ""
        navigationController?.navigationBar.topItem?.title = " "
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = yourBackImage
    }
}

enum StoryBoard: String {
    case Main
}


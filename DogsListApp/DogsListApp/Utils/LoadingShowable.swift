//
//  LoadingShowable.swift
//  DogsListApp
//
//  Created by Jyoti on 20/11/2022.
//

import Foundation
import UIKit

protocol LoadingShowable where Self: UIViewController {
    func showLoading()
    func hideLoading()
    func setupPositionOfProgressView(loadingIndicator : ProgressView)
}

extension LoadingShowable {
    func showLoading() {
        LoadingView.shared.startLoading()
    }

    func hideLoading() {
        LoadingView.shared.hideLoading()
    }
}

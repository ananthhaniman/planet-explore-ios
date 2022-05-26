//
//  UIView+LoaderView.swift
//  Planet Explore
//
//  Created by Ananthamoorthy Haniman on 2022-05-26.
//

import Foundation
import UIKit


extension UIView {
    
    func showLoader() {
        if let removable = self.viewWithTag(10){
           removable.removeFromSuperview()
        }
        let loaderView = LoaderView(frame: self.frame)
        loaderView.tag = 10
        self.addSubview(loaderView)
        self.bringSubviewToFront(loaderView)
    }
    
    func dismissLoader() {
        if let removable = self.viewWithTag(10){
           removable.removeFromSuperview()
        }
    }
    
    func showError(error: APIError) {
        if let removable = self.viewWithTag(15){
           removable.removeFromSuperview()
        }
        let errorView = ErrorView(frame: self.frame)
        errorView.tag = 15
        errorView.config(error: error)
        self.addSubview(errorView)
        self.bringSubviewToFront(errorView)
    }
    
    func dismissError() {
        if let removable = self.viewWithTag(15){
           removable.removeFromSuperview()
        }
    }
    
}

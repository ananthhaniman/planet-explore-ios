//
//  String+Capitalized.swift
//  Planet Explore
//
//  Created by Ananthamoorthy Haniman on 2022-05-26.
//

import Foundation


extension String{
    
    // source - https://stackoverflow.com/questions/9022164/how-to-make-first-letter-uppercase-in-a-uilabel
    func capitalizedFirst() -> String {
        let first = self[self.startIndex ..< self.index(startIndex, offsetBy: 1)]
        let rest = self[self.index(startIndex, offsetBy: 1) ..< self.endIndex]
        return first.uppercased() + rest.lowercased()
    }
    
}

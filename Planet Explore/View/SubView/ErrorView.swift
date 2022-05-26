//
//  ErrorView.swift
//  Planet Explore
//
//  Created by Ananthamoorthy Haniman on 2022-05-26.
//

import UIKit

class ErrorView:UIView {
    
    let contentStack:UIStackView = {
        let cs = UIStackView()
        cs.axis = .vertical
        cs.alignment = .center
        cs.spacing = 5
        cs.translatesAutoresizingMaskIntoConstraints = false
        return cs
    }()
    
    
    let errorImageView:UIImageView = {
        let eiv = UIImageView(image: UIImage(named: "Error")?.resized(to: CGSize(width: 70, height: 70)).withRenderingMode(.alwaysTemplate))
        eiv.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        eiv.contentMode = .scaleAspectFit
        eiv.tintColor = Constant.primaryTextColor
        eiv.clipsToBounds = true
        return eiv
    }()
    
    let contentTitle:UILabel = {
        let ct = UILabel()
        ct.font = .preferredFont(forTextStyle: .headline)
        ct.textColor = Constant.primaryTextColor
        return ct
    }()
    
    let contentDescription:UILabel = {
        let cd = UILabel()
        cd.font = .preferredFont(forTextStyle: .body)
        cd.textAlignment = .center
        cd.numberOfLines = 20
        cd.textColor = Constant.secounderyTextColor
        return cd
    }()
    
    // MARK: - assign error info based on Error Type
    func config(error:APIError){
        switch error {
        case .ServerError(let message):
            contentTitle.text = "Something not right"
            contentDescription.text = message
            errorImageView.image = UIImage(named: "Error")?.resized(to: CGSize(width: 70, height: 70)).withRenderingMode(.alwaysTemplate)
        }
        
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    private func setupUI(){
        contentStack.addArrangedSubview(errorImageView)
        contentStack.addArrangedSubview(contentTitle)
        contentStack.addArrangedSubview(contentDescription)
        
        self.addSubview(contentStack)
        
        let contentStackConstrains = [
            contentStack.widthAnchor.constraint(equalTo: self.widthAnchor,constant: -150),
            contentStack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            contentStack.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(contentStackConstrains)
        
    }
    
    
}

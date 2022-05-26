//
//  PlanetInfoItem.swift
//  Planet Explore
//
//  Created by Ananthamoorthy Haniman on 2022-05-26.
//

import UIKit

class PlanetInfoItem:UIView {
    
    private let title:UILabel = {
        let tl = UILabel()
        tl.numberOfLines = 3
        tl.font = .preferredFont(forTextStyle: .headline)
        tl.textColor = Constant.primaryColor
        return tl
    }()
    
    private let value:UILabel = {
        let val = UILabel()
        val.numberOfLines = 3
        val.font = .preferredFont(forTextStyle: .subheadline)
        val.textColor = Constant.primaryTextColor
        return val
    }()
    
    private let itemStack:UIStackView = {
        let its = UIStackView()
        its.axis = .vertical
        its.alignment = .top
        its.spacing = 7
        its.translatesAutoresizingMaskIntoConstraints = false
        return its
    }()
    
    private let iconView:UIImageView = {
        let iv = UIImageView(image: UIImage(named: "Orbit")?.withRenderingMode(.alwaysTemplate))
        iv.contentMode = .scaleAspectFit
        iv.tintColor = Constant.primaryTextColor
        return iv
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func config(title:String, value:String, icon:String) {
        self.title.text = title.capitalizedFirst()
        self.value.text = value.capitalizedFirst()
        self.iconView.image = UIImage(named: icon)?.resized(to: CGSize(width: 50, height: 50)).withRenderingMode(.alwaysTemplate)
    }
    
    
    private func setupUI(){
        self.backgroundColor = Constant.sectionColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        
        itemStack.addArrangedSubview(iconView)
        itemStack.addArrangedSubview(title)
        itemStack.addArrangedSubview(value)
        
        self.addSubview(itemStack)
        
        let itemStackConstrains = [
            itemStack.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10),
            itemStack.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
            itemStack.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: 10),
            itemStack.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -10)
        ]
        
        NSLayoutConstraint.activate(itemStackConstrains)
    }
    
    
}



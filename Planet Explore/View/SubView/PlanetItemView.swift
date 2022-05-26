//
//  PlanetItemView.swift
//  Planet Explore
//
//  Created by Ananthamoorthy Haniman on 2022-05-26.
//

import UIKit
import Alamofire

class PlanetItemView:UICollectionViewCell{
    
    
    static let indentifier = "planetCell"
    
    private let planetNameLabel:UILabel = {
        let pnl = UILabel()
        pnl.font = .preferredFont(forTextStyle: .headline)
        pnl.textColor = Constant.primaryTextColor
        return pnl
    }()
    
    private let climateLabel:UILabel = {
        let cl = UILabel()
        cl.font = .preferredFont(forTextStyle: .subheadline)
        cl.textColor = Constant.secounderyTextColor
        return cl
    }()
    
    
    private let contentStack:UIStackView = {
        let cs = UIStackView()
        cs.axis = .vertical
        cs.spacing = 0
        cs.distribution = .fillProportionally
        cs.alignment = .leading
        return cs
    }()
    
    private let mainStack:UIStackView = {
        let ms = UIStackView()
        ms.axis = .vertical
        ms.spacing = 10
        ms.distribution = .fillProportionally
        ms.alignment = .top
        ms.translatesAutoresizingMaskIntoConstraints = false
        return ms
    }()
    
    private let planetImageView:UIImageView = {
        let piv = UIImageView(image: UIImage(named: "PlaceHolder"))
        piv.contentMode = .scaleToFill
        piv.layer.cornerRadius = 10
        piv.clipsToBounds = true
        return piv
    }()
    
    private let imageURL:String = "https://picsum.photos/seed"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        applyConstrains()
        
    }
    
    
    func config(data:Planet){
        self.planetNameLabel.text = data.name.capitalizedFirst()
        self.climateLabel.text = data.climate.capitalizedFirst()
        self.planetImageView.image = UIImage(named: "PlaceHolder")
        self.loadImage()
    }
    
    
    private func setupUI(){
        mainStack.addArrangedSubview(planetImageView)
        mainStack.addArrangedSubview(contentStack)
        
        contentStack.addArrangedSubview(planetNameLabel)
        contentStack.addArrangedSubview(climateLabel)
        
        contentView.addSubview(mainStack)
    }
    
    private func applyConstrains(){
        let mainStackConstrains = [
            mainStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainStack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        
        let planetImageViewConstrains = [
            planetImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            planetImageView.heightAnchor.constraint(equalToConstant: 170)
        ]
        
        
        NSLayoutConstraint.activate(mainStackConstrains)
        NSLayoutConstraint.activate(planetImageViewConstrains)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Download & Load image from URL
    private func loadImage(){
        let randomSeed = Int.random(in: 1...1000)
        let randomImageURL = "\(imageURL)/\(randomSeed)/200"
        
        // I have used Alamofire to download image from URL,
        AF.request(randomImageURL,method: .get).response{ response in
            
            switch response.result {
            case .success(let responseData):
                // resize and assign planet image from downloaded image source
                self.planetImageView.image = UIImage(data: responseData!)
                
            case .failure(_):
                // assign placeholder image if image not loaded from URL
                self.planetImageView.image = UIImage(named: "PlaceHolder")
            }
            
        }
        
    }
    
    
}

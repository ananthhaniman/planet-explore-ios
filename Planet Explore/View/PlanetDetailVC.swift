//
//  PlanetDetailVC.swift
//  Planet Explore
//
//  Created by Ananthamoorthy Haniman on 2022-05-26.
//

import UIKit
import Alamofire

class PlanetDetailVC:UIViewController{
    
    private let mainStack:UIStackView = {
        let ms = UIStackView()
        ms.axis = .vertical
        ms.alignment = .fill
        ms.spacing = 15
        ms.translatesAutoresizingMaskIntoConstraints = false
        return ms
    }()
    
    private let rowStack1:UIStackView = {
        let rs = UIStackView()
        rs.axis = .horizontal
        rs.distribution = .fillEqually
        rs.spacing = 10
        return rs
    }()
    
    private let rowStack2:UIStackView = {
        let rs = UIStackView()
        rs.axis = .horizontal
        rs.distribution = .fillEqually
        rs.spacing = 10
        return rs
    }()
    
    private let gravityItem:PlanetInfoItem = PlanetInfoItem()
    private let climateItem:PlanetInfoItem = PlanetInfoItem()
    private let orbitalPeriodItem:PlanetInfoItem = PlanetInfoItem()
    

    private let scrollView:UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constant.backgroundColor

        setupUI()
        setupConstrains()
    }
    
    func config(planet:Planet){
        self.title = planet.name
        orbitalPeriodItem.config(title: "Orbital Period", value: planet.orbital_period,icon: "Orbit")
        climateItem.config(title: "Climate", value: planet.climate,icon: "Climate")
        gravityItem.config(title: "Gravity", value: planet.gravity,icon: "Gravity")
    }
    
    private func setupUI(){
        scrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height)
        self.view.addSubview(scrollView)
        
        
        rowStack1.addArrangedSubview(orbitalPeriodItem)
        rowStack1.addArrangedSubview(gravityItem)
        
        rowStack2.addArrangedSubview(climateItem)
        rowStack2.addArrangedSubview(UIView())
        
        mainStack.addArrangedSubview(rowStack1)
        mainStack.addArrangedSubview(rowStack2)
        
        scrollView.addSubview(mainStack)
        
    }
    
    
    
    
    private func setupConstrains(){
        let mainStackConstrains = [
            mainStack.widthAnchor.constraint(equalTo: scrollView.widthAnchor,constant: -40),
            mainStack.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            mainStack.topAnchor.constraint(equalTo: scrollView.topAnchor,constant: 15)
        ]
        
        let scrollViewConstrains = [
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 0),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(mainStackConstrains)
        NSLayoutConstraint.activate(scrollViewConstrains)
    }
    
    
    
}

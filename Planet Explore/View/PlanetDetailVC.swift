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
    
    private let infoStack:UIStackView = {
        let infoStack = UIStackView()
        infoStack.axis = .horizontal
        infoStack.alignment = .top
        infoStack.spacing = 15
        return infoStack
    }()
    
    private let infoContentStack:UIStackView = {
        let ics = UIStackView()
        ics.axis = .vertical
        ics.alignment = .top
        ics.spacing = 4
        return ics
    }()
    
    private let planetNameLabel:UILabel = {
        let pnl = UILabel()
        pnl.numberOfLines = 3
        pnl.font = .systemFont(ofSize: 28, weight: .semibold)
        pnl.textColor = Constant.primaryTextColor
        return pnl
    }()
    
    private let orbitalPeriodLabel:UILabel = {
        let opl = UILabel()
        opl.font = .preferredFont(forTextStyle: .subheadline)
        opl.textColor = Constant.secounderyTextColor
        return opl
    }()
    
    private let gravityLabel:UILabel = {
        let gl = UILabel()
        gl.font = .systemFont(ofSize: 16, weight: .semibold)
        gl.textColor = Constant.primaryColor
        return gl
    }()
    
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
        planetNameLabel.text = planet.name
        orbitalPeriodLabel.text = planet.orbital_period
        gravityLabel.text = planet.gravity
        
        
    }
    
    private func setupUI(){
        scrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height)
        self.view.addSubview(scrollView)
        
        scrollView.addSubview(mainStack)
        infoStack.addArrangedSubview(infoContentStack)
        
        infoContentStack.addArrangedSubview(planetNameLabel)
        infoContentStack.addArrangedSubview(orbitalPeriodLabel)
        infoContentStack.addArrangedSubview(gravityLabel)
        
        mainStack.addArrangedSubview(infoStack)
        
    }
    
    private func setupConstrains(){
        let mainStackConstrains = [
            mainStack.widthAnchor.constraint(equalTo: scrollView.widthAnchor,constant: -40),
            mainStack.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
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

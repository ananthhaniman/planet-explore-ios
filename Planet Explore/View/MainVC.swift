//
//  ViewController.swift
//  Planet Explore
//
//  Created by Ananthamoorthy Haniman on 2022-05-26.
//

import UIKit
import RxSwift
import RxCocoa

class MainVC: UIViewController {
    
    private var collectionView:UICollectionView?
    
    private let viewModel:PlanetViewModel = PlanetViewModel(
        service: PlanetRemoteService()
    )
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
        
        viewModel.getPlanets()
    }
    
    // MARK: - Handle & Receive Observable events
    private func setupBindings(){
        /// subscribe and receive planets items and bind it on collection view
        viewModel.planets
            .observe(on: MainScheduler.instance)
            .bind(to: collectionView!.rx.items(cellIdentifier: PlanetItemView.indentifier, cellType: PlanetItemView.self)){ row,data, cell in
                cell.config(data: data)
                self.view.dismissError()
            }
            .disposed(by: disposeBag)
        
        viewModel.isLoading /// receive when loading event emits
            .observe(on: MainScheduler.instance)
            .subscribe(onNext:{ status in
                if status {
                    self.view.showLoader()
                }else{
                    self.view.dismissLoader()
                }
                
            })
            .disposed(by: disposeBag)
        
        viewModel.error /// receive when error event emits
            .observe(on: MainScheduler.instance)
            .subscribe(onNext:{ error in
                self.view.showError(error: error)
            })
            .disposed(by: disposeBag)
        
        /// handle collection view model item selection
        collectionView?
            .rx
            .modelSelected(Planet.self)
            .subscribe(onNext: { (model) in
                // navigate to details view
                let planetDetailVC = PlanetDetailVC()
                planetDetailVC.config(planet: model)
                self.navigationController?.pushViewController(planetDetailVC, animated: true)
                
            }).disposed(by: disposeBag)
        
    }
    
    // MARK: - Declare & Add Subviews
    private func setupUI(){
        
        self.title = "Planet Explore"
        self.view.backgroundColor = Constant.backgroundColor
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        }
        
        
        // declare collection view layout type and config sizes of layout items.
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .vertical
        collectionViewLayout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        collectionViewLayout.itemSize = CGSize(width: view.frame.size.width / 2.4, height: 240)
        
        self.collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: collectionViewLayout)
        self.collectionView?.register(PlanetItemView.self, forCellWithReuseIdentifier: PlanetItemView.indentifier)
        self.collectionView?.backgroundColor = Constant.backgroundColor
        self.view.addSubview(collectionView!)
        
    }
    
    
    
}


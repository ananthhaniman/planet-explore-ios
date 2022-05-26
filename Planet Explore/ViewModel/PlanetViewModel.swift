//
//  PlanetViewModel.swift
//  Planet Explore
//
//  Created by Ananthamoorthy Haniman on 2022-05-26.
//

import Foundation
import RxSwift
import RxCocoa

struct PlanetViewModel{
    
    private var planetService:PlanetRemoteService?
    
    /// I have declare observable variables, the type of observer is `PublishSubject`.
    /// The aim to use this is to  Starts with empty value and only emit new elements to subscribers
    let planets:PublishSubject<[Planet]> = PublishSubject()
    let isLoading:PublishSubject<Bool> = PublishSubject()
    let error:PublishSubject<APIError> = PublishSubject()
    
    // MARK: - PlanetViewModels receives as the initializers input an instance of an object that implements the PlanetRemoteService and defines the API requests
    init(service:PlanetRemoteService) {
        self.planetService = service
    }
    
    // MARK: - Get all planets using service.
    ///  when `getPlanets()` the  function got triggered first it will emit a 'isloading' function with the value of true, later through the API Service request it retrieves the result, and if it the response is success it will emit planets datas else it got failure to emit error event with errors
    func getPlanets(){
        isLoading.onNext(true)
        planetService?.getPlanets(completion: { (result) in
            isLoading.onNext(false)
            switch result{
            case let .success(data):
                planets.onNext(data)
            case let .failure(apiError):
                error.onNext(apiError)
            }
        })
        
    }
    
}

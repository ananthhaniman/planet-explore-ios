//
//  PlanetRemoteService.swift
//  Planet Explore
//
//  Created by Ananthamoorthy Haniman on 2022-05-26.
//

import Foundation
import Alamofire

// Alamofire - I have used Alamofire for the clean code and easy network request handling. for all the API requests (POST/GET/PUT) will be easier and an understandable manner. Optimise common networks task for easy implementation and execption handling.



struct PlanetAPIResult:Codable{
    let results:[Planet]
}

class PlanetRemoteService{
    
    private let baseURL = "https://swapi.dev/api"
    
    // MARK: API request call method for a get list of planets. This method will return planet list or API error as Response
    /// `completion` - implemented completion handler for API call. it will pass the evaluation as success or failure.
    /// To handle errors and result this method is the best way.
    func getPlanets(completion: @escaping (Result<[Planet],APIError>) -> Void){
        let requestURL = "\(baseURL)/planets"
        let request = AF.request(requestURL).validate()
        
        request.responseDecodable(of:PlanetAPIResult.self) { (response) in
            
            switch response.result {
            case  .success:
                if let result = response.value {
                    completion(.success(result.results))
                }else{
                    completion(.failure(APIError.ServerError(message: "Unable to retrive plant datas from response")))
                }
            case let .failure(error):
                completion(.failure(APIError.ServerError(message: error.localizedDescription)))
            }
            
        }
    }
    
    
}

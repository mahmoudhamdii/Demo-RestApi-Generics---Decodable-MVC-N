//
//  PostsAPIService.swift
//  Demo (Generics - Decodable)
//
//  Created by hamdi on 04/05/2023.
//

import Foundation
import Alamofire
class APIService {
    //singlton
    static let shared = APIService()

    func getData<T:Decodable> (url:String,complition : @escaping(T?,Error?)->Void){
        AF.request(url).responseJSON { response in
            guard let data = response.data else{return}
            switch response.result
            {
                
            case .success(_):
                do {
                    let posts = try JSONDecoder().decode(T.self,from: data)
                    complition(posts,nil)
                }catch let error {
                    complition(nil,error)
                }
                 
                
            case .failure(let error):
                complition(nil,error)
            }
        }
        
    }
}

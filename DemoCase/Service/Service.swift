//
//  Service.swift
//  DemoCase
//
//  Created by Furkan on 11.03.2023.
//

import Foundation
import Alamofire

class Service {
    func fetchData(callback : @escaping (Response) -> Void) {
        AF.request("https://itunes.apple.com/search?term=jack+johnson", method: .get, encoding: JSONEncoding.default).response { response in
            guard let data = response.data else {return}
            do {
                let response = try JSONDecoder().decode(Response.self, from: data)
                callback(response)
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
}


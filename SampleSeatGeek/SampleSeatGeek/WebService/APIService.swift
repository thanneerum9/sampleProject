//
//  APIService.swift
//  SampleSeatGeek
//
//  Created by Mallesh Thanneeru on 16/04/21.
//

import Foundation

class APIService :  NSObject {
    
    func apiToGetEventsDataWith(queryStr: String, completion : @escaping (EventsModel) -> ()){
        
        URLSession.shared.dataTask(with: URL(string: "https://api.seatgeek.com/2/events?client_id=MjE3MzMxODZ8MTYxODU0ODA3MS42NTA4NTI0&q=\(queryStr)")!) { (data, urlResponse, error) in
            if let data = data {
                
                let jsonDecoder = JSONDecoder()
                
                let empData = try! jsonDecoder.decode(EventsModel.self, from: data)
            
                    completion(empData)
            }
            
        }.resume()
    }
    
}

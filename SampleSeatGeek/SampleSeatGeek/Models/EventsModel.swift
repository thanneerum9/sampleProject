//
//  EventsModel.swift
//  SampleSeatGeek
//
//  Created by Mallesh Thanneeru on 16/04/21.
//

import Foundation
struct EventsModel : Codable {
    let events : [Events]?
    
    enum CodingKeys: String, CodingKey {
        case events = "events"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        events = try values.decodeIfPresent([Events].self, forKey: .events)
        
    }
    
}

struct Venue : Codable {
    
    let display_location : String?
    
    enum CodingKeys: String, CodingKey {
        case display_location = "display_location"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        display_location = try values.decodeIfPresent(String.self, forKey: .display_location)
    }
    
}


struct Performers : Codable {
    
    let image : String?
    
    enum CodingKeys: String, CodingKey {
        case image = "image"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        image = try values.decodeIfPresent(String.self, forKey: .image)
    }
    
}


struct Events : Codable {
    let type : String?
    let id : Int?
    let datetime_utc : String?
    let venue : Venue?
    let datetime_tbd : Bool?
    let performers : [Performers]?
    let title : String?
    let createdat: String?
    
    enum CodingKeys: String, CodingKey {
        
        case type = "type"
        case id = "id"
        case datetime_utc = "datetime_utc"
        case venue = "venue"
        case datetime_tbd = "datetime_tbd"
        case performers = "performers"
        case title = "title"
        case createdat = "created_at"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        datetime_utc = try values.decodeIfPresent(String.self, forKey: .datetime_utc)
        venue = try values.decodeIfPresent(Venue.self, forKey: .venue)
        datetime_tbd = try values.decodeIfPresent(Bool.self, forKey: .datetime_tbd)
        performers = try values.decodeIfPresent([Performers].self, forKey: .performers)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        createdat = try values.decodeIfPresent(String.self, forKey: .createdat)
    }
    
}




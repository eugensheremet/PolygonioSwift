//
//  Markets.swift
//
//
//  Created by Antoni Remeseiro Alfonso on 9/11/20.
//

import Foundation

public struct DailyOpenCloseRequest : ApiRequest {
    typealias Response = DailyOpenCloseResponse
    
    var symbol: String
    var date: String
    
    var path: String {
        return "/v1/open-close/\(symbol)/\(date)"
    }
    
    var queryItems: [URLQueryItem] {
        return []
    }
}

public struct DailyOpenCloseResponse : Decodable {
    
    public var status: String
    public var from: String
    public var symbol: String
    public var open: Double
    public var high: Double
    public var low: Double
    public var close: Double
    public var volume: Int
    public var afterHours: Double
    public var preMarket: Double
    
    private enum CodingKeys: String, CodingKey {
        case status = "status"
        case from = "from"
        case symbol = "symbol"
        case open = "open"
        case high = "high"
        case low = "low"
        case close = "close"
        case volume = "volume"
        case afterHours = "afterHours"
        case preMarket = "preMarket"
    }
}

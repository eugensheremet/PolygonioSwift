//
//  Ticker.swift
//
//
//  Created by Antoni Remeseiro Alfonso on 9/9/20.
//

import Foundation

public struct PreviousCloseRequest : ApiRequest {
    typealias Response = PreviousCloseResponse
    
    let symbol: String
    let unadjusted: Bool // default is false
    
    var path: String {
        return "/v2/aggs/ticker/\(symbol)/prev"
    }
    
    var queryItems: [URLQueryItem] {
        return [ URLQueryItem(name: "unadjusted", value: unadjusted.description) ]
    }
}

public struct PreviousCloseResponse : Decodable {
    
    public var ticker: String
    public var status: String
    public var queryCount: Int
    public var resultsCount: Int
    public var adjusted: Bool
    public var results: [Candle]
    

    private enum CodingKeys: String, CodingKey {
        case ticker = "ticker"
        case status = "status"
        case queryCount = "queryCount"
        case resultsCount = "resultsCount"
        case adjusted = "adjusted"
        case results = "results"
    }
    
    public struct Candle : Codable {
        public var ticker: String
        public var volume: Int
        public var volumeWeighted: Double
        public var open: Double
        public var close: Double
        public var high: Double
        public var low: Double
        public var timestamp: Int
        
        private enum CodingKeys: String, CodingKey {
            case ticker = "T"
            case volume = "v"
            case volumeWeighted = "vw"
            case open = "o"
            case close = "c"
            case high = "h"
            case low = "l"
            case timestamp = "t"
        }
    }
        
}

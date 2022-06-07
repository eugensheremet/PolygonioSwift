//
//  AllTickersSnapshot.swift
//
//
//  Created by Antoni Remeseiro Alfonso on 9/16/20.
//

import Foundation

public struct AllTickersSnapshotRequest : ApiRequest {
    typealias Response = AllTickersSnapshotResponse
    
    var path: String {
        return "/v2/snapshot/locale/us/markets/stocks/tickers"
    }
    
    var queryItems: [URLQueryItem] {
        return []
    }
}

public struct AllTickersSnapshotResponse : Decodable {
    
    public var count: Int
    public var status: String
    public var tickers: [Ticker]
   
    private enum CodingKeys: String, CodingKey {
        case count = "count"
        case status = "status"
        case tickers = "tickers"
    }
    
    // The ticker snapshot info
    public struct Ticker : Codable {
        public var day: dayOCHL
        public var lastQuote: lastQuote
        public var lastTrade: lastTrade
        public var min: minuteOCHL
        public var prevDay: dayOCHL
        public var ticker: String
        public var todaysChange: Double
        public var todaysChangePerc: Double
        public var updated: Int
        
        private enum CodingKeys: String, CodingKey {
            case day = "day"
            case lastQuote = "lastQuote"
            case lastTrade = "lastTrade"
            case min = "min"
            case prevDay = "prevDay"
            case ticker = "ticker"
            case todaysChange = "todaysChange"
            case todaysChangePerc = "todaysChangePerc"
            case updated = "updated"
        }
    }
    
    public struct dayOCHL : Codable {
        public var volume: Int
        public var VWAP: Double //VWAP (Volume Weighted Average Price)
        public var open: Double
        public var close: Double
        public var high: Double
        public var low: Double

        private enum CodingKeys: String, CodingKey {
            case volume = "v"
            case VWAP = "vw"
            case open = "o"
            case close = "c"
            case high = "h"
            case low = "l"
        }
    }
    
    public struct lastQuote : Codable {
        public var askPrice: Double
        public var askSize: Int
        public var bidPrice: Double
        public var bidSize: Int
        public var timestamp: Int

        private enum CodingKeys: String, CodingKey {
            case askPrice = "P"
            case askSize = "S"
            case bidPrice = "p"
            case bidSize = "s"
            case timestamp = "t"
        }
    }
    
    public struct lastTrade : Codable {
        public var conditions: [Int]?
        public var tradeId: String
        public var price: Double
        public var size: Int
        public var timestamp: Int
        public var exchangeId: Int

        private enum CodingKeys: String, CodingKey {
            case conditions = "c"
            case tradeId = "i"
            case price = "p"
            case size = "s"
            case timestamp = "t"
            case exchangeId = "x"
        }
    }
    
    public struct minuteOCHL : Codable {
        public var accumulatedVolume: Int
        public var volume: Int
        public var VWAP: Double //VWAP (Volume Weighted Average Price)
        public var open: Double
        public var close: Double
        public var high: Double
        public var low: Double

        private enum CodingKeys: String, CodingKey {
            case accumulatedVolume = "av"
            case volume = "v"
            case VWAP = "vw"
            case open = "o"
            case close = "c"
            case high = "h"
            case low = "l"
        }
    }
}

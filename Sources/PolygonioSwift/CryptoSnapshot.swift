//
//  CryptoSnapshot.swift
//  
//
//  Created by Yevhenii Sheremet on 07.06.2022.
//

import Foundation

public struct CryptoSnapshotRequest : ApiRequest {
	typealias Response = CryptoSnapshotResponse

	var symbol: String

	var path: String {
		return "/v2/snapshot/locale/global/markets/crypto/tickers/\(symbol)"
	}

	var queryItems: [URLQueryItem] {
		return []
	}
}

public struct CryptoSnapshotResponse : Decodable {

	public var status: String
	public var requestId: String
	public var ticker: Ticker

	private enum CodingKeys: String, CodingKey {
		case status = "status"
		case ticker = "ticker"
		case requestId = "request_id"
	}

	// The ticker snapshot info
	public struct Ticker : Codable {
		public var day: dayOCHL
		public var min: minuteOCHL
		public var prevDay: dayOCHL
		public var ticker: String
		public var todaysChange: Decimal
		public var todaysChangePerc: Decimal
		public var updated: Int

		private enum CodingKeys: String, CodingKey {
			case day = "day"
			case min = "min"
			case prevDay = "prevDay"
			case ticker = "ticker"
			case todaysChange = "todaysChange"
			case todaysChangePerc = "todaysChangePerc"
			case updated = "updated"
		}
	}

	public struct dayOCHL : Codable {
		public var volume: Decimal
		public var VWAP: Decimal //VWAP (Volume Weighted Average Price)
		public var open: Decimal
		public var close: Decimal
		public var high: Decimal
		public var low: Decimal

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
		public var askPrice: Decimal
		public var askSize: Int
		public var bidPrice: Decimal
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

	public struct minuteOCHL : Codable {
		public var volume: Decimal
		public var VWAP: Decimal //VWAP (Volume Weighted Average Price)
		public var open: Decimal
		public var close: Decimal
		public var high: Decimal
		public var low: Decimal

		private enum CodingKeys: String, CodingKey {
			case volume = "v"
			case VWAP = "vw"
			case open = "o"
			case close = "c"
			case high = "h"
			case low = "l"
		}
	}
}

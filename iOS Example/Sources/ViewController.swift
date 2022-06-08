//
//  ViewController.swift
//  iOS Example
//
//  Created by Antoni Remeseiro Alfonso on 9/9/20.
//

import UIKit
import PolygonioSwift

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()

		let polygon = PolygonioSwift.Client(key: "9_b12z8RtjZaVuGbsjKgUyPH3dGtJv9_")
		polygon.setDebug(enable: true)

		polygon.aggregates(ticker: "X:SHIBUSD", multiplier: 1, timespan: .day, from: "2021-07-22", to: "2022-05-22") { (result:AggregatesResponse?, err) in
			// check if we got any errors
			if let err = err {
				print(err)
			} else {
				print(result)
			}
		}

		polygon.cryptoSnapshot(symbol: "X:SHIBUSD") { response, error in
			// check if we got any errors
			if let err = error {
				print(err)
			} else {
				print(response)
			}
		}
	}
}

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

		let polygon = PolygonioSwift.Client(key: "l5PkSoz69UG1UT_x1vuugm0EmJJdzReF")
		polygon.setDebug(enable: true)

		polygon.aggregates(ticker: "X:BTCUSD", multiplier: 1, timespan: .day, from: "2021-07-22", to: "2021-08-22") { (result:AggregatesResponse?, err) in
			// check if we got any errors
			if let err = err {
				print(err)
			} else {
				print(result)
				print(result?.results)
			}
		}
	}
}

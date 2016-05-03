//
//  corporate_quote.swift
//  Mechanic - Prototype
//
//  Created by Reza Shirazian on 2016-05-02.
//  Copyright © 2016 Reza Shirazian. All rights reserved.
//

import Foundation


class CorporateQuote {
  var services: [Service]
  var price: Double
  var parts: [Part]
  var numberOfCars: Int
  var startTime: NSDate?
  var mechanics: [Mechanic]
  var client: String?
  var address: String?

  init(services: [Service],
      price: Double,
      parts: [Part],
      numberOfCars: Int,
      mechanics: [Mechanic]) {

        self.services = services
        self.price = price
        self.parts = parts
        self.numberOfCars = numberOfCars
        self.mechanics = mechanics

  }
  
  func clone() -> CorporateQuote {
    return CorporateQuote(services: self.services,
                          price: self.price,
                          parts: self.parts,
                          numberOfCars: self.numberOfCars,
                          mechanics: self.mechanics)
  }
}

//
//  part.swift
//  Mechanic - Prototype
//
//  Created by Reza Shirazian on 2016-05-02.
//  Copyright © 2016 Reza Shirazian. All rights reserved.
//

import Foundation

class Part {
  var name: String
  var price: Double
  var brand: String

  init(name: String, price: Double, brand: String) {
    self.name = name
    self.price = price
    self.brand = brand
  }
}

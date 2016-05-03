//
//  mechanic.swift
//  Mechanic - Builder
//
//  Created by Reza Shirazian on 2016-04-30.
//  Copyright © 2016 Reza Shirazian. All rights reserved.
//

import Foundation

struct Mechanic {
  static var id: Int = 0
  var id: Int
  var name: String

  init(name: String) {
    self.name = name
    Mechanic.id += 1
    self.id = Mechanic.id
  }
}

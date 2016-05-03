//
//  service.swift
//  Mechanic - Prototype
//
//  Created by Reza Shirazian on 2016-05-02.
//  Copyright © 2016 Reza Shirazian. All rights reserved.
//

import Foundation

class Service {
  var name: String
  var laborDurationInMinutes: Int

  init(name: String, laborDurationInMinutes: Int ) {
    self.name = name
    self.laborDurationInMinutes = laborDurationInMinutes
  }
}

//
//  main.swift
//  Mechanic - Prototype
//
//  Created by Reza Shirazian on 2016-05-02.
//  Copyright © 2016 Reza Shirazian. All rights reserved.
//

import Foundation



var steve = Mechanic (name: "Steve Brimington")
var mike = Mechanic(name: "Mike Fulton")
var ali = Mechanic (name: "Ali Belevue")

var corporateMechanics = [steve, mike, ali]

var brakePadReplacement = Service(name: "Brake Pad Replacement", laborDurationInMinutes: 100)
var oilChange = Service(name: "Oil Change", laborDurationInMinutes: 65)
var rotateTires = Service(name: "Roate Tires", laborDurationInMinutes: 45)

var corporateService = [brakePadReplacement, oilChange, rotateTires]

var parts = [Part(name: "Brake Pads Front", price: 25.65, brand: "ACME Pads"),
            Part(name: "Filter", price: 8.99, brand: "ACME Pads"),
            Part(name: "Synthetic Oil", price: 15.19, brand: "ACME Pads"),
            Part(name: "Brake Pads Rear", price: 32.65, brand: "ACME Pads"),
            Part(name: "Air Freshners", price: 3.65, brand: "ACME Pads")]

var prototypedQuote = CorporateQuote(services: corporateService,
                                     price: 1488.99,
                                     parts: parts,
                                     numberOfCars: 20,
                                     mechanics: corporateMechanics)


var googleQuote = prototypedQuote.clone()
googleQuote.client = "Google"
googleQuote.startTime = NSDate.generateDateFromArray([2016, 5, 12, 14, 30, 00])
googleQuote.address = "1600 Amphitheatre Pkwy"


var facebookQuote = prototypedQuote.clone()
facebookQuote.client = "Facebook"
facebookQuote.startTime =  NSDate.generateDateFromArray([2016, 5, 13, 9, 30, 00])
facebookQuote.address = "1 Hacker Way, Menlo Park"

var microsoftQuote = prototypedQuote.clone()
microsoftQuote.client = "Microsoft"
microsoftQuote.startTime = NSDate.generateDateFromArray([2016, 5, 15, 11, 50, 00])
microsoftQuote.address = "1085 La Avenida St"
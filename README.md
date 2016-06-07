<h1>Design Patterns in Swift: Prototype</h1>
This repository is part of a series. For the full list check out <a href="https://shirazian.wordpress.com/2016/04/11/design-patterns-in-swift/">Design Patterns in Swift</a>

For a cheat-sheet of design patterns implemented in Swift check out <a href="https://github.com/ochococo/Design-Patterns-In-Swift"> Design Patterns implemented in Swift: A cheat-sheet</a>

<h3>The problem:</h3>
Beside having qualified mechanics fix your car at home or your office, <a href="http://www.yourmechanic.com">YourMechanic</a> has several contracts with various businesses. The appointment for these jobs for the most part follows the same configuration (same mechanics, same set of services, same parts, same number of cars and price). What's different is the name of the client, the address and the start time. Building a corporate appointment over and over again with the same configuration is time consuming and heavy on our servers. We would like a solution where the same appointment type can be re-created without having to look up our mechanic directory, parts directory or service directory.
<h3>The solution:</h3>
We will solve this problem by creating a prototype of our corporate appointment object (for the sake of consistency between all our previous articles we will call this corporate quote). This prototype will have all its heavy configuration pre-set. This way, every time we need to create a specific corporate quote we simply clone our prototype and set its client name, address and start time. This way, once we build an appointment with the same set of mechanics, services, parts etc we can clone the quote for different clients instead of rebuilding it from the ground up.

<!--more-->

Link to the repo for the completed project: <a href="https://github.com/kingreza/Swift-Prototype">Swift - Prototype</a>

Before we get to our corporate quote object let's quickly go over our parts, services and mechanics object. These items will be the building block of our corporate quote so it makes sense to quickly get a feel for what they do.

```Swift

struct Part {
  var name: String
  var price: Double
  var brand: String

  init(name: String, price: Double, brand: String) {
    self.name = name
    self.price = price
    self.brand = brand
  }
}

struct Service {
  var name: String
  var laborDurationInMinutes: Int

  init(name: String, laborDurationInMinutes: Int ) {
    self.name = name
    self.laborDurationInMinutes = laborDurationInMinutes
  }
}

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

```

Our part object is a simple struct with a name, price and brand that we set during its initialization. Same pattern follows for our service object, we have a name and labor duration in minute which are two properties we set during our service initialization. Same for Mechanic, a simple struct with a unique, auto incrementing id and name.

Now let's look at our corporate quote object:

```Swift
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
```

Our corporate quote object has a set of services, a price, a set of parts, number of cars which will be serviced, a start time, a set of mechanics, the client's name and address as its properties. We set these items in its initializer.

Here is where things get interesting. We define a clone function which returns a CorporateQuote of same type, passing the same properties. It literally creates a clone of the current CorporateQuote. But how does this help us? How does it make it easier or more efficient?

Let's look at how we would use this.

```Swift
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
```

Let assume these are our corporate mechanics, corporate services and corporate parts. Making this list was easy for us since this is a mock example but imagine if creating corporateMechanics or corporateService was expensive and time consuming, wouldn't you rather do it once as opposed to multiple times?

Lets use the 'expensive' we just generated to create a prototype corporateQuote

```Swift
var prototypedCorporeateQuote = CorporateQuote(services: corporateService,
                                     price: 1488.99,
                                     parts: corporateParts,
                                     numberOfCars: 20,
                                     mechanics: corporateMechanics)
```

Now that we have our prototype we can use its clone functionality to spawn other corporate quotes with the same configuration. They will have the same mechanics, services, parts, number of cars and price. All without having to create any of these values again.

```Swift
var googleQuote = prototypedCorporeateQuote.clone()
googleQuote.client = "Google"
googleQuote.startTime = NSDate.generateDateFromArray([2016, 5, 12, 14, 30, 00])
googleQuote.address = "1600 Amphitheatre Pkwy, Mountain View"


var facebookQuote = prototypedCorporeateQuote.clone()
facebookQuote.client = "Facebook"
facebookQuote.startTime =  NSDate.generateDateFromArray([2016, 5, 13, 9, 30, 00])
facebookQuote.address = "1 Hacker Way, Menlo Park"

var microsoftQuote = prototypedCorporeateQuote.clone()
microsoftQuote.client = "Microsoft"
microsoftQuote.startTime = NSDate.generateDateFromArray([2016, 5, 15, 11, 50, 00])
microsoftQuote.address = "1085 La Avenida St, Mountain View"
```

We simply call the clone object, get an instance of a corporateQuote with all the complicated and expensive configuration pre-set. We then modify each corporate quote with the details specific to that client.

Congratulations you have just implemented the Prototype Design Pattern to solve a nontrivial problem.

The repo for the complete project can be found here: <a href="https://github.com/kingreza/Swift-Prototype">Swift - Prototype.</a>

Download a copy of it and play around with it. See if you can find ways to improve its design, Add more complex functionalities. Here are some suggestions on how to expand or improve on the project:
<ul>
  <li>Serialize and save our prototype so we can create it cheap whenever and wherever we need it</li>
  <li>What are some problems you can think of that could arise with the prototype design pattern?</li>
</ul>

import UIKit

var greeting = "Hello, playground"

//Protocols

//****** Example ******

protocol FullyNamed {
    var fullName: String { get }
}

struct Person: FullyNamed {
    var fullName: String
    var age: Int
    var phoneNumber: Int
}

class Company: FullyNamed {
    var fullName: String
    var director: String = "Tim Cook"
    
    init(prefix: String, title: String) {
        self.fullName = "\(prefix) \(title)"
    }
}

let jarl = Person(fullName: "Jarl", age: 35, phoneNumber: +48777777777)
let vika = Person(fullName: "Viktoria", age: 27, phoneNumber: +48888888888)
let apple = Company(prefix: "LLC", title: "Apple")
let alphabet = Company(prefix: "LLC", title: "Alphabet")

class Bank: Company {
    var clients = [FullyNamed]()
}

let bank = Bank(prefix: "Zoo", title: "Santander")

bank.clients.append(jarl)
bank.clients.append(vika)
bank.clients.append(apple)
bank.clients.append(alphabet)
alphabet.director = "i don't know"

for client in bank.clients {
    print(client.fullName)
    
    if client is Person {
        print((client as! Person).phoneNumber)
    } else if client is Company {
        print((client as! Company).director)
    }
}

//****** New example ******

enum Major {
    case iOS, android, python, java, dotNet
}

protocol Human {
    var name: String { get }
}

protocol Developer {
    var major: Major { get }
    var expInYears: Int { get }
}

protocol Teacher {
    var major: Major { get }
    func teach(theme: String)
}

struct DevTeacher: Human, Developer, Teacher {
    var name: String
    var major: Major
    var expInYears: Int
    
    func teach(theme: String) {
        print("Teach peoples. Theme of lesson: \(theme)")
    }
}

let jarlStarling = DevTeacher(name: "Jarl", major: .iOS, expInYears: 2)
jarlStarling.name
jarlStarling.teach(theme: "Protocols")

//***** New Example ******

protocol Named {
    var title: String { get }
}

protocol Location {
    var lat: Double { get }
    var lon: Double { get }
}

struct City: Location, Named {
    var lat: Double
    var lon: Double
    var title: String
}

struct Club: Location, Named {
    var lat: Double
    var lon: Double
    var title: String
}

struct Brend: Named {
    var title: String
}

func concert(place: Location & Named, band: String) {
    print("Band \(band) take a concert in \(place.title). Coordinates for GPS: \(place.lat), \(place.lon)")
}

let london = City(lat: 44.444444, lon: 55.555555, title: "London")
let topClub = Club(lat: 66.666666, lon: 77.777777, title: "Top Club")
let brend = Brend(title: "Apple")

concert(place: london, band: "Imagine Dragons")
concert(place: topClub, band: "Prodigy")

//***** Pattern Delegate *****
//
// Delegator
// Type of delegate - protocol with properties & methods
// Delegate

//***** Example *****

protocol CoffeeMakerDelegate {
    func makeCoffee(amount: Int) -> Int
}

class Client {
    var name = "Jarl"
    var coffeeMaker: CoffeeMakerDelegate? //Abstraction
    
    func visitCoffeeHouse(coffeeMaker: CoffeeMakerDelegate) {
        self.coffeeMaker = coffeeMaker
    }
    
    func goOutCoffeeHouse() {
        self.coffeeMaker = nil
        }
    
    func buyCoffee(amount: Int) {
        guard let delegate = coffeeMaker else {
            print("You are not in cafe")
            return
        }
        
        let count = delegate.makeCoffee(amount: amount)
        print("You buy \(count) cups of cofee")
        
    }
}
struct Server: CoffeeMakerDelegate {
    func makeCoffee(amount: Int) -> Int {
        let price = 3
        let count = amount / price
        return count
    }
}

struct Barista: CoffeeMakerDelegate {
    func makeCoffee(amount: Int) -> Int {
        let price = 4
        let count = amount / price
        return count
    }
}

let server = Server()
let client = Client()

client.visitCoffeeHouse(coffeeMaker: server)
client.buyCoffee(amount: 30)
client.goOutCoffeeHouse()

let barista = Barista()

client.visitCoffeeHouse(coffeeMaker: barista)
client.buyCoffee(amount: 20)
client.goOutCoffeeHouse()

client.buyCoffee(amount: 100)

import UIKit

var greeting = "Hello, playground"

//Generics
// Equatable - equale/ not eqale
// Compareble - < > <= >= == !=
// CustomStringConvertible
// Numeric
//func addInts(a: Int, b: Int) -> Int {
//    return a + b
//}
//
//func addDoubles(a: Double, b: Double) -> Double {
//    return a + b
//}

func add<Z: Numeric>(a: Z, b: Z) -> Z {
    return a + b
}

add(a: 56, b: 65.3)

protocol Storage {
    associatedtype Item
    func store(item: Item)
    func retrive(index: Int) -> Item?
}

struct Weapon {
    let charachters: String
    let looks: String
}

class WeaponCase: Storage {
        
    typealias Item = Weapon
    
    var weapons = [Weapon]()
    
    func store(item: Weapon) {
        weapons.append(item)
    }
    
    func retrive(index: Int) -> Weapon? {
        guard index < weapons.count else {
            return nil
        }
        
        return weapons[index]
    }
   
}

class Case<Item>: Storage {
    
    var items = [Item]()
    
    func store(item: Item) {
        items.append(item)
    }

    func retrive(index: Int) -> Item? {
        guard index < items.count else {
            return nil
        }
        
        return items[index]
    }

}

struct Armors {
    let name: String
    let classOfHero: String
    let price: Int
}

let chest = Armors(name: "Dragon chest", classOfHero: "Warrior", price: 100)
let boots = Armors(name: "Carmian boots", classOfHero: "Mage", price: 75)

let bagOfHero = Case<Armors>()

bagOfHero.store(item: chest)
bagOfHero.store(item: boots)
bagOfHero.items.count
bagOfHero.items.last?.price


//Stack

//***** "API"
//Container massive of writes
//push - get in stack
//pop - get out last element of stack
//isEmpty - is the stack empty
//size - size of stack
//top - upper element of stack

struct Stack<J> {
    
    private var container = [J]()
    
    var isEmpty: Bool {
        return self.container.isEmpty
    }
    
    var size: Int {
        return self.container.count
    }
    
    var top: J? {
        return self.container.last
    }
    
    mutating func push(_ element: J) {
        self.container.append(element)
    }
    
    mutating func pop() -> J? {
        if !self.isEmpty {
            return container.removeLast()
        } else {
            return nil
        }
    }
}

var stack = Stack<String>()

stack.push("Anna Karenina")
stack.push("Swift")
stack.push("Grock Algorithms")

stack.size
stack.top
stack.pop()
stack.top
stack.size
stack.pop()
stack.pop()
stack.size
stack.isEmpty

//let array = Array<String>() == var stack = Stack<String>()

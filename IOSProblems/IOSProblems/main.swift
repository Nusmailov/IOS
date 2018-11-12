

/*
import Foundation

var interestingNumbers = ["primes": [2, 3, 5, 7, 11, 13, 17],
                          "triangular": [1, 3, 6, 10, 15, 21, 28],
                          "hexagonal": [1, 6, 15, 28, 45, 66, 91]
]

for key in interestingNumbers.keys {
    interestingNumbers[key]?.sort(by: <)
}


print(interestingNumbers["primes"]!)
*/


/*
let ind = [75,43,73,7434]
var sum = 0
for score in ind{
    if score > 100{
        sum += 5;
    }
    else{
        sum+=1;
    }
}
print(sum)
 */


/*
Optional Data structures
var optionalString: String? = "Hello"
//print(optionalString == nil)
// Prints "false"

var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}
print(greeting)
*/


/*
 function
    func sum(_ numbers:[Int]) -> Int
    {
        var sum = 0
        for i in numbers {
            sum += i
        }
        return sum
    }

    func sum2(_ numbers:[Int]) -> Int
    {
        var sum = 0
         for i in 0..<numbers.count {
            sum+=numbers[i]
         }
        return sum
    }
    var numbers = [1,2,3,4,5]
    print(sum(numbers))

    print(sum2(numbers) + 2)
 
    for i in 1...5 1,2,3,4,5
    for i in 1..<5 1,2,3,4
*/

/*
 for (index, value) in shoppingList.enumerated() {
 print("Item \(index + 1): \(value)")
 }
 // Item 1: Six eggs
 // Item 2: Milk
 // Item 3: Flour
 // Item 4: Baking Powder
 // Item 5: Bananas
 
 */



/*
 SET
 var letters = Set<String>()
 var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
 removedGenre = "Rock"
 if let removedGenre = favoriteGenres.remove("Rock") {
 print("\(removedGenre)? I'm over it.")
 } else {
 print("I never much cared for that.")
 }
 
 if favGenres.contain("female"){
    favGeneres.remove("female")
}
 else{
    print(not contains information)
 }
 // Prints "Rock? I'm over it."
 
 for genre in favoriteGenres.sorted() {
 print("\(genre)")
 }
 
 
*/



/*
 Dictionary (Map)
 var namesOfIntegers = [Int: String]()
 namesOfIntegers[16] = "sixteen"
 // namesOfIntegers now contains 1 key-value pair
 namesOfIntegers = [:]
 // namesOfIntegers is once again an empty dictionary of type [Int: String]
 var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
 
 
 if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
 print("The old value for DUB was \(oldValue).")
 }
 // Prints "The old value for DUB was Dublin."
 
 airports["APL"] = nil //delete the key from map
 
 
 if let removedValue = airports.removeValue(forKey: "DUB") {
 print("The removed airport's name is \(removedValue).") //returns the removed value
 } else {
 print("The airports dictionary does not contain a value for DUB.")
 }
 // Prints "The removed airport's name is Dublin Airport."
 
 Iteration in map
 for (airportCode, airportName) in airports {
 print("\(airportCode): \(airportName)")
 }
 // YYZ: Toronto Pearson
 // LHR: London Heathrow'
 
 
 KEY and Values
 for airportCode in airports.keys {
 print("Airport code: \(airportCode)")
 }
 // Airport code: YYZ
 // Airport code: LHR
 
 for airportName in airports.values {
 print("Airport name: \(airportName)")
 }
 // Airport name: Toronto Pearson
 // Airport name: London Heathrow
 
 
 Copy only values or keys of map
 let airportCodes = [String](airports.keys)
 // airportCodes is ["YYZ", "LHR"]
 
 let airportNames = [String](airports.values)
 // airportNames is ["Toronto Pearson", "London Heathrow"]
 */



/*
let someCharacter: Character = "z"
switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}*/
// Prints "The last letter of the alphabet"


class Person{
    var name: String
    var age: Int
    init(name: String,  age:Int){
        self.name = name
        self.age = age
    }
}
var person = [Person]()
for _ in 1...5{
    person.append(Person(name: "nurzhigit", age: 20))
}


class Animal{
    var name: String?
    var age: Int?
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
}
var animal = [Animal]()
for _ in 1...5{
    animal.append(Animal(name: "chicken", age: Int.random(in: 1...6)))
}
for i in 0..<5{
    print(animal[i].name ?? nil!, animal[i].age!)
}


struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

var videomode = VideoMode()
videomode.frameRate = 50.5
videomode.name = "FirstClassClasses"
print(videomode.name!)


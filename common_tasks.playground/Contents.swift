import Cocoa

// ----------------------------------------------
// extract unique items from an array
// ----------------------------------------------
let items=["A","A","B","A","C","B","A","C","D"]
let set_of_items = Set(items)
let unique_items = Array(set_of_items) // unique items ... order is arbitrary

// ----------------------------------------------
// Sorting
// ----------------------------------------------
let sorted_items = items.sorted()
let sorted_items_2 = items.sorted { (x, y) -> Bool in //trailing closure
    return x>y
}

let sorted_items_3 = items.sorted {$0>$1} // trailing closure
sorted_items_3


// ----------------------------------------------
// Merge Dictionary
// ----------------------------------------------
var dictionary = [
    "A" : 1,
    "B" : 2,
    "C" : 3
]

dictionary.merging([
    "D" : 4,
    "F" : 5,
    "A" : 10
]) { (current, _) in current } // take the old value when overwritten

dictionary.merging([
    "D" : 4,
    "F" : 5,
    "A" : 10
]) { (_, current) in current } // take the new value when overwritten

// ----------------------------------------------
// Extract part of array as new array
// ----------------------------------------------
let z = [0,1,2,3,4,5]

z[0...1]
z[2...]
z[..<z.count]

// ----------------------------------------------
// Combine arrays
// ----------------------------------------------
let t1 = ["CH","MA","PP","HH","TT"]
let t2 = [11,12,13,14,15]

let z1 = Array(zip(t1,t2))
print(z1)

// ----------------------------------------------
// Array to dictionary
// ----------------------------------------------
let arr = [
    ["Christian", 40, 41, 42], // array with multiple types is of type Any
    ["Manuela", 37, 38, 39],
    ["Hans-Peter", 62, 63, 64],
]

var seq = arr.map {
    return ($0[0] as! String, $0[1...])
}

var d1 = Dictionary(uniqueKeysWithValues: seq)

type(of:d1)

// ----------------------------------------------
// Convert any type array
// ----------------------------------------------
let arr2 : Array<Any> = [
    1,2,3,4,5,6
]
let carr2 = arr2 as! Array<Int>
type(of: carr2)


// ----------------------------------------------
// Working with dates
// ----------------------------------------------
var localDateTime = Date()

var dateString = "\(localDateTime)"


var dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd"
var dateString2 = dateFormatter.string(from:localDateTime)

// comparing dates
var isMatch = Date() == localDateTime

// ----------------------------------------------
// Search in array
// ----------------------------------------------

let z0 = [0,1,2,10,4,5]

let fidx1 = z0.firstIndex(of: 10)
let fidx2 = z0.firstIndex(where: {$0>=2})
fidx2

// ----------------------------------------------
// flatten array
// ----------------------------------------------
let z2 = [
    [0,1,2],
    [3,4,5],
    [6,7,8]
]

let z3 = z2.flatMap({$0})
z3

// ----------------------------------------------
// Sum an array
// ----------------------------------------------
let numbers = [1, 12, 2, 9, 27]
let sum = numbers.reduce(0) { (result, element) -> Int in
    return result+element
}
sum

// ----------------------------------------------
// Filter an array
// ----------------------------------------------
let testData = [-2,0,4,3,-1]
let filtered = testData.filter { $0 < 0}
filtered
type(of:filtered)

// ----------------------------------------------
// Queries
// ----------------------------------------------
let testRows = [
    ["name": "Christian", "age":40, "gender":"male"],
    ["name": "Christiane", "age":20, "gender":"female"],
    ["name": "Manuela", "age":37, "gender":"female"],
    ["name": "Hans-Peter", "age":60, "gender":"male"]
]

let females = testRows.filter {(dict) -> Bool in
    if let gender = dict["gender"] as? String {
        if gender == "female" {
            return true
        }
    }
    return false
    
}
females

// ----------------------------------------------
// References
// ----------------------------------------------
class TestClass{
    var  str0 : String
    
    init(_ str0 : String) {
        self.str0 = str0
    }
}

var a0 = TestClass("0")
var a1 = TestClass("1")
var a2 = TestClass("2")
var a3 = TestClass("3")

var ref : TestClass

ref = a1
ref.str0
ref.str0 = "XXX"

a1.str0

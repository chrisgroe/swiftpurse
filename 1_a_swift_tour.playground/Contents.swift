import Cocoa


// -------------------------------------------------------------
//  Print
// -------------------------------------------------------------
print("Hello World")
print("Hello World",  terminator: "---" )
print("A","B","C", separator:"+++")

// -------------------------------------------------------------
// Constants and Variables
// -------------------------------------------------------------
let constant = 123
// error online once --test = 233

var variable = 1234
variable = 4321
let constant2 = variable // Constants must not be known at compile time, but you must assign its value only once.

let a = 0, b = 0, c = 0 // multiple declarations in one line
var x = 0, y = 0, z = 0 // multiple declarations in one line

// -------------------------------------------------------------
// Infer types or explicit types
// -------------------------------------------------------------
var implicitIntger = 70 // implicit Int
var implicitDouble = 70.0 // implicit Double
var implicitDouble2 = 3 + 0.124 // implicit Double
var explicitDouble:Double = 70 // explicit ... this is called type annotation
let explicitConstFloat:Float = 4 // explicit ... this is called type annotation

var x0,y0,z0 : Double; // mutiple type annotations in one line

// -------------------------------------------------------------
// Integers
// -------------------------------------------------------------
var int8: Int8 = 10
Int8.min // mninium bound
Int8.max // maximum bound

var uin8: UInt8 = 10
UInt8.min
UInt8.max

Int.min
Int.max

var binary = 0b00100
var octal = 0o0404
var hex = 0xAAA

// easier to read
let oneMillion = 1_000_000

// -------------------------------------------------------------
// Floating Point
// -------------------------------------------------------------
let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0

// easier to read
let justOverOneMillion = 1_000_000.000_000_1

// -------------------------------------------------------------
// Type Conversions
// -------------------------------------------------------------
let u8 : UInt8 = 50
let u16 = UInt16(u8)
let s8 = String(u8)

let u16_2 : UInt16 = 100
let u8_2 = UInt8(u16_2) // only safe for range 0 .. 255

// ------------------------------------------------------------
// Type Alias
// -------------------------------------------------------------
typealias TestType = Int

var xyz : TestType  = 10
// ------------------------------------------------------------
// Tuples
// -------------------------------------------------------------
let tuple = (3,4,5, "test")
let (first,_,third,fourth) = tuple // _ ignores value
fourth

//access by index
tuple.3

// tuples can be named
let tuple2=(name:"Christian", age:40)

// -------------------------------------------------------------
// Swift does no implicit conversions
// -------------------------------------------------------------
var str = "Test"
var implInt = 123
print(str + String(implInt)) // when conversion is removed --> error

// -------------------------------------------------------------
// 5) Strings
// -------------------------------------------------------------

let dollarSign = "\u{24}"        // $,  Unicode scalar U+0024
let blackHeart = "\u{2665}"      // ♥,  Unicode scalar U+2665
let sparklingHeart = "\u{1F496}" // 💖, Unicode scalar U+1F496“


var cakes = 13
var breads = 10
print("cakes:\(cakes), breads:\(breads), cakes+breads:\(cakes+breads)")

print(#"Write an interpolated string in Swift using \(multiplier)."#)


var name="Christian"
print("Hello \(name)")

var emptyString = ""
if emptyString.isEmpty {
    print("Nothing to see here")
}

var variableString = "Horse"
variableString += " and carriage"
// variableString is now "Horse and carriage“


var welcome="Welcome"
let exclamationMark: Character = "!" // Character class
welcome.append(exclamationMark)

// counting characters
welcome.count

// -------------------------------------------------------------
// 6) Multiple line strings
// -------------------------------------------------------------
print("""
line 1
    line 2
line 3
""")

// Identation is removed when it machtes the closeing identation mark
print("""
    line 4
        line 5
    line 6
    """)

// -------------------------------------------------------------
// 7) Arrays
// -------------------------------------------------------------
var testArray1 = ["ItemA", "Item B", "Item C"]
var testArray2 = ["ItemA", "Item B", "Item C" , ] // comma after last element is allowed

testArray2[1] = "Replaced"
testArray2

// -------------------------------------------------------------
// 8) Dictionaries
// -------------------------------------------------------------
var testDict = [
    "key1" : "value 1",
    "key2" : "value 2", // commat after last element is allowed
]

testDict.count
// -------------------------------------------------------------
// 9) Arrays can automatically grow
// -------------------------------------------------------------
var testArray3 = ["Hello"]
testArray3.append("World")
testArray3.count
// -------------------------------------------------------------
// 10) Create empty array or dictionary
// -------------------------------------------------------------
var testArray4 = [String] () // Initializer list
var testDict2 = [String : String] () // Initializer list

// -------------------------------------------------------------
// 11) If type conversion can be infered [] can be used for empty array or [:] for empty dict
// -------------------------------------------------------------

// -------------------------------------------------------------
// 12) For loops
// -------------------------------------------------------------
var items = [1,2,3,4,5]
for i in items {
    if i>3 { // must be boolean .. if i {} does not work
        print(i)
    } else
    {
        print(-i)
    }
}
print("---")
for i in items[2...] {
    print(i)
}

print("---")

for i in items[...2] {
    print(i)
}

// -------------------------------------------------------------
// String index
// -------------------------------------------------------------
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
// G
greeting[greeting.index(before: greeting.endIndex)]
// !
greeting[greeting.index(after: greeting.startIndex)]
// u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]

// Insert at index
var welcome2 = "hello"
welcome2.insert("!", at: welcome2.endIndex)
// welcome now equals "hello!"

welcome2.insert(contentsOf: " there", at: welcome2.index(before: welcome2.endIndex))
// welcome now equals "hello there!“


/// remove single char
welcome2.remove(at: welcome2.startIndex)
welcome2

// -------------------------------------------------------------
// 13) Optionals
// -------------------------------------------------------------
var optTest:Int? = 30
print(optTest == nil)

var optTest2:Int? = nil
print(optTest2 == nil)

var optName:String? = "Christian"

// forced unwrapping
if optName != nil {
    optName! // forced unwraping .. i'm sure that the optional contains a value
}

//optional binding .. can also be used with var
if let name = optName{
    print("Hello \(name)")
}

var optName2:String? = "Timo"
if let name = optName, let name2 = optName2{ // optional binding of multiple values...this aborts when one of them is nil
    print("Hello \(name),  \(name2)")
}

optName = nil
if let name = optName{
    print("Hello \(name)")
} else {
    print("Hello unknown man")
}

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
// convertedNumber is inferred to be of type "Int?", or "optional Int“
type(of:convertedNumber)

// -------------------------------------------------------------
// Implicitly Unwrapped Optionals - gives right to access optional without special means..assume that it is accessible
// -------------------------------------------------------------
let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // requires an exclamation mark

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString // no need for an exclamation mark“
// optional binding also works with implicitly unwrapped optionals

// -------------------------------------------------------------
// 14) Optional default value
// -------------------------------------------------------------
var ot1: String? = "hello"
var ot2: String? = nil

print("ot1 = \(ot1 ?? "unknown"), ot2 = \(ot2 ?? "unknown")");

// -------------------------------------------------------------
// 15) Switch case
// -------------------------------------------------------------
let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
    // no break necessary
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"): // TODO: Understand these
    print("Is it a spicy \(x)?")
default: // switch must be exhaustive .. therefore default case is required here
    print("Everything tastes good in soup.")
}
// -------------------------------------------------------------
// 16) Iterate key-value pairs
// -------------------------------------------------------------
var tdict = [
    "row 1" : [11,12,13,14,15,16],
    "row 2" : [21,22,23,24,25,26]
]

for (key, items) in tdict {
    print("key \(key) - values \(items)")
}
// -------------------------------------------------------------
// 17) while
// -------------------------------------------------------------
var i = 5
while i>0
{
    print("while \(i)")
    i = i - 1
}
// -------------------------------------------------------------
// 18) repeat while
// -------------------------------------------------------------
i = 5
repeat
{
    print("repeat \(i)")
    i = i - 1
} while i>0

// -------------------------------------------------------------
// 19) For loop with index
// -------------------------------------------------------------
for i in 0..<5 // 0 to 4
{
    print("for \(i)")
}

for i in 0...5 // 0 to 5
{
    print("for \(i)")
}

// -------------------------------------------------------------
// 20) Functions
// -------------------------------------------------------------
func doubleArg(value : Int) -> Int {
    return value*2
}
doubleArg(value:5)

// no argument label
func doubleArg2(_ value : Int) -> Int {
    return value*2
}

doubleArg2(5)

// -------------------------------------------------------------
// 21) Returns multiple values via tuples
// -------------------------------------------------------------
func testFunc(value: Int) -> (first: Int, second:Int, third:Int){
    return (value, 2 * value, 3 * value)
}
var k = testFunc(value:5)
k.first
k.second
k.third

// -------------------------------------------------------------
// 22) Functions are first class objects
// -------------------------------------------------------------
func createIncrementer() -> ((Int)->Int)
{
    func increment(_ value : Int)-> Int {
        return value+1
    }
    return increment
}

var incr = createIncrementer()
incr(5)

// -------------------------------------------------------------
// 23) Functions as arguments
// -------------------------------------------------------------
func funcArg(f : ((Int)->Int)){
    print(f(5))
}
func increment(_ value : Int)-> Int {
    return value+1
}
funcArg(f:increment)

// -------------------------------------------------------------
// 24) Closures
// -------------------------------------------------------------

// Closures and nested function do have access to variables of the scope where they are created
var closure = { (value:Int) -> Int in // after in the code starts
    return(value*3)
}

print(closure(4))

// -------------------------------------------------------------
// 25) Single statement closures
// -------------------------------------------------------------
// Review: map
var numbers = [10, 20, 30, 40]
print(numbers.map({number in
    return 3*number
}))

// shorter ... single statement closure return the result of the operation implicilty
print(numbers.map({number in 3*number})) // Review: map

// or even shorter
print(numbers.map({4*$0}))

// -------------------------------------------------------------
// 26) Classes
// -------------------------------------------------------------
class TestClass {
    var attrib1 = 0
    var attrib2 = 0
    
    init(attrib1 : Int ) { // Initializer
        self.attrib1 = attrib1 // self can be used to distinguish between class members and arguments
        attrib2 = 20
    }
    
    func doSomething() {
        print("\(attrib1+attrib2)")
    }
}

var testClass = TestClass(attrib1:40)
testClass.doSomething()

// -------------------------------------------------------------
// 27) Inheritance
// -------------------------------------------------------------
class InhTestClass: TestClass {
    override init(attrib1: Int) {
        super.init(attrib1:attrib1*10)
    }
}

var inhTestClass = InhTestClass(attrib1 : 10)
inhTestClass.doSomething()

// -------------------------------------------------------------
// 28) Setter, Getter, WillSet, DidSet
// -------------------------------------------------------------
class GetSet {
    var  a : Int {
        get {
            return 10
        }
        set {
            print("setter")
        }
    }
    
    var b: Int {
        willSet {
            print("before") // called before value is assigned
        }
        didSet {
            print("after") // called after value is assigned
        }
    }
    init() {
        self.b = 0
    }

}

var getSet = GetSet()
getSet.a = 10
getSet.b = 10

// -------------------------------------------------------------
// 29) nil handling
// -------------------------------------------------------------
// test?.testMethod() - returns nil if test? Is nil

// -------------------------------------------------------------
// 30) Enumerations.
// -------------------------------------------------------------
enum Rank : Int{
    case first = 1
    case second = 2
}

var rank:Rank = Rank.first;

// -------------------------------------------------------------
// 31) Enums can have methods
// -------------------------------------------------------------
enum Rank2 : Int{
    case first = 1
    case second = 2
    
    func toString() -> String
    {
        switch(self)
        {
        case .first:
            return("First")
        case .second:
            return("Second")
        }
    }
}

var rank2:Rank2 = .first
var rank2_2 = Rank2.first
rank2.toString()

// -------------------------------------------------------------
// 32) Access raw value of enum
// -------------------------------------------------------------
rank2.rawValue
var rank3_1 = Rank2(rawValue: 1)
var rank3_2 = Rank2(rawValue: 0) // does not exists

if let rank3_3 = Rank2(rawValue:2) {
    print(rank3_3.toString())
}

// -------------------------------------------------------------
// 33) Enum with properties
// -------------------------------------------------------------
enum PropEnum {
    case sucess(arg:Int)
    case failure(error:String)
    
    func toString() -> String {
        switch(self)
        {
        case let .failure(error): // let extracts all properties
            return("error \(error)")
        case let .sucess(arg):
            return ("arg=\(arg)")
        }
    }
}

var succ = PropEnum.sucess(arg: 5)
var fail = PropEnum.failure(error: "TEST")
succ.toString()
fail.toString()

// -------------------------------------------------------------
// 34) Structs are value types
// -------------------------------------------------------------
struct Point {
    var x : Int = 10
    var y : Int = 20
}

let p = Point(x: 3, y: 2)

// -------------------------------------------------------------
// 35) Protocols
// -------------------------------------------------------------
protocol TestProtocol {
    var a : Int {get}
    func testMethod()
}

class TestTester : TestProtocol {
    var a: Int
    
    init() {
        a = 10
    }
    func testMethod() {
        
    }
}

var testy = TestTester()
var testProtocoll = testy as TestProtocol // convert to protocol

var testProtocol2 : TestProtocol = testy // assign protocol

// -------------------------------------------------------------
// 36) Extensions
// -------------------------------------------------------------
extension Int : TestProtocol { // add protocol to type
    var a: Int {
        return 5
    }
    
    func testMethod() {
        print("test")
    }
    
    
}
var num = 5
num.testMethod()
10.testMethod()

// -------------------------------------------------------------
// 37) Error Handling through error Protocol
// -------------------------------------------------------------
enum CustomError : Error {
    case test1
    case test2
    case test3(arg : String)
}

func testFunc() throws {
    throw CustomError.test2
}
do {
    try testFunc()
} catch {
    error // standardd name is error
}

func testFunc2() throws -> Int{
    throw CustomError.test3(arg:"FDF")
    return 0
}
do {
    try testFunc2()
} catch let terr as CustomError{
    terr // standardd name is err
    
}

// single line
var result = try? testFunc2()

// -------------------------------------------------------------
// 38) Defer
// -------------------------------------------------------------
func testFuncDefer() {
    var a = 10
    defer {
        a=0 // will be executed after the function returns...also when throw occured
    }
    a=10
}

// -------------------------------------------------------------
// 39) Generics
// -------------------------------------------------------------
func testGeneric<Item>(a : Item) -> Item {
    return a
}
testGeneric(a: 4)
testGeneric(a: "TEST")

// with the "where" clause generics can have a list of requirements
func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Element: Equatable, T.Element == U.Element
{
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}
anyCommonElements([1, 2, 3], [3])

// -------------------------------------------------------------
// 40) Semicolons
// -------------------------------------------------------------
let a0=10; print(a0) // only required for mupltiple commands on single line

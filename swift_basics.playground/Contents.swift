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

var variable = 1234
variable = 4321

// Constants must not be known at compile time, but you can assign their value only once.
let constant2 = variable

let a = 0, b = 0, c = 0 // multiple declarations in one line
var x = 0, y = 0, z = 0 // multiple declarations in one line

// -------------------------------------------------------------
// Infer types or explicit types
// -------------------------------------------------------------
var implicitIntger = 70 // implicit Int
var implicitDouble = 70.0 // implicit Double
var implicitDouble2 = 3 + 0.124 // implicit Double

// explicit type annotations are rarely used. I
var explicitDouble:Double = 70 // explicit ... this is called type annotation
let explicitConstFloat:Float = 4 // explicit ... this is called type annotation

var x0,y0,z0 : Double // mutiple type annotations in one line


// Swift never does implicit conversions
var str = "Test"
var implInt = 123
str + String(implInt) // when conversion is removed --> error

// -------------------------------------------------------------
// Integers
// -------------------------------------------------------------
var int8: Int8 = 10
Int8.min // Int8 minimum bound
Int8.max // Int8 maximum bound

var uin8: UInt8 = 10
UInt8.min // Uint8 minimum bound
UInt8.max // Uint8 maximum bound

Int.min // Int minimum bound
Int.max // Int maximum bound

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
// Explicit type conversions
// -------------------------------------------------------------
let u8 : UInt8 = 50
let u16 = UInt16(u8)
let s8 = String(u8)

let u16_2 : UInt16 = 100
let u8_2 = UInt8(u16_2) // only safe for range 0 .. 255


// ------------------------------------------------------------
// Type Aliases
// -------------------------------------------------------------
typealias TestType = Int

var xyz : TestType  = 10

// define a tuple as alias
typealias PointTuple = (Int, Int)

var p : PointTuple = (10, 10)

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
tuple2.name

// Tuple are value types. When you initialize a variable tuple
// with another one it will actually create a copy.


// -------------------------------------------------------------
// Strings
// -------------------------------------------------------------

let dollarSign = "\u{24}"        // $,  Unicode scalar U+0024
let blackHeart = "\u{2665}"      // ♥,  Unicode scalar U+2665
let sparklingHeart = "\u{1F496}" // 💖, Unicode scalar U+1F496“
let readCircle = "\u{1F534}\u{26aa} \u{274C} \u{2500}"

// string interpolation
var name="Christian"
print("Hello \(name)")


var cakes = 13
var breads = 10
"cakes:\(cakes), breads:\(breads), cakes+breads:\(cakes+breads)"

// how to omit string interpolation
#"Write an interpolated string in Swift using \(multiplier)."#

var emptyString = ""
if emptyString.isEmpty {
    "Nothing to see here"
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
// Multiple line strings
// -------------------------------------------------------------
"""
line 1
    line 2
line 3
"""

// Identation is removed when it machtes the closeing identation mark
"""
    line 4
        line 5
    line 6
    """

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
// Arrays
// -------------------------------------------------------------
var testArray1 = ["ItemA", "Item B", "Item C"]
var testArray2 = ["ItemA", "Item B", "Item C" , ] // comma after last element is allowed

testArray2[1] = "Replaced"
testArray2

// create arrays of specified size
var threeDoubles = Array(repeating: 0.0, count: 3)
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)

// anotherThreeDoubles is of type [Double], and equals [2.5, 2.5, 2.5]

// addition of arrays
var sixDoubles = threeDoubles + anotherThreeDoubles
// sixDoubles is inferred as [Double], and equals [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]“


// -------------------------------------------------------------
// Sets
// -------------------------------------------------------------
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
oddDigits.intersection(evenDigits).sorted()
// []
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
// [1, 9]
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
// [1, 2, 9]

let houseAnimals: Set = ["A", "B"]
let farmAnimals: Set = ["C", "D", "E", "A", "B"]
let cityAnimals: Set = ["F", "G"]

houseAnimals.isSubset(of: farmAnimals)
// true
farmAnimals.isSuperset(of: houseAnimals)
// true
farmAnimals.isDisjoint(with: cityAnimals)
// true“

// -------------------------------------------------------------
// Dictionaries
// -------------------------------------------------------------
var testDict = [
    "key1" : "value 1",
    "key2" : "value 2", // commat after last element is allowed
]

testDict.count

// -------------------------------------------------------------
// Arrays automatically grow when append is used
// -------------------------------------------------------------
var testArray = ["Hello"]
testArray.append("World")
testArray.count

// -------------------------------------------------------------
// Create empty array, dictionary, set
// -------------------------------------------------------------
var emptyArray = [String] () // Initializer list
var emptyArray2 = Array<String> () // Initializer list

var emptyDict = [String : String] () // Initializer list
var emptyDict2 = Dictionary<String, String>()
var emptySet = Set<String>()

// If type conversion can be infered [] can be used for empty
// array or [:] for empty dict
var someInts = [1,2,3]
someInts = [] // now empty
type(of:someInts)

var someElements = [1:1, 2:2, 3:3]
someElements = [:]
type(of:someElements)

// -------------------------------------------------------------
// Iterate over array
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


// idx 2,3,4
for i in items[2...] {
    print(i)
}

type(of:2...)

// idx 0,1,2
for i in items[...2] {
    print(i)
}

type(of:...2)

// -------------------------------------------------------------
// Iterate key-value pairs
// -------------------------------------------------------------
var dictionary = [
    "row 1" : [11,12,13,14,15,16],
    "row 2" : [21,22,23,24,25,26]
]

for (key, items) in dictionary {
    print("key \(key) - values \(items)")
}
// -------------------------------------------------------------
// while loops
// -------------------------------------------------------------
var i = 5
while i>0
{
    print("while \(i)")
    i = i - 1
}
// -------------------------------------------------------------
// repeat while loops
// -------------------------------------------------------------
i = 5
repeat
{
    print("repeat \(i)")
    i = i - 1
} while i>0

// -------------------------------------------------------------
// For loops with range
// -------------------------------------------------------------

// closed range
for i in 0...5 // 0 to 5
{
    print("closed range \(i)")
}

type(of: 0...5)
// half open range
for i in 0..<5 // 0 to 4
{
    print("opend range \(i)")
}
type(of: 0..<5)

// stride closed range
for i in stride(from: 0, to: 60, by: 15)
{
     print("stride closed ... \(i)")
}

// stride open range
for i in stride(from: 0, through: 60, by: 15)
{
     print("stride open ... \(i)")
}

// labeled statements: also works for do repeat and while

outerLoop: for j in 0..<5 // 0 to 4
{
    innerLoop: for k in 0..<5 // 0 to 4
    {
        if j>=2 {
            continue outerLoop
        }
        
        if k>=2 {
            continue innerLoop
        }
        print("j=\(j), k=\(k)")
        
    }
}
// -------------------------------------------------------------
// Optionals
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
if let name = optName, let name2 = optName2 { // optional binding of multiple values...this aborts when one of them is nil
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
// Implicitly unwrapped optionals
// gives right to access optional without special means..assume that it is accessible
// -------------------------------------------------------------
let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // requires an exclamation mark

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString // no need for an exclamation mark“
// optional binding also works with implicitly unwrapped optionals

// -------------------------------------------------------------
// Optional default value
// -------------------------------------------------------------
var ot1: String? = "hello"
var ot2: String? = nil

print("ot1 = \(ot1 ?? "unknown"), ot2 = \(ot2 ?? "unknown")");

// -------------------------------------------------------------
// Switch case
// -------------------------------------------------------------

// Interval matching
let n = 5

switch n {
case 0...4:
    print("0...4")
case 5...6:
    print("5...6")
default:
    print("None")
}


// test tuples

let punkt = (5,4)
switch punkt {
case (0...6, _) : // _ ignores value
    "CASE"
    fallthrough // checks next conditions

case (0...6, 0...5) : // first match is used when fallthrough is not applied
    "CASE 2"
    
default:
    "SOMETHING"
}

// Value binding
let vegetable = "red pepper"
switch vegetable {
case "celery":
    "Add some raisins and make ants on a log."
    // no break necessary
case "cucumber", "watercress":
    "That would make a good tea sandwich."
case let x where x.hasSuffix("pepper"): // x is bound to the match. where is used to check additional conditions
    "Is it a spicy \(x)?"
default: // switch must be exhaustive .. therefore default case is required here
    "Everything tastes good in soup."
}




// -------------------------------------------------------------
// Functions
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

// inout arguments
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var intA = 10
var intB = -10

swapTwoInts(&intA, &intB)

intA
intB

// -------------------------------------------------------------
// Nested functions
// -------------------------------------------------------------

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}


// -------------------------------------------------------------
// Returns multiple values via tuples
// -------------------------------------------------------------
func testFunc(value: Int) -> (first: Int, second:Int, third:Int){
    return (value, 2 * value, 3 * value)
}
var k = testFunc(value:5)
k.first
k.second
k.third


// -------------------------------------------------------------
// Function Types : Functions are first class objects
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
// Function Types : Functions as arguments
// -------------------------------------------------------------
func funcArg(f : ((Int)->Int)) -> Int{
    f(5)
}
func increment(_ value : Int)-> Int {
    return value+1
}
funcArg(f:increment)

// -------------------------------------------------------------
// Function Types : Closures
// -------------------------------------------------------------

// Closures and nested function do have access to variables of the scope where they are created
var closure1 = { (value:Int) -> Int in // after in the code starts
    return(value*3)
}

closure1(4)

var closure2 : ((Int)->Int) = { value  in // after in the code starts
    return(value*3)
}

closure2(4)

var completionHandler :  (() -> ())?

// Escapting Keyword
func escapeTest(eclos : @escaping () -> ()) {
    completionHandler = eclos // this will not work without @escaping keyword
    
    
}
class TestClass {
    var x = 10
    func registerEscapingClosure() {

        // when using a escaping closure self must be used to access element of the class
        escapeTest {
            print("Escaping closure \(self.x)")
        }
    }
}
let tc = TestClass()
tc.registerEscapingClosure()

completionHandler!()

// Autoclosure
func autoClosureTest(ac : @autoclosure () -> ()) {
    ac()
}

autoClosureTest(ac: print("Autoclosure")) // print will be put into a closure. It will only be evaluated when the closure is called

// -------------------------------------------------------------
// Single statement closures
// -------------------------------------------------------------

var numbers = [10, 20, 30, 40]
print(numbers.map({number in
    return 3*number
}))

// shorter ... single statement closure return the result of the operation implicilty
numbers.map({number in 3*number}) // Review: map

// or even shorter
numbers.map({4*$0})



var closure3  = { $0*3 } // $0 can be deduced by return type .. without *3 it will not work
closure3

closure3(4)

// If there are multiple lines of code inside the
// closure body, then we cannot omit the return statement.


// -------------------------------------------------------------
// Classes
// -------------------------------------------------------------
class TestClass2 {
    var attrib1 = 0
    var attrib2 = 0
    
    init(attrib1 : Int ) { // Initializer
        self.attrib1 = attrib1 // self can be used to distinguish between class members and arguments
        attrib2 = 20
    }
    
    func doSomething() -> String {
        return "\(attrib1+attrib2)"
    }
}

var testClass = TestClass2(attrib1:40)
testClass.doSomething()

// -------------------------------------------------------------
// Inheritance
// -------------------------------------------------------------
class InhTestClass: TestClass2 {
    override init(attrib1: Int) {
        super.init(attrib1:attrib1*10)
    }
}

var inhTestClass = InhTestClass(attrib1 : 10)
inhTestClass.doSomething()

// -------------------------------------------------------------
// Setter, Getter, WillSet, DidSet
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
    
    func testMethod() {
        // do nothing
    }

}

var getSet = GetSet()
getSet.a = 10
getSet.b = 10

// -------------------------------------------------------------
// Nil handling
// -------------------------------------------------------------

var testObj : GetSet? = nil
testObj?.testMethod() // returns nil if test? Is nil

// -------------------------------------------------------------
// Enumerations.
// -------------------------------------------------------------
enum Rank : Int{
    case first = 1
    case second = 2
    case third = 3
}

var rank:Rank = Rank.first;

// Iterable enum
enum Rank2 : CaseIterable{
    case first
    case second
    case third
}
Rank2.allCases

// Recursive enums

enum ArithmeticExpression {
    case value(Int)
    indirect case Addition(ArithmeticExpression, ArithmeticExpression) // insert level of indirection
    indirect case Multiplication(ArithmeticExpression, ArithmeticExpression)
}

// We can initialize custom values with ArithmeticExpression enums as follows

let firstNumber = ArithmeticExpression.value(10)
let secondNumber = ArithmeticExpression.value(2)
let addition = ArithmeticExpression.Addition(firstNumber, secondNumber)

let multiplication = ArithmeticExpression.Multiplication(firstNumber, secondNumber)

// how to use that
func computeValue(input: ArithmeticExpression) -> Int {
    switch input {
    case .value(let val):
        return val
    case .Addition(let exp1, let exp2):
        return computeValue(input: exp1) + computeValue(input: exp2)
    case .Multiplication(let exp1, let exp2):
        return computeValue(input: exp1) * computeValue(input: exp2)
    }
}

// Now utilizing this function we can easily compute the values of expressions above,

// additionResult = 12
let additionResult = computeValue(input: addition)

// Enums can have methods
enum Rank3 : Int{
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

var rank3_1:Rank3 = .first
var rank3_2 = Rank3.first
rank3_2.toString()


// Access raw value of enum
rank3_2.rawValue
var rank3_3 = Rank3(rawValue: 1)
var rank3_4 = Rank3(rawValue: 0) // does not exists

if let rank3_5 = Rank3(rawValue:2) {
    rank3_5.toString()
}

// Enum with associated values
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

var sucess = PropEnum.sucess(arg: 5)
var failure = PropEnum.failure(error: "TEST")
sucess.toString()
failure.toString()

// -------------------------------------------------------------
// Structs are value types
// -------------------------------------------------------------
struct Point {
    var x : Int = 10
    var y : Int = 20
}

let point = Point(x: 3, y: 2)

// -------------------------------------------------------------
// Protocols
// -------------------------------------------------------------
protocol TestProtocol {
    var a : Int {get}
    func testMethod() -> String
}

class TestTester : TestProtocol {
    var a: Int
    
    init() {
        a = 10
    }
    func testMethod() -> String  {
        return "TestTester.testMethod"
    }
}

var testy = TestTester()
var testProtocol1 = testy as TestProtocol // convert to protocol
testProtocol1.testMethod()

var testProtocol2 : TestProtocol = testy // assign protocol
testProtocol2.testMethod()
// -------------------------------------------------------------
// Extensions
// -------------------------------------------------------------
extension Int : TestProtocol { // add protocol to type
    var a: Int {
        return 5
    }
    
    func testMethod() -> String {
        "extension to int" // when only one line long the return statement can be ommitted
    }
    
    
}
var num = 5
num.testMethod()
10.testMethod()

// -------------------------------------------------------------
// Error Handling through error Protocol
// -------------------------------------------------------------
enum CustomError : Error {
    case TestError1
    case TestError2
    case TestError3(arg : String)
}

func testFunc() throws {
    throw CustomError.TestError2
}
do {
    try testFunc()
} catch {
    error // standardd name is error
}

func testFunc2(val : Int) throws -> Int{
    if val>5 {
        throw CustomError.TestError3(arg:"FDF")
    }
    return 0
}
do {
    try testFunc2(val:6)
} catch let terr as CustomError{
    terr // standardd name is err
    
}

// single line .. returns nil if an error was thrown
var result = try? testFunc2(val:6)

// -------------------------------------------------------------
// Defer
// -------------------------------------------------------------
func testFuncDefer() {
    var a = 10
    defer {
        a=0 // will be executed after the function returns...also when throw occured
    }
    a=10
}

// -------------------------------------------------------------
// Generics
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
// Semicolons
// -------------------------------------------------------------
let a0=10; print(a0) // only required for mupltiple commands on single line


// -------------------------------------------------------------
// Guards
// -------------------------------------------------------------

func testGuard(val : Int?) -> String
{
    guard let v = val else {
        return "Guard"
    }
    return "val was \(v)"
}

testGuard(val: nil)
testGuard(val: 1)


// -------------------------------------------------------------
// mapping methods
// -------------------------------------------------------------
var fnumbers  = [[1,2,3],[4],[5,6,7,8,9]]
type(of: fnumbers)
var cnumbers = fnumbers.flatMap{$0}

cnumbers
type(of:cnumbers)


var fnumbers2  = [1,2,3,4,nil, 5,6,7,8,9, nil]
type(of: fnumbers2)
var cnumbers2 = fnumbers2.compactMap{$0}

cnumbers2
type(of:cnumbers2)


// -------------------------------------------------------------
// Identity Operators
// -------------------------------------------------------------


var ref1 = NSObject()
var ref2 = NSObject()

ref1 === ref2 // are instances identical
ref1 !== ref2 // are instances not identical

ref2 = ref1

ref1 === ref2 // are instances identical
ref1 !== ref2 // are instances not identical

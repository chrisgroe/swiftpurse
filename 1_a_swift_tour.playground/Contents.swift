import Cocoa


/// 1)
print("Hello World")

// 2) Constants and Variables

let test = 123
// error online once --test = 233

var test2 = 1234
test2 = 4321
let test3 = test2 // Constants must not be known at compile time, but you must assign its value only once.


// 3) Infer types or explicit types
var implicitIntger = 70
var implicitDouble = 70.0
var explicitDouble:Double = 70

// experiment: Create constant with explicit type of Float and a value of 4
let explicitConstFloat:Float = 4

// 4) No implicit conversions
var str = "Test"
var implInt = 123
print(str + String(implInt)) // when conversion is removed --> error

// 5) String interpolation
var cakes = 13
var breads = 10
print("cakes:\(cakes), breads:\(breads), cakes+breads:\(cakes+breads)")

var name="Christian"
print("Hello \(name)")

// 6) Multiple line strings
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

// 7) Arrays
var testArray1 = ["ItemA", "Item B", "Item C"]
var testArray2 = ["ItemA", "Item B", "Item C" , ] // comma after last element is allowed

testArray2[1] = "Replaced"
testArray2

// 8) Dictionaries
var testDict = [
    "key1" : "value 1",
    "key2" : "value 2", // commat after last element is allowed
]

// 9) Arrays automatically grow
var testArray3 = ["Hello"]
testArray3.append("World")

// 10) Create empty array or dictionary
var testArray4 = [String] () // Initializer list
var testDict2 = [String : String] () // Initializer list

// 11) If type conversion can be infered [] can be used for empty array or [:] for empty dict

// 12) For loops
var items = [1,2,3,4,5]
for i in items {
    if i>3 { // must be boolean .. if i {} does not work
        print(i)
    } else
    {
        print(-i)
    }
}

// 13) Optionals
var optTest:Int? = 30
print(optTest == nil)

var optTest2:Int? = nil
print(optTest2 == nil)

var optName:String? = "Christian"

if let name = optName{
    print("Hello \(name)")
}
optName = nil
if let name = optName{
    print("Hello \(name)")
} else {
    print("Hello unknown man")
}



// 14) Optional default value

var ot1: String? = "hello"
var ot2: String? = nil

print("ot1 = \(ot1 ?? "unknown"), ot2 = \(ot2 ?? "unknown")");

// 15) Switch case

let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
    // no break necessary
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"): // TODO: Understand these
    print("Is it a spicy \(x)?")
default: // switch mus be exhaustive .. therefore default case is required here
    print("Everything tastes good in soup.")
}

// 16) Iterate key-value pairs

var tdict = [
    "row 1" : [11,12,13,14,15,16],
    "row 2" : [21,22,23,24,25,26]
]

for (key, items) in tdict {
    print("key \(key) - values \(items)")
}

// 17) while

var i = 5
while i>0
{
    print("while \(i)")
    i = i - 1
}

// 18) repeat while
i = 5
repeat
{
    print("repeat \(i)")
    i = i - 1
} while i>0


// 19) For loop with index
for i in 0..<5 // 0 to 4
{
    print("for \(i)")
}

for i in 0...5 // 0 to 5
{
    print("for \(i)")
}

// 20) Functions
func doubleArg(value : Int) -> Int {
    return value*2
}
doubleArg(value:5)

// no argument label
func doubleArg2(_ value : Int) -> Int {
    return value*2
}

doubleArg2(5)

// 21) Returns multiple values via tuples

func testFunc(value: Int) -> (first: Int, second:Int, third:Int){
    return (value, 2 * value, 3 * value)
}
var k = testFunc(value:5)
k.first
k.second
k.third

// 22) First class objects
func createIncrementer() -> ((Int)->Int)
{
    func increment(_ value : Int)-> Int {
        return value+1
    }
    return increment
}

var incr = createIncrementer()
incr(5)

// 23) Functions as arguments
func funcArg(f : ((Int)->Int)){
    print(f(5))
}
func increment(_ value : Int)-> Int {
    return value+1
}
funcArg(f:increment)

// 24) Closurer <-- Review

// Closures and nested function do have access to variables of the scope where they are created
var closure = { (value:Int) -> Int in
    return(value*3)
}

print(closure(4))

// 25) Single statement closures
// Review: map
var numbers = [10, 20, 30, 40]
print(numbers.map({number in
    return 3*number
}))

// shorter ... single statement closure return the result of the operation implicilty
print(numbers.map({number in 3*number})) // Review: map

// or even shorter
print(numbers.map({4*$0}))

// 26) Classes
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

// 27) Inheritance
class InhTestClass: TestClass {
    override init(attrib1: Int) {
        super.init(attrib1:attrib1*10)
    }
}

var inhTestClass = InhTestClass(attrib1 : 10)
inhTestClass.doSomething()

// 28) Setter, Getter, WillSet, DidSet
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

// 29) nil handling

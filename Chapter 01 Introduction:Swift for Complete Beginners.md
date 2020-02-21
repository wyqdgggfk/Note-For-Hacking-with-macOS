# Introduction:Swift for Complete Beginners

First of all, if you are confident that you are fimiliar with the Swift programming language, you can ignore this chapter.

## Variables and constants

use **var** to make a variable, and **let** to make a constants:

```swift
import UIKit
var name = "Micheal" //This is a variable,means can be changed
name = "Jack" //Change name from Micheal to Jack
let anotherName = "Tomi"//Can't change anotherName's value
```

## Types of Data

```swift
var name: String//declare a variable to be a string
name = "Micheal"

var age: Int//declare a variable to be an integer
age = 20
```

### Float and Double

```swift
var latitude: Double
latitude = 36.166689767

var longitude: Float
longitude = -87.32368686468
```

### Boolean

```swift
var stayOutTooLate: Bool
stayOutTooLate = true

var nothingInBrain: Bool
nothingInBrain = true
```

### Using type annotations wisely

This book refer us to use:

```swift
var name = "Micheal"
```

instead of:

```swift
var name: String
name = "Micheal"
```

Because the first one is simple.And also we can define a variable like this:

```swift
var name: String = "Micheal"
```

## Operators

Operators mean +-*÷

```swift
/*
 Let's make some operator
 */
var a = 1.1
var b = 2.2
var c = a + b
/*
 The operator + can combine two string
 */
var string1 = "Hello"
var string2 = "World"
var helloWorld = string1 + " my " + string2
```

### Comparison operators

```swift
var someNum = 20
someNum > 19 //This will result in true
```

## String interpolation

```swift
//Insert or append a string into another
var string3 = "Tim"
"His name is \(string3)"
```

## Arrays

```swift
// Define a string array
var songs = ["Shake your hand","You Belong with Me","Back to December"] //First way to define a string array
var singers:[String] = ["Taylor Swift","Justin Bieber","Charlie Puth"] //Second way to define a string array
//How to create an array with multiple kinds of value types
var multipleArray:[Any] = ["Computer",43,true]
```

### Creating arrays

We can create an empty array and fill in it later

```swift
//create an empty array and fill in it with value
var songList: [String] = []
var songArray = [String]()
songList.append(contentsOf: ["Someone Like You"])
songArray.insert("Alice in Wonderland", at: 0)
```

### Array operators

Use + to combine to array together

```swift

```


































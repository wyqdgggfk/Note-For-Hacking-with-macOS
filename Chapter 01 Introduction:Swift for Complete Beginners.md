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


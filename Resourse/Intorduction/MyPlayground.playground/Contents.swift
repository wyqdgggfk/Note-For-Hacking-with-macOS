import UIKit
var name = "Micheal" //This is a variable,means can be changed
name = "Jack" //Change name from Micheal to Jack
let anotherName = "Tomi"//Can't change anotherName's value

var age:Int
age = 20

var latitude: Double
latitude = 36.166689767

var longitude: Float
longitude = -87.32368686468

var stayOutTooLate: Bool
stayOutTooLate = true

var nothingInBrain: Bool
nothingInBrain = true

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

var someNum = 20
someNum > 19 //This will result in true

//Insert or append a string into another
var string3 = "Tim"
"His name is \(string3)"

// Define a string array
var songs = ["Shake your hand","You Belong with Me","Back to December"] //First way to define a string array
var singers:[String] = ["Taylor Swift","Justin Bieber","Charlie Puth"] //Second way to define a string array
//How to create an array with multiple kinds of value types
var multipleArray:[Any] = ["Computer",43,true]

//create an empty array and fill in it with value
var songList: [String] = []
var songArray = [String]()
songList.append(contentsOf: ["Someone Like You"])
songArray.insert("Alice in Wonderland", at: 0)

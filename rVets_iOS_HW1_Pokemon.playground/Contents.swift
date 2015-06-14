// Robert Vets
// June 2, 2015
// CodeFellows iOS, SEA-C40, Homework 1
// Pokemon classes, superclasses, inheritance


import UIKit
var str = "Hello, Pokemon playground"

class Pokemon {
    
  var hitPoints = 100
  var name = "none"
  var level = 1
  var inflictDamage = 10
  var conscious: Bool = true
  
  init (name givenName: String){
    self.name = givenName
    var exp = 10
    //this is some initialization code
  }
    
  func attack(opponent: Pokemon)-> Int {
    opponent.damage(self.inflictDamage)
    var test2 = opponent.level
    return test2
    // calls the attacked's damage method
  }
    
  func levelUp(){
    self.level += 1
    self.hitPoints += 50
  }
    
  func damage(impact: Int){
    // decrease hitPoints with a fight
    self.hitPoints -= impact
    if self.hitPoints < 5 {
      self.faint()
      }
    }
    
  func faint(){
    self.conscious = false
  }
}

class Squirtle: Pokemon {
  override init(name givenName: String) {
    super.init(name: givenName)
    inflictDamage = 5
  }
}

class Wartortle: Squirtle {
  override init(name givenName: String) {
    super.init(name: givenName)
    inflictDamage = 15
  }
}

class Baltoise: Wartortle {
  override init(name givenName: String) {
    super.init(name: givenName)
    inflictDamage = 35
  }
}

class Zubat : Pokemon {
  override init(name givenName: String) {
    super.init(name: givenName)
    inflictDamage = 3
  }
}

class Golbat: Zubat {
  override init(name givenName: String) {
    super.init(name: givenName)
    inflictDamage = 9
  }
}

class Crobat: Golbat {
  override init(name givenName: String) {
    super.init(name: givenName)
    inflictDamage = 13
  }
}



let mySquirtle = Squirtle(name: "Jimmy")
let myZubat = Zubat(name: "Jane" )
let myWartortle = Wartortle(name: "max")
let myOtherZubat = Zubat(name: "minnie")
let myGolbat = Golbat(name: "goldei")
let myCrobat = Crobat(name: "Crow-bar")
let my7thPokemon = Squirtle(name: "Bond, James")
let myNextDerivedPokemon = Wartortle(name: "WMD")
let theLastPokemon = Golbat(name: "oK not the last")

mySquirtle.attack(myZubat)
mySquirtle.attack(myZubat)
mySquirtle.levelUp()

myZubat.attack(myWartortle)
myWartortle.hitPoints
myWartortle.name

let myBaltoise = Baltoise(name:"Wilma")

myBaltoise.name
myBaltoise.attack(myWartortle)
myWartortle.hitPoints






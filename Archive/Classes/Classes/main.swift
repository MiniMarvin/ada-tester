//
//  main.swift
//  protocols
//
//  Created by Turma Tarde on 28/02/18.
//  Copyright © 2018 Caio Gomes. All rights reserved.
//

import Foundation


protocol Form {
  func area() -> Double
  func equals(_ obj:Form) -> Bool
  func innerPoint(_ point:Point) -> Bool // Verify if point is inside the form
  func innerForm(_ form:Form) -> Bool // Verify if form is inside another one
  mutating func move(_ dx:Double, _ dy:Double)
}


struct Point {
  var x:Double
  var y:Double
  
  func equals(_ point:Point) -> Bool {
    return self.x == point.x && self.y == point.y
  }
  
}

class geoForm {
  var x:Double
  var y:Double
  
  init(x:Double, y:Double) {
    self.x = x
    self.y = y
  }
  
  func move(_ dx:Double, _ dy:Double) {
    self.x += dx
    self.y += dy
  }
  
}

class Rectangle:geoForm, Form {
  
  var center:Point
  var width:Double
  var height:Double
  
  init(center:Point, width:Double, height:Double) {
    self.center = center
    self.width = width
    self.height = height
    super.init(x: center.x, y:center.y)
  }
  
  func equals(_ obj:Form) -> Bool {
    if obj is Rectangle {
      let rect = obj as! Rectangle
      
      return (
        self.center.equals(rect.center) &&
          self.width == rect.width &&
          self.height == rect.height
      )
    }
    
    return false
  }
  
  func area() -> Double {
    return self.width*self.height
  }
  
  func innerPoint(_ point: Point) -> Bool {
    return (
      point.x <= self.center.x + self.width/2 &&
        point.x >= self.center.x - self.width/2 &&
        point.y <= self.center.y + self.height/2 &&
        point.y >= self.center.y - self.height/2
    )
  }
  
  func extremePoints() -> [Point] {
    var points:[Point] = []
    
    var sum_0:[Double] = [1, 1, -1, -1]
    var sum_1:[Double] = [1, -1, 1, -1]
    
    for x in 0...sum_0.count - 1 {
      points.append(Point(x: self.center.x + sum_0[x]*self.width, y: self.center.y + sum_1[x]*self.height))
    }
    
    return points
  }
  
  func innerForm(_ form: Form) -> Bool {
    if form is Rectangle {
      let rect = form as! Rectangle
      let extremes = rect.extremePoints()
      
      for p in extremes {
        if !self.innerPoint(p) {
          return false
        }
      }
      
      return true
    }
    else if form is Circle {
      let circle = form as! Circle
      let extremes = circle.extremePoints()
      
      for p in extremes {
        if !self.innerPoint(p) {
          return false
        }
      }
      
      return true
    }
    
    return false
  }
  
  override func move(_ dx:Double, _ dy:Double) {
    self.center.x += dx
    self.center.y += dy
  }
}

class Circle:geoForm, Form {
  var center:Point
  var radius:Double
  
  init(center:Point, radius:Double) {
    self.center = center
    self.radius = radius
    super.init(x:center.x, y:center.y)
  }
  
  func equals(_ obj:Form) -> Bool {
    if obj is Circle {
      let circle = obj as! Circle
      
      return (
        self.center.equals(circle.center) &&
          self.radius == circle.radius
      )
    }
    
    return false
  }
  
  
  func area() -> Double {
    let pi = 3.14159265358979323
    return pi*self.radius*self.radius
  }
  
  
  func innerPoint(_ point: Point) -> Bool {
    return (pow(point.x - self.center.x, 2) +
      pow(point.y - self.center.y, 2)) <= pow(self.radius, 2)
  }
  
  func extremePoints() -> [Point] {
    let sum_0:[Double] = [1, 0, -1, 0]
    let sum_1:[Double] = [0, 1, 0, -1]
    var points:[Point] = []
    
    for i in 0...sum_0.count - 1 {
      points.append(Point(x: self.center.x + sum_0[i]*self.radius, y: self.center.y + sum_1[i]*self.radius))
    }
    return points
  }
  
  func innerForm(_ form: Form) -> Bool {
    if form is Rectangle {
      let rect = form as! Rectangle
      let extremes = rect.extremePoints()
      
      for p in extremes {
        if !self.innerPoint(p) {
          return false
        }
      }
      
      return true
    }
    else if form is Circle {
      let circle = form as! Circle
      
      let dist =
        sqrt(
          pow(circle.center.x - self.center.x, 2) +
            pow(circle.center.y - self.center.y, 2)
      )
      
      return self.radius - dist >= circle.radius
    }
    
    return false
  }
  
  override func move(_ dx:Double, _ dy:Double) {
    self.center.x += dx
    self.center.y += dy
  }
}


var c1 = Circle(center: Point(x:0, y:0), radius: 10)
var r1 = Rectangle(center: Point(x:0, y:0), width: 10, height: 5)
var c2 = Circle(center: Point(x:0, y:0), radius: 10)
var c3 = Circle(center: Point(x:1, y:0), radius: 3)
var r2 = Rectangle(center: Point(x:2, y:4), width: 3, height: 4)
var r3 = Rectangle(center: Point(x: 0, y: 0), width: 30, height: 30)

print(c1.equals(r1))
print(c1.equals(c2))
print(c1.area())
print(c2.area())
print(c3.area())
print(r1.area())
print(r2.area())
print(c1.innerPoint(Point(x: 2, y: 3)))
print(c1.innerPoint(Point(x: 20, y: -50)))
print(r1.innerPoint(Point(x: 5, y: 5)))
print(r1.innerPoint(Point(x: 50, y: -50)))
print(r1.extremePoints())
print(c1.extremePoints())

print(r3.innerForm(c3))
print(c3)


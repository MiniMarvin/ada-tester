//
//  main.swift
//  retangulo_struct
//
//  Created by Turma Tarde on 27/02/18.
//  Copyright © 2018 Caio Gomes. All rights reserved.
//

import Foundation


struct Rectangle {
  var width:Double
  var height:Double
  var center:Point
  
  func area() -> Double {
    return self.width*self.height
  }
  
  func is_equal(_ r:Rectangle) -> Bool {
    return r.center.is_equal(self.center) &&
      self.width == r.width &&
      self.height == r.height
  }
  
  func dist_center_point(_ p:Point) -> Double {
    return sqrt(pow( self.center.x - p.x, 2) + pow( self.center.y - p.y, 2))
  }
}

struct Point {
  var x:Double
  var y:Double
  
  func is_equal(_ p:Point) -> Bool {
    return self.x == p.x && self.y == p.y
  }
}







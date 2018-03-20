//
//  main.swift
//  pokemon_struct_func
//
//  Created by Turma Tarde on 27/02/18.
//  Copyright © 2018 Caio Gomes. All rights reserved.
//

import Foundation



struct Pokemon {
  var name:String
  var attacks:[Attack]
  var full_hp:Int
  var hp:Int
  var type:String
  
  
  init(name:String, attacks:[Attack], full_hp:Int, type:String) {
    self.name = name
    self.attacks = attacks
    self.full_hp = full_hp
    self.hp = full_hp
    self.type = type
  }
  
  func is_same_type(_ target:Pokemon) -> Bool {
    return target.type == self.type
  }
  
  func attack(_ target: inout Pokemon, _ a:Attack) {
    target.hp -= a.damage
  }
}


struct Attack {
  var name:String
  var damage:Int
}

// Tests
var t1 = Attack(name:"Tacle", damage:13)
var t2 = Attack(name:"Thunderbolt", damage:20)
var p1 = Pokemon(name:"Pikachu", attacks:[t2], full_hp:70, type:"Thunder")
var p2 = Pokemon(name:"Zigzagoon", attacks:[t1], full_hp:45, type:"Thunder")



print(p1)
print()
print(p2)
print()
print(p1.is_same_type(p2))
print()
print()
p1.attack(&p2, p1.attacks[0])
print(p1)
print()
print(p2)

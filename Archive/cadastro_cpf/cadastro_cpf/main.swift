//
//  main.swift
//  cadastro_cpf
//
//  Created by Turma Tarde on 27/02/18.
//  Copyright © 2018 Caio Gomes. All rights reserved.
//

import Foundation

// Structures
struct Course {
  var name:String
  var code:String
  var semester:Int
}

struct Student {
  var name:String
  var cpf:String
  var cursed:[Course]
}


// Functions
func add_student(_ a:Student, _ db: inout [String:Student]) {
  if !is_registered(a, db) {
    db[a.cpf] = a
  }
}

func is_registered(_ a:Student, _ db:[String:Student]) -> Bool {
  if db[a.cpf] == nil {
    return false
  }
  return true
}

func remove_student(_ a:Student, _ db: inout [String:Student]) {
  if is_registered(a, db) {
    db.removeValue(forKey: a.cpf)
  }
}

func is_coursed(_ a:Student, _ b:Course) -> Bool {
  for c in a.cursed {
    if c.code == b.code {
      return true
    }
  }
  return false
}

func register_course(_ a:Student, _ b:Course, _ db: inout [String:Student]) {
  if is_registered(a, db) {
    if !is_coursed(db[a.cpf]!, b) {
      db[a.cpf]?.cursed.append(b)
    }
  }
}


func test_print(_ a:Student, _ course:Course, _ db:[String:Student]) {
  print("---------------------------------------")
  print("The database")
  print("\t", db)
  print("Is user registered?")
  print("\t", is_registered(a, db))
  print("Is course registered?")
  if is_registered(a, db) {
    print("\t", is_coursed(db[a.cpf]!, course))
  }
  else {
    print("\t false")
  }
  print()
}


// Main Script
var db:[String:Student] = [:]
var a:Student = Student(name: "José", cpf: "123.456.789-10", cursed:[])
var course:Course = Course(name:"ADA", code:"1234567890", semester:1)
var option:Int = 0


// Tests
test_print(a, course, db)
add_student(a, &db)

test_print(a, course, db)
register_course(a, course, &db)

test_print(a, course, db)

remove_student(a, &db)
test_print(a, course, db)



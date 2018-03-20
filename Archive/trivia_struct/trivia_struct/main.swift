//
//  main.swift
//  trivia_struct
//
//  Created by Turma Tarde on 27/02/18.
//  Copyright © 2018 Caio Gomes. All rights reserved.
//

import Foundation

struct Pergunta {
  var pergunta:String
  var resposta:String
}

var pontos:Int = 0
var answer:String = ""
var perguntas:[Pergunta] = [
  Pergunta(pergunta: "Qual o nome do pokemon do Ash?", resposta: "Pikachu"),
  Pergunta(pergunta:"Qual o nome do décimo primeiro campeão mundial de xadrez?", resposta:"Bobby Fischer"),
  Pergunta(pergunta:"Qual o nome do vestibular mais difícil do Brasil", resposta:"ITA")]
var nice_quotes = ["Que massa, você super acertou cara!", "É, tá certinho...", "Sabido você"]
var bad_quotes = ["Trouxão demais!", "Desiste que você é bem idiota kkk", "Se eu fosse burro assim já tinha cometido suicídio"]



for p in perguntas {
  print(p.pergunta)
  answer = readLine()!
  
  if answer == p.resposta {
    pontos += 1
    print(nice_quotes[Int(arc4random_uniform(UInt32(nice_quotes.count)))])
  }
  else {
    pontos -= 1
    print(bad_quotes[Int(arc4random_uniform(UInt32(bad_quotes.count)))])
  }
  print()
}

if pontos >= 5 {
  print("Mito demais! mais de 5 pontos")
}


print("Você fez", pontos, "pontos")

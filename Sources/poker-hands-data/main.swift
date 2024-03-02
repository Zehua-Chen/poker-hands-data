//
//  main.swift
//
//
//  Created by Zehua Chen on 3/2/24.
//
import Foundation

let jsonEncoder = JSONEncoder()
jsonEncoder.outputFormatting = .prettyPrinted

let json = try! jsonEncoder.encode(PokerHandPhrase.all)
let jsonString = String(data: json, encoding: .utf8)!

print(jsonString)

//
//  PokerHandPhrase.swift
//
//
//  Created by Zehua Chen on 3/2/24.
//

struct PokerHandPhrase: Codable {
  enum Tag: String, Codable {
    case numeric = "NUMERIC"
    case direction = "DIRECTION"
    case card = "CARD"
  }

  var tokens: [String]
  var tags: [Tag]

  init(tokens: [String], tags: [Tag]) {
    self.tokens = tokens
    self.tags = tags

    assert(tokens.count == tags.count)
  }
}

extension PokerHandPhrase {
  static var handCount: Int { 5 }

  static var all: [PokerHandPhrase] = {
    var data = [PokerHandPhrase]()

    data.append(contentsOf: _straightHands)

    return data
  }()

  private static var _straightHands: [PokerHandPhrase] = {
    var data = [
      PokerHandPhrase(tokens: ["straight", "queen"], tags: [.numeric, .card]),
      PokerHandPhrase(tokens: ["queen", "straight"], tags: [.card, .numeric]),
    ]

    for terminator in PokerNumber.allCases {
      data.append(
        PokerHandPhrase(
          tokens: [terminator.rawValue, "high", "straight"], tags: [.card, .direction, .numeric]))
    }

    return data
  }()
}

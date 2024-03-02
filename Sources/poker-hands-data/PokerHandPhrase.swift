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
  static var all: [PokerHandPhrase] = {
    var data = [PokerHandPhrase]()

    data.append(contentsOf: _straightHands)

    return data
  }()

  private static var _straightHands: [PokerHandPhrase] = {
    return [
      PokerHandPhrase(tokens: ["straight", "queen"], tags: [.numeric, .card]),
      PokerHandPhrase(tokens: ["queen", "straight"], tags: [.card, .numeric]),
      PokerHandPhrase(tokens: ["seven", "high", "straight"], tags: [.card, .direction, .numeric]),
    ]
  }()
}

//
//  Note.swift
//  watch-notes WatchKit Extension
//
//  Created by Rick Brown on 12/09/2021.
//

import Foundation

struct Note: Identifiable, Codable {
  let id: UUID
  let text: String
}

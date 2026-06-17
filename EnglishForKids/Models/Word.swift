//
//  Word.swift
//  EnglishForKids
//
//  Created by ThienDD9 on 17/6/26.
//

import Foundation

struct Word: Codable {
    let english: String      // từ tiếng Anh
    let vietnamese: String   // nghĩa tiếng Việt
    let emoji: String        // icon đại diện
    let example: String      // câu ví dụ
    let exampleVietnamese: String   // câu ví dụ
}

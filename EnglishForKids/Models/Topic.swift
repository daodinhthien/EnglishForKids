//
//  Topic.swift
//  EnglishForKids
//
//  Created by ThienDD9 on 17/6/26.
//

import Foundation

struct Topic: Codable {
    let id: String
    let name: String         // tên chủ đề tiếng Anh
    let nameVi: String       // tên chủ đề tiếng Việt
    let emoji: String        // icon chủ đề
    let color: String        // màu hex
    let words: [Word]
}

struct LessonResponse: Codable {
    let topics: [Topic]?
    let dialogues: [DialogueTopic]?
    let fillExercises: [FillExercise]?
    let matchPairs: [MatchPair]?
    let pictureQuestions: [PictureQuestion]?
    let arrangeExercises: [ArrangeExercise]?
}

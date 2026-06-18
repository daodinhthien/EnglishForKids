//
//  CommonService.swift
//  EnglishForKids
//
//  Created by ThienDD9 on 18/6/26.
//

import Foundation

final class APIService {
    static let share = APIService()
    private init() {}
    
    func checkRemoteConfig() async throws -> RemoteConfig? {
        let url = URL(string: "https://englishforkids-c69c1.web.app/config.json")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try? JSONDecoder().decode(RemoteConfig.self, from: data)
    }
    
    func downloadVocabularies() async throws {
        let url = URL(string: "https://englishforkids-c69c1.web.app/vocabulary.json")!
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let document = FileManager.default.urls( for: .documentDirectory, in: .userDomainMask)[0]
        
        let fileURL = document.appendingPathComponent("vocabulary.json")
        
        try data.write(to: fileURL)
    }
}

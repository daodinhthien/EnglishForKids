//
//  WordDetailViewController.swift
//  EnglishForKids
//
//  Created by ThienDD9 on 17/6/26.
//

import UIKit
import AVFoundation

class WordDetailViewController: UIViewController {

    private let word: Word
    private let topic: Topic
    private let synthesizer = AVSpeechSynthesizer()

    private let emojiLabel: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 80)
        l.textAlignment = .center
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    private let englishLabel: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 36, weight: .bold)
        l.textAlignment = .center
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    private let vietnameseLabel: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 22)
        l.textColor = .secondaryLabel
        l.textAlignment = .center
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    private let exampleLabel: UILabel = {
        let l = UILabel()
        l.font = .italicSystemFont(ofSize: 16)
        l.textColor = .secondaryLabel
        l.textAlignment = .center
        l.numberOfLines = 2
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    private let speakButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("🔊  Nghe phát âm", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        btn.backgroundColor = .systemBlue
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 14
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    private let speakSlowButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("🐢  Nghe chậm", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        btn.backgroundColor = .systemGreen
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 14
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private let exampleButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("▶️ Phát ví dụ", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        btn.backgroundColor = .systemCyan
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 14
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    init(word: Word, topic: Topic) {
        self.word = word
        self.topic = topic
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) { fatalError() }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = word.english
        setupUI()
        // Tự phát âm khi mở màn hình
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.speak(rate: 0.4, words: self.word.english)
        }
    }

    private func setupUI() {
        [emojiLabel, englishLabel, vietnameseLabel, exampleLabel,
         speakButton, speakSlowButton, exampleButton].forEach { view.addSubview($0) }

        emojiLabel.text = word.emoji
        englishLabel.text = word.english
        vietnameseLabel.text = word.vietnamese
        exampleLabel.text = "📖 \(word.example)\n       \(word.exampleVietnamese)"

        NSLayoutConstraint.activate([
            emojiLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emojiLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),

            englishLabel.topAnchor.constraint(equalTo: emojiLabel.bottomAnchor, constant: 16),
            englishLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            englishLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),

            vietnameseLabel.topAnchor.constraint(equalTo: englishLabel.bottomAnchor, constant: 8),
            vietnameseLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            vietnameseLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),

            exampleLabel.topAnchor.constraint(equalTo: vietnameseLabel.bottomAnchor, constant: 24),
            exampleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            exampleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),

            speakButton.topAnchor.constraint(equalTo: exampleLabel.bottomAnchor, constant: 48),
            speakButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            speakButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            speakButton.heightAnchor.constraint(equalToConstant: 54),

            speakSlowButton.topAnchor.constraint(equalTo: speakButton.bottomAnchor, constant: 12),
            speakSlowButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            speakSlowButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            speakSlowButton.heightAnchor.constraint(equalToConstant: 54),
            
            exampleButton.topAnchor.constraint(equalTo: speakSlowButton.bottomAnchor, constant: 12),
            exampleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            exampleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            exampleButton.heightAnchor.constraint(equalToConstant: 54),
        ])

        speakButton.addTarget(self, action: #selector(speakNormal), for: .touchUpInside)
        speakSlowButton.addTarget(self, action: #selector(speakSlow), for: .touchUpInside)
        exampleButton.addTarget(self, action: #selector(speakExample), for: .touchUpInside)
    }

    @objc private func speakNormal() { speak(rate: 0.4, words: word.english) }
    @objc private func speakSlow() { speak(rate: 0.25, words: word.english) }
    @objc private func speakExample() { speak(rate: 0.25, words: word.example) }

    private func speak(rate: Float, words: String) {
        synthesizer.stopSpeaking(at: .immediate)
        let utterance = AVSpeechUtterance(string: words)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = rate
        utterance.pitchMultiplier = 1.1
        synthesizer.speak(utterance)
    }
}

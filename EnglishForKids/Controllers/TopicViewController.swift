//
//  TopicViewController.swift
//  EnglishForKids
//
//  Created by ThienDD9 on 17/6/26.
//

import UIKit
import AVFoundation

class TopicViewController: UIViewController {

    private let topic: Topic
    private let synthesizer = AVSpeechSynthesizer()

    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.rowHeight = 90
        tv.separatorStyle = .none
        tv.register(WordCell.self, forCellReuseIdentifier: WordCell.identifier)
        return tv
    }()

    private let quizButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("🎮  Làm bài Quiz", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        btn.backgroundColor = .systemBlue
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 14
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    init(topic: Topic) {
        self.topic = topic
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) { fatalError() }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\(topic.emoji) \(topic.name)"
        view.backgroundColor = .systemBackground
        setupUI()
    }

    private func setupUI() {
        [tableView, quizButton].forEach { view.addSubview($0) }

        tableView.delegate = self
        tableView.dataSource = self

        NSLayoutConstraint.activate([
            quizButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            quizButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            quizButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            quizButton.heightAnchor.constraint(equalToConstant: 54),

            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: quizButton.topAnchor, constant: -12),
        ])

        quizButton.addTarget(self, action: #selector(openQuiz), for: .touchUpInside)
    }

    @objc private func openQuiz() {
        let vc = QuizViewController(topic: topic)
        navigationController?.pushViewController(vc, animated: true)
    }

    private func speak(_ text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.4  // chậm hơn cho trẻ em
        utterance.pitchMultiplier = 1.1
        synthesizer.speak(utterance)
    }
}

extension TopicViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topic.words.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WordCell.identifier, for: indexPath) as! WordCell
        cell.configure(with: topic.words[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let word = topic.words[indexPath.row]

        // Phát âm khi tap
        speak(word.english)

        // Mở màn hình chi tiết
        let vc = WordDetailViewController(word: word, topic: topic)
        navigationController?.pushViewController(vc, animated: true)
    }
}

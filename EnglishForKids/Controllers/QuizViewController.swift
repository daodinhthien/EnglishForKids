//
//  QuizViewController.swift
//  EnglishForKids
//
//  Created by ThienDD9 on 17/6/26.
//

import UIKit
import AVFoundation

enum QuizType {
    case multipleChoice
    case matching
}

class QuizViewController: UIViewController {

    private let topic: Topic
    private let synthesizer = AVSpeechSynthesizer()
    private var currentQuizType: QuizType = .multipleChoice
    private var score = 0
    private var questionIndex = 0
    private var questions: [Word] = []

    // Multiple choice
    private let questionCard: UIView = {
        let v = UIView()
        v.backgroundColor = .secondarySystemBackground
        v.layer.cornerRadius = 20
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    private let emojiLabel: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 60)
        l.textAlignment = .center
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    private let questionLabel: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 22, weight: .bold)
        l.textAlignment = .center
        l.numberOfLines = 2
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    private let progressLabel: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 14)
        l.textColor = .secondaryLabel
        l.textAlignment = .center
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    private let scoreLabel: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 16, weight: .semibold)
        l.textColor = .systemOrange
        l.textAlignment = .right
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    private var answerButtons: [UIButton] = []

    // Matching
    private var matchingContainer: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 16
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()

    private var leftWords: [Word] = []
    private var rightWords: [Word] = []
    private var selectedLeft: Int? = nil
    private var leftButtons: [UIButton] = []
    private var rightButtons: [UIButton] = []
    private var matchedPairs: Set<String> = []

    init(topic: Topic) {
        self.topic = topic
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) { fatalError() }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Quiz: \(topic.name)"
        setupQuizTypeSelector()
        startMultipleChoice()
    }

    // MARK: - Quiz Type Selector
    private func setupQuizTypeSelector() {
        let segmented = UISegmentedControl(items: ["Chọn đáp án", "Nối từ"])
        segmented.selectedSegmentIndex = 0
        segmented.translatesAutoresizingMaskIntoConstraints = false
        segmented.addTarget(self, action: #selector(quizTypeChanged(_:)), for: .valueChanged)
        view.addSubview(segmented)

        view.addSubview(progressLabel)
        view.addSubview(scoreLabel)

        NSLayoutConstraint.activate([
            segmented.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            segmented.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            segmented.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            progressLabel.topAnchor.constraint(equalTo: segmented.bottomAnchor, constant: 8),
            progressLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),

            scoreLabel.centerYAnchor.constraint(equalTo: progressLabel.centerYAnchor),
            scoreLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }

    @objc private func quizTypeChanged(_ sender: UISegmentedControl) {
        clearQuiz()
        if sender.selectedSegmentIndex == 0 {
            startMultipleChoice()
        } else {
            startMatching()
        }
    }

    private func clearQuiz() {
        view.subviews.forEach {
            if $0 != view.subviews[0] { // giữ segmented
                if $0 is UISegmentedControl || $0 == progressLabel || $0 == scoreLabel { return }
                $0.removeFromSuperview()
            }
        }
        answerButtons.removeAll()
        leftButtons.removeAll()
        rightButtons.removeAll()
    }

    // MARK: - Multiple Choice
    private func startMultipleChoice() {
        currentQuizType = .multipleChoice
        questions = topic.words.shuffled()
        questionIndex = 0
        score = 0
        setupMultipleChoiceUI()
        showNextQuestion()
    }

    private func setupMultipleChoiceUI() {
        view.addSubview(questionCard)
        questionCard.addSubview(emojiLabel)
        questionCard.addSubview(questionLabel)

        NSLayoutConstraint.activate([
            questionCard.topAnchor.constraint(equalTo: progressLabel.bottomAnchor, constant: 16),
            questionCard.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            questionCard.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            questionCard.heightAnchor.constraint(equalToConstant: 160),

            emojiLabel.topAnchor.constraint(equalTo: questionCard.topAnchor, constant: 16),
            emojiLabel.centerXAnchor.constraint(equalTo: questionCard.centerXAnchor),

            questionLabel.topAnchor.constraint(equalTo: emojiLabel.bottomAnchor, constant: 8),
            questionLabel.leadingAnchor.constraint(equalTo: questionCard.leadingAnchor, constant: 12),
            questionLabel.trailingAnchor.constraint(equalTo: questionCard.trailingAnchor, constant: -12),
        ])

        // 4 answer buttons
        var prevButton: UIButton? = nil
        for i in 0..<4 {
            let btn = UIButton(type: .system)
            btn.titleLabel?.font = .systemFont(ofSize: 17, weight: .medium)
            btn.backgroundColor = .secondarySystemBackground
            btn.setTitleColor(.label, for: .normal)
            btn.layer.cornerRadius = 12
            btn.tag = i
            btn.titleLabel?.numberOfLines = 2
            btn.titleLabel?.textAlignment = .center
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.addTarget(self, action: #selector(answerTapped(_:)), for: .touchUpInside)
            view.addSubview(btn)
            answerButtons.append(btn)

            let topAnchor = prevButton == nil
                ? questionCard.bottomAnchor
                : prevButton!.bottomAnchor
            let topConstant: CGFloat = prevButton == nil ? 16 : 12

            NSLayoutConstraint.activate([
                btn.topAnchor.constraint(equalTo: topAnchor, constant: topConstant),
                btn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                btn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                btn.heightAnchor.constraint(equalToConstant: 54),
            ])
            prevButton = btn
        }
    }

    private func showNextQuestion() {
        guard questionIndex < questions.count else {
            showResult()
            return
        }

        let current = questions[questionIndex]
        progressLabel.text = "Câu \(questionIndex + 1)/\(questions.count)"
        scoreLabel.text = "⭐ \(score)"
        emojiLabel.text = current.emoji
        questionLabel.text = "\"\(current.english)\" nghĩa là gì?"

        // Phát âm từ
        speak(current.english)

        // Tạo 4 đáp án: 1 đúng + 3 sai
        var wrongAnswers = topic.words.filter { $0.english != current.english }.shuffled().prefix(3)
        var options = Array(wrongAnswers) + [current]
        options.shuffle()

        for (i, btn) in answerButtons.enumerated() {
            btn.setTitle(options[i].vietnamese, for: .normal)
            btn.backgroundColor = .secondarySystemBackground
            btn.setTitleColor(.label, for: .normal)
            btn.isEnabled = true
            btn.tag = (options[i].english == current.english) ? 99 : i
        }
    }

    @objc private func answerTapped(_ sender: UIButton) {
        answerButtons.forEach { $0.isEnabled = false }

        if sender.tag == 99 {
            // Đúng
            sender.backgroundColor = .systemGreen
            sender.setTitleColor(.white, for: .normal)
            score += 1
            playSound(correct: true)
        } else {
            // Sai
            sender.backgroundColor = .systemRed
            sender.setTitleColor(.white, for: .normal)
            // Highlight đáp án đúng
            answerButtons.first(where: { $0.tag == 99 })?.backgroundColor = .systemGreen
            answerButtons.first(where: { $0.tag == 99 })?.setTitleColor(.white, for: .normal)
            playSound(correct: false)
        }

        questionIndex += 1
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            self.showNextQuestion()
        }
    }

    // MARK: - Matching
    private func startMatching() {
        currentQuizType = .matching
        matchedPairs = []
        selectedLeft = nil
        leftWords = Array(topic.words.shuffled().prefix(5))
        rightWords = leftWords.shuffled()
        setupMatchingUI()
    }

    private func setupMatchingUI() {
        let titleLabel = UILabel()
        titleLabel.text = "Nối từ tiếng Anh với nghĩa tiếng Việt!"
        titleLabel.font = .systemFont(ofSize: 15, weight: .medium)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .secondaryLabel
        titleLabel.numberOfLines = 2
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)

        let leftStack = UIStackView()
        leftStack.axis = .vertical
        leftStack.spacing = 10
        leftStack.translatesAutoresizingMaskIntoConstraints = false

        let rightStack = UIStackView()
        rightStack.axis = .vertical
        rightStack.spacing = 10
        rightStack.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(titleLabel)
        view.addSubview(leftStack)
        view.addSubview(rightStack)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: progressLabel.bottomAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            leftStack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            leftStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            leftStack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.44),

            rightStack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            rightStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            rightStack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.44),
        ])

        for (i, word) in leftWords.enumerated() {
            let btn = UIButton(type: .system)
            btn.setTitle("\(word.emoji) \(word.english)", for: .normal)
            btn.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
            btn.backgroundColor = .secondarySystemBackground
            btn.setTitleColor(.label, for: .normal)
            btn.layer.cornerRadius = 10
            btn.tag = i
            btn.heightAnchor.constraint(equalToConstant: 50).isActive = true
            btn.addTarget(self, action: #selector(leftTapped(_:)), for: .touchUpInside)
            leftStack.addArrangedSubview(btn)
            leftButtons.append(btn)
        }

        for (i, word) in rightWords.enumerated() {
            let btn = UIButton(type: .system)
            btn.setTitle(word.vietnamese, for: .normal)
            btn.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
            btn.backgroundColor = .secondarySystemBackground
            btn.setTitleColor(.label, for: .normal)
            btn.layer.cornerRadius = 10
            btn.tag = i
            btn.heightAnchor.constraint(equalToConstant: 50).isActive = true
            btn.addTarget(self, action: #selector(rightTapped(_:)), for: .touchUpInside)
            rightStack.addArrangedSubview(btn)
            rightButtons.append(btn)
        }

        progressLabel.text = "Nối \(leftWords.count) cặp từ"
        scoreLabel.text = "⭐ 0/\(leftWords.count)"
    }

    @objc private func leftTapped(_ sender: UIButton) {
        // Reset highlight cũ
        leftButtons.forEach {
            if !matchedPairs.contains(leftWords[$0.tag].english) {
                $0.backgroundColor = .secondarySystemBackground
            }
        }
        selectedLeft = sender.tag
        sender.backgroundColor = .systemBlue.withAlphaComponent(0.3)
        speak(leftWords[sender.tag].english)
    }

    @objc private func rightTapped(_ sender: UIButton) {
        guard let left = selectedLeft else { return }
        let leftWord = leftWords[left]
        let rightWord = rightWords[sender.tag]

        if leftWord.english == rightWord.english {
            // Đúng
            leftButtons[left].backgroundColor = .systemGreen
            leftButtons[left].setTitleColor(.white, for: .normal)
            sender.backgroundColor = .systemGreen
            sender.setTitleColor(.white, for: .normal)
            leftButtons[left].isEnabled = false
            sender.isEnabled = false
            matchedPairs.insert(leftWord.english)
            score += 1
            scoreLabel.text = "⭐ \(score)/\(leftWords.count)"
            playSound(correct: true)

            if matchedPairs.count == leftWords.count {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                    self.showResult()
                }
            }
        } else {
            // Sai
            sender.backgroundColor = .systemRed.withAlphaComponent(0.3)
            playSound(correct: false)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                sender.backgroundColor = .secondarySystemBackground
            }
        }
        selectedLeft = nil
        leftButtons.forEach {
            if !self.matchedPairs.contains(self.leftWords[$0.tag].english) {
                $0.backgroundColor = .secondarySystemBackground
            }
        }
    }

    // MARK: - Result
    private func showResult() {
        let total = currentQuizType == .multipleChoice ? questions.count : leftWords.count
        let percent = Int(Double(score) / Double(total) * 100)

        let emoji: String
        let message: String
        switch percent {
        case 90...100:
            emoji = "🏆"; message = "Xuất sắc! Bạn thật giỏi!"
        case 70...89:
            emoji = "🌟"; message = "Giỏi lắm! Cố gắng thêm nhé!"
        case 50...69:
            emoji = "😊"; message = "Khá tốt! Ôn thêm nhé!"
        default:
            emoji = "💪"; message = "Cố lên! Học thêm rồi thử lại!"
        }

        let alert = UIAlertController(
            title: "\(emoji) Kết quả",
            message: "\(message)\n\nĐúng: \(score)/\(total) câu\n\(percent)% chính xác",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "🔄 Làm lại", style: .default) { _ in
            self.clearQuiz()
            if self.currentQuizType == .multipleChoice {
                self.startMultipleChoice()
            } else {
                self.startMatching()
            }
        })
        alert.addAction(UIAlertAction(title: "📚 Học tiếp", style: .cancel) { _ in
            self.navigationController?.popViewController(animated: true)
        })
        present(alert, animated: true)
    }

    // MARK: - Helpers
    private func speak(_ text: String) {
        synthesizer.stopSpeaking(at: .immediate)
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.4
        utterance.pitchMultiplier = 1.1
        synthesizer.speak(utterance)
    }

    private func playSound(correct: Bool) {
        // Dùng haptic feedback thay vì âm thanh để đơn giản
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(correct ? .success : .error)
    }
}

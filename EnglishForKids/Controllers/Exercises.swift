import UIKit

// MARK: - Match Exercise

class MatchViewController: UIViewController {

    private var allpairs: [MatchPair] = []
    private var pairs: [MatchPair] = []
    private var rightItems: [MatchPair] = []
    private var selectedLeftIndex: Int? = nil
    private var matchedPairs: Set<Int> = []
    private var score = 0

    private var leftButtons: [ChipButton] = []
    private var rightButtons: [ChipButton] = []
    private let resultLabel = UILabel()
    private let progressLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Nối từ với nghĩa"
        view.backgroundColor = Theme.background
        allpairs = (APIService.share.response?.matchPairs ?? []).shuffled()
        let randomPairs = Array(allpairs.shuffled().prefix(min(10, allpairs.count)))
        pairs = randomPairs.shuffled()
        rightItems = randomPairs.shuffled()
        setupUI()
    }

    private func setupUI() {
        // ScrollView
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor), // dùng contentLayoutGuide
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor), // dùng frameLayoutGuide
        ])
        
        progressLabel.font = .systemFont(ofSize: 14)
        progressLabel.textColor = Theme.textSecondary
        progressLabel.textAlignment = .center
        updateProgress()

        let instructionLabel = UILabel()
        instructionLabel.text = "Bấm vào từ bên trái, rồi bấm nghĩa bên phải để nối!"
        instructionLabel.font = .systemFont(ofSize: 13)
        instructionLabel.textColor = Theme.textSecondary
        instructionLabel.numberOfLines = 0
        instructionLabel.textAlignment = .center

        let leftStack = UIStackView()
        leftStack.axis = .vertical
        leftStack.spacing = 10

        let rightStack = UIStackView()
        rightStack.axis = .vertical
        rightStack.spacing = 10

        for (i, pair) in pairs.enumerated() {
            let btn = ChipButton(title: pair.left.removingEmojis)
            btn.tag = i
            btn.addTarget(self, action: #selector(leftTapped(_:)), for: .touchUpInside)
            leftStack.addArrangedSubview(btn)
            leftButtons.append(btn)
        }

        for (i, pair) in rightItems.enumerated() {
            let btn = ChipButton(title: pair.right)
            btn.tag = i
            btn.addTarget(self, action: #selector(rightTapped(_:)), for: .touchUpInside)
            rightStack.addArrangedSubview(btn)
            rightButtons.append(btn)
        }

        let columnsStack = UIStackView(arrangedSubviews: [leftStack, rightStack])
        columnsStack.axis = .horizontal
        columnsStack.spacing = 12
        columnsStack.distribution = .fillEqually

        resultLabel.font = .systemFont(ofSize: 14, weight: .medium)
        resultLabel.textAlignment = .center
        resultLabel.layer.cornerRadius = Theme.cornerMd
        resultLabel.clipsToBounds = true
        resultLabel.alpha = 0
        resultLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true

        let mainStack = UIStackView(arrangedSubviews: [progressLabel, instructionLabel, columnsStack, resultLabel])
        mainStack.axis = .vertical
        mainStack.spacing = 16
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(mainStack)
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            mainStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            mainStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            mainStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20), // quan trọng để scroll đúng chiều cao
        ])
        scrollView.alwaysBounceVertical = true
    }

    @objc private func leftTapped(_ sender: ChipButton) {
        guard !matchedPairs.contains(sender.tag) else { return }
        leftButtons.forEach { $0.setSelected(false) }
        sender.setSelected(true)
        selectedLeftIndex = sender.tag
    }

    @objc private func rightTapped(_ sender: ChipButton) {
        guard let leftIdx = selectedLeftIndex else { return }
        let leftPair = pairs[leftIdx]
        let rightPair = rightItems[sender.tag]

        if leftPair.right == rightPair.right {
            SoundManager.shared.playCorrect()
            leftButtons[leftIdx].setMatched()
            sender.setMatched()
            matchedPairs.insert(leftIdx)
            score += 1
            updateProgress()
            showMsg("✅ Đúng rồi!", correct: true)
            if matchedPairs.count == pairs.count {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { self.showFinal() }
            }
        } else {
            SoundManager.shared.playWrong()
            leftButtons[leftIdx].setWrong()
            sender.setWrong()
            showMsg("❌ Sai! Thử lại nhé!", correct: false)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                self.leftButtons[leftIdx].setSelected(false)
                UIView.animate(withDuration: 0.2) { self.resultLabel.alpha = 0 }
            }
        }
        selectedLeftIndex = nil
    }

    private func showMsg(_ msg: String, correct: Bool) {
        resultLabel.text = msg
        resultLabel.backgroundColor = correct ? Theme.greenLight : Theme.redLight
        resultLabel.textColor = correct ? Theme.green : Theme.red
        UIView.animate(withDuration: 0.2) { self.resultLabel.alpha = 1 }
    }

    private func updateProgress() {
        progressLabel.text = "Đã nối: \(matchedPairs.count) / \(pairs.count)  •  ⭐ \(score)"
    }

    private func showFinal() {
        let vc = ScoreViewController(score: score, total: pairs.count, title: "Nối từ với nghĩa")
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Picture Quiz

class PictureQuizViewController: UIViewController {

    private var questions: [PictureQuestion] = []
    private var currentIndex = 0
    private var score = 0
    private var answered = false

    private let progressLabel = UILabel()
    private let questionLabel = UILabel()
    private var optionButtons: [UIButton] = []
    private let nextButton = UIButton(type: .system)
    private var gridStack: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Chọn hình đúng"
        view.backgroundColor = Theme.background
        setupUI()
        loadQuestion()
    }

    private func setupUI() {
        questions = APIService.share.response?.pictureQuestions ?? []
        progressLabel.font = .systemFont(ofSize: 14)
        progressLabel.textColor = Theme.textSecondary
        progressLabel.textAlignment = .center

        questionLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        questionLabel.textColor = Theme.textPrimary
        questionLabel.textAlignment = .center
        questionLabel.numberOfLines = 0

        // 2x2 grid
        let row1 = UIStackView()
        row1.axis = .horizontal
        row1.spacing = 12
        row1.distribution = .fillEqually

        let row2 = UIStackView()
        row2.axis = .horizontal
        row2.spacing = 12
        row2.distribution = .fillEqually

        for i in 0..<4 {
            let btn = makePictureButton(tag: i)
            (i < 2 ? row1 : row2).addArrangedSubview(btn)
            optionButtons.append(btn)
        }

        gridStack = UIStackView(arrangedSubviews: [row1, row2])
        gridStack.axis = .vertical
        gridStack.spacing = 12

        nextButton.setTitle("Câu tiếp theo →", for: .normal)
        nextButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.backgroundColor = Theme.purple
        nextButton.layer.cornerRadius = Theme.cornerMd
        nextButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        nextButton.alpha = 0
        nextButton.addTarget(self, action: #selector(nextQuestion), for: .touchUpInside)

        let mainStack = UIStackView(arrangedSubviews: [progressLabel, questionLabel, gridStack, nextButton])
        mainStack.axis = .vertical
        mainStack.spacing = 20
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainStack)
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }

    private func makePictureButton(tag: Int) -> UIButton {
        let btn = UIButton(type: .system)
        btn.tag = tag
        btn.backgroundColor = Theme.surface
        btn.layer.cornerRadius = Theme.cornerLg
        btn.layer.borderWidth = 0.5
        btn.layer.borderColor = Theme.border.cgColor
        btn.heightAnchor.constraint(equalToConstant: 120).isActive = true
        btn.addTarget(self, action: #selector(optionTapped(_:)), for: .touchUpInside)
        return btn
    }

    private func loadQuestion() {
        guard currentIndex < questions.count else { showFinal(); return }
        answered = false
        let q = questions[currentIndex]
        progressLabel.text = "Câu \(currentIndex + 1) / \(questions.count)  •  ⭐ \(score)"
        questionLabel.text = q.question

        for (i, btn) in optionButtons.enumerated() {
            btn.backgroundColor = Theme.surface
            btn.layer.borderColor = Theme.border.cgColor
            btn.isUserInteractionEnabled = true
            let opt = q.options[i]
            let emoji = UILabel()
            emoji.text = opt.emoji
            emoji.font = .systemFont(ofSize: 40)
            emoji.textAlignment = .center
            let lbl = UILabel()
            lbl.text = opt.label
            lbl.font = .systemFont(ofSize: 13, weight: .medium)
            lbl.textColor = Theme.textPrimary
            lbl.textAlignment = .center
            let stack = UIStackView(arrangedSubviews: [emoji, lbl])
            stack.axis = .vertical
            stack.spacing = 4
            stack.isUserInteractionEnabled = false
            stack.translatesAutoresizingMaskIntoConstraints = false
            btn.subviews.forEach { $0.removeFromSuperview() }
            btn.addSubview(stack)
            NSLayoutConstraint.activate([
                stack.centerXAnchor.constraint(equalTo: btn.centerXAnchor),
                stack.centerYAnchor.constraint(equalTo: btn.centerYAnchor),
            ])
        }
        nextButton.alpha = 0
    }

    @objc private func optionTapped(_ sender: UIButton) {
        guard !answered else { return }
        answered = true
        let q = questions[currentIndex]
        let correct = sender.tag == q.correctIndex

        if correct { score += 1 }
        optionButtons.forEach { btn in
            btn.isUserInteractionEnabled = false
            if btn.tag == q.correctIndex {
                SoundManager.shared.playCorrect()
                btn.backgroundColor = Theme.greenLight
                btn.layer.borderColor = Theme.green.cgColor
            } else if btn.tag == sender.tag && !correct {
                SoundManager.shared.playWrong()
                btn.backgroundColor = Theme.redLight
                btn.layer.borderColor = Theme.red.cgColor
            }
        }

        UIView.animate(withDuration: 0.3) { self.nextButton.alpha = 1 }
        progressLabel.text = "Câu \(currentIndex + 1) / \(questions.count)  •  ⭐ \(score)"
    }

    @objc private func nextQuestion() {
        currentIndex += 1
        loadQuestion()
    }

    private func showFinal() {
        let vc = ScoreViewController(score: score, total: questions.count, title: "Chọn hình đúng")
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Arrange Sentence

class ArrangeViewController: UIViewController {

    private var exercises: [ArrangeExercise] = []
    private var currentIndex = 0
    private var score = 0
    private var arrangedWords: [String] = []
    private var sourceWords: [String] = []

    private let progressLabel = UILabel()
    private let hintLabel = UILabel()
    private let dropArea = UIView()
    private let dropStack = UIStackView()
    private let dropPlaceholder = UILabel()
    private let sourceStack = UIStackView()
    private let resultLabel = UILabel()
    private let checkButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sắp xếp câu"
        view.backgroundColor = Theme.background
        setupUI()
        loadQuestion()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        addDashedBorder(to: dropArea)
    }
    
    private func addDashedBorder(to view: UIView) {
        let dashed = CAShapeLayer()
        dashed.strokeColor = Theme.purpleMid.cgColor
        dashed.fillColor = UIColor.clear.cgColor
        dashed.lineDashPattern = [6, 3]
        dashed.lineWidth = 1.5
        dashed.frame = view.bounds
        dashed.path = UIBezierPath(roundedRect: view.bounds, cornerRadius: Theme.cornerMd).cgPath
        view.layer.addSublayer(dashed)
    }
    
    private func setupUI() {
        exercises = APIService.share.response?.arrangeExercises ?? []
        progressLabel.font = .systemFont(ofSize: 14)
        progressLabel.textColor = Theme.textSecondary
        progressLabel.textAlignment = .center

        hintLabel.font = .systemFont(ofSize: 13)
        hintLabel.textColor = Theme.textSecondary
        hintLabel.numberOfLines = 0
        hintLabel.textAlignment = .center

        // Drop area
        dropArea.backgroundColor = Theme.surface
        dropArea.layer.cornerRadius = Theme.cornerMd

        dropPlaceholder.text = "Bấm vào các từ để sắp xếp câu..."
        dropPlaceholder.font = .systemFont(ofSize: 13)
        dropPlaceholder.textColor = Theme.textSecondary
        dropPlaceholder.textAlignment = .center

        dropStack.axis = .horizontal
        dropStack.spacing = 6
        dropStack.isLayoutMarginsRelativeArrangement = true

        [dropPlaceholder, dropStack].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            dropArea.addSubview($0)
        }
        NSLayoutConstraint.activate([
            dropPlaceholder.centerXAnchor.constraint(equalTo: dropArea.centerXAnchor),
            dropPlaceholder.centerYAnchor.constraint(equalTo: dropArea.centerYAnchor),
            dropStack.topAnchor.constraint(equalTo: dropArea.topAnchor, constant: 10),
            dropStack.leadingAnchor.constraint(equalTo: dropArea.leadingAnchor, constant: 10),
            dropStack.trailingAnchor.constraint(lessThanOrEqualTo: dropArea.trailingAnchor, constant: -10),
            dropStack.bottomAnchor.constraint(equalTo: dropArea.bottomAnchor, constant: -10),
            dropArea.heightAnchor.constraint(greaterThanOrEqualToConstant: 56),
        ])

        // Source words
        sourceStack.axis = .horizontal
        sourceStack.spacing = 8
        sourceStack.isLayoutMarginsRelativeArrangement = true

        // Result
        resultLabel.font = .systemFont(ofSize: 14, weight: .medium)
        resultLabel.textAlignment = .center
        resultLabel.layer.cornerRadius = Theme.cornerMd
        resultLabel.clipsToBounds = true
        resultLabel.alpha = 0
        resultLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true

        // Check button
        checkButton.setTitle("Kiểm tra ✓", for: .normal)
        checkButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        checkButton.setTitleColor(.white, for: .normal)
        checkButton.backgroundColor = Theme.purple
        checkButton.layer.cornerRadius = Theme.cornerMd
        checkButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        checkButton.addTarget(self, action: #selector(checkAnswer), for: .touchUpInside)

        let mainStack = UIStackView(arrangedSubviews: [progressLabel, hintLabel, dropArea, sourceStack, resultLabel, checkButton])
        mainStack.axis = .vertical
        mainStack.spacing = 16
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainStack)
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }

    private func loadQuestion() {
        guard currentIndex < exercises.count else { showFinal(); return }
        let ex = exercises[currentIndex]
        arrangedWords = []
        sourceWords = ex.words.shuffled()
        progressLabel.text = "Câu \(currentIndex + 1) / \(exercises.count)  •  ⭐ \(score)"
        hintLabel.text = ex.hint
        resultLabel.alpha = 0
        renderDropArea()
        renderSource()
    }

    private func renderDropArea() {
        dropStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
        dropPlaceholder.isHidden = !arrangedWords.isEmpty
        for (i, word) in arrangedWords.enumerated() {
            let chip = ChipButton(title: word)
            chip.tag = i
            chip.setSelected(true)
            chip.addTarget(self, action: #selector(removeWord(_:)), for: .touchUpInside)
            dropStack.addArrangedSubview(chip)
        }
    }

    private func renderSource() {
        sourceStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
        var usedCopy = arrangedWords
        for (i, word) in sourceWords.enumerated() {
            let chip = ChipButton(title: word)
            chip.tag = i
            let isUsed = usedCopy.contains(word)
            if isUsed { usedCopy.removeFirst(where: { $0 == word }); chip.setUsed(true) }
            chip.addTarget(self, action: #selector(addWord(_:)), for: .touchUpInside)
            sourceStack.addArrangedSubview(chip)
        }
    }

    @objc private func addWord(_ sender: ChipButton) {
        guard let word = sender.title(for: .normal), !sender.isUserInteractionEnabled == false else { return }
        arrangedWords.append(word)
        renderDropArea()
        renderSource()
    }

    @objc private func removeWord(_ sender: UIButton) {
        guard sender.tag < arrangedWords.count else { return }
        arrangedWords.remove(at: sender.tag)
        renderDropArea()
        renderSource()
    }

    @objc private func checkAnswer() {
        guard !arrangedWords.isEmpty else { return }
        let ex = exercises[currentIndex]
        let userAnswer = arrangedWords.joined(separator: " ")
        let correct = userAnswer == ex.answer

        if correct {
            SoundManager.shared.playCorrect()
            score += 1
            showResult("✅ Đúng rồi! \"\(ex.answer)\"", correct: true)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                self.currentIndex += 1
                self.loadQuestion()
            }
        } else {
            SoundManager.shared.playWrong()
            showResult("❌ Sai rồi! Thử lại nhé!", correct: false)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                self.arrangedWords = []
                self.renderDropArea()
                self.renderSource()
                UIView.animate(withDuration: 0.2) { self.resultLabel.alpha = 0 }
            }
        }
    }

    private func showResult(_ msg: String, correct: Bool) {
        resultLabel.text = msg
        resultLabel.backgroundColor = correct ? Theme.greenLight : Theme.redLight
        resultLabel.textColor = correct ? Theme.green : Theme.red
        UIView.animate(withDuration: 0.2) { self.resultLabel.alpha = 1 }
    }

    private func showFinal() {
        let vc = ScoreViewController(score: score, total: exercises.count, title: "Sắp xếp câu")
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension Array {
    mutating func removeFirst(where condition: (Element) -> Bool) {
        if let idx = firstIndex(where: condition) { remove(at: idx) }
    }
}

// MARK: - Score Screen

class ScoreViewController: UIViewController {

    private let score: Int
    private let total: Int
    private let exerciseTitle: String

    init(score: Int, total: Int, title: String) {
        self.score = score; self.total = total; self.exerciseTitle = title
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) { fatalError() }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Kết quả"
        view.backgroundColor = Theme.background
        navigationItem.hidesBackButton = true
        setupUI()
    }

    private func setupUI() {
        SoundManager.shared.playComplete()
        let pct = total > 0 ? Double(score) / Double(total) : 0
        let (emoji, msg) = pct >= 0.8 ? ("🏆", "Xuất sắc!") : pct >= 0.5 ? ("⭐", "Khá tốt!") : ("💪", "Cố lên nhé!")

        let emojiLabel = UILabel()
        emojiLabel.text = emoji
        emojiLabel.font = .systemFont(ofSize: 72)
        emojiLabel.textAlignment = .center

        let msgLabel = UILabel()
        msgLabel.text = msg
        msgLabel.font = .systemFont(ofSize: 28, weight: .bold)
        msgLabel.textColor = Theme.purple
        msgLabel.textAlignment = .center

        let scoreLabel = UILabel()
        scoreLabel.text = "\(score) / \(total)"
        scoreLabel.font = .systemFont(ofSize: 48, weight: .bold)
        scoreLabel.textColor = Theme.textPrimary
        scoreLabel.textAlignment = .center

        let subtitleLabel = UILabel()
        subtitleLabel.text = exerciseTitle
        subtitleLabel.font = .systemFont(ofSize: 14)
        subtitleLabel.textColor = Theme.textSecondary
        subtitleLabel.textAlignment = .center

        let retryBtn = Theme.pillButton(title: "🔄  Làm lại", target: self, action: #selector(retry))
        let menuBtn = UIButton(type: .system)
        menuBtn.setTitle("← Về menu", for: .normal)
        menuBtn.titleLabel?.font = .systemFont(ofSize: 15)
        menuBtn.setTitleColor(Theme.purple, for: .normal)
        menuBtn.addTarget(self, action: #selector(goMenu), for: .touchUpInside)

        let btnStack = UIStackView(arrangedSubviews: [retryBtn, menuBtn])
        btnStack.axis = .vertical
        btnStack.spacing = 12
        btnStack.alignment = .center

        let mainStack = UIStackView(arrangedSubviews: [emojiLabel, msgLabel, scoreLabel, subtitleLabel, btnStack])
        mainStack.axis = .vertical
        mainStack.spacing = 16
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainStack)
        NSLayoutConstraint.activate([
            mainStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
        ])

        retryBtn.widthAnchor.constraint(equalToConstant: 180).isActive = true
    }

    @objc private func retry() {
        navigationController?.popViewController(animated: true)
    }

    @objc private func goMenu() {
        navigationController?.popToRootViewController(animated: true)
    }
}

extension String {
    var removingEmojis: String {
        unicodeScalars
            .filter { !$0.properties.isEmojiPresentation }
            .reduce("") { $0 + String($1) }
    }
}

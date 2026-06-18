import UIKit

class DialogueListViewController: UIViewController {

    private let topics = AppData.dialogues
    private var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "💬 Hội thoại"
        view.backgroundColor = Theme.background
        navigationController?.navigationBar.prefersLargeTitles = true
        setupCollectionView()
    }

    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 14
        let cols: CGFloat = 2
        let width = (UIScreen.main.bounds.width - spacing * (cols + 1)) / cols
        layout.itemSize = CGSize(width: width, height: width * 0.9)
        layout.minimumInteritemSpacing = spacing
        layout.minimumLineSpacing = spacing
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(DialogueCell.self, forCellWithReuseIdentifier: DialogueCell.id)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension DialogueListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ cv: UICollectionView, numberOfItemsInSection section: Int) -> Int { topics.count }

    func collectionView(_ cv: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cv.dequeueReusableCell(withReuseIdentifier: DialogueCell.id, for: indexPath) as! DialogueCell
        cell.configure(with: topics[indexPath.item])
        return cell
    }

    func collectionView(_ cv: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DialogueDetailViewController(topic: topics[indexPath.item])
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Topic Cell

class DialogueCell: UICollectionViewCell {
    static let id = "DialogueCell"

    private let emojiLabel = UILabel()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = Theme.surface
        contentView.layer.cornerRadius = Theme.cornerLg
        contentView.layer.borderWidth = 0.5
        contentView.layer.borderColor = Theme.border.cgColor
        contentView.clipsToBounds = true

        emojiLabel.font = .systemFont(ofSize: 44)
        emojiLabel.textAlignment = .center

        titleLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        titleLabel.textAlignment = .center
        titleLabel.textColor = Theme.textPrimary
        titleLabel.adjustsFontSizeToFitWidth = true

        subtitleLabel.font = .systemFont(ofSize: 12)
        subtitleLabel.textAlignment = .center
        subtitleLabel.textColor = Theme.textSecondary

        let stack = UIStackView(arrangedSubviews: [emojiLabel, titleLabel, subtitleLabel])
        stack.axis = .vertical
        stack.spacing = 4
        stack.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            stack.leadingAnchor.constraint(greaterThanOrEqualTo: contentView.leadingAnchor, constant: 8),
            stack.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -8),
        ])
    }

    required init?(coder: NSCoder) { fatalError() }

    func configure(with topic: DialogueTopic) {
        emojiLabel.text = topic.emoji
        titleLabel.text = topic.label
        subtitleLabel.text = topic.labelVn
    }

    override var isHighlighted: Bool {
        didSet { UIView.animate(withDuration: 0.1) { self.contentView.alpha = self.isHighlighted ? 0.6 : 1 } }
    }
}

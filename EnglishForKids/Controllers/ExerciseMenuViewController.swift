import UIKit

class ExerciseMenuViewController: UIViewController {

    private struct MenuItem {
        let emoji: String
        let title: String
        let subtitle: String
        let color: UIColor
        let borderColor: UIColor
        let vc: () -> UIViewController
    }

    private lazy var items: [MenuItem] = [
        MenuItem(emoji: "✏️", title: "Điền vào chỗ trống", subtitle: "Fill in the blank",
                 color: Theme.purpleLight, borderColor: Theme.purpleMid,
                 vc: { FillBlankViewController() }),
        MenuItem(emoji: "🔗", title: "Nối từ với nghĩa", subtitle: "Match the words",
                 color: UIColor(hex: "#E1F5EE"), borderColor: UIColor(hex: "#5DCAA5"),
                 vc: { MatchViewController() }),
        MenuItem(emoji: "🖼️", title: "Chọn hình đúng", subtitle: "Picture quiz",
                 color: UIColor(hex: "#FAEEDA"), borderColor: UIColor(hex: "#EF9F27"),
                 vc: { PictureQuizViewController() }),
        MenuItem(emoji: "🔀", title: "Sắp xếp câu", subtitle: "Arrange the sentence",
                 color: UIColor(hex: "#FAECE7"), borderColor: UIColor(hex: "#F0997B"),
                 vc: { ArrangeViewController() }),
    ]

    private var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "✏️ Bài tập"
        view.backgroundColor = Theme.background
        navigationController?.navigationBar.prefersLargeTitles = true

        tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.register(MenuItemCell.self, forCellReuseIdentifier: MenuItemCell.id)
        tableView.rowHeight = 76
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension ExerciseMenuViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tv: UITableView, numberOfRowsInSection s: Int) -> Int { items.count }

    func tableView(_ tv: UITableView, cellForRowAt ip: IndexPath) -> UITableViewCell {
        let cell = tv.dequeueReusableCell(withIdentifier: MenuItemCell.id, for: ip) as! MenuItemCell
        let item = items[ip.row]
        cell.configure(emoji: item.emoji, title: item.title, subtitle: item.subtitle,
                       color: item.color, borderColor: item.borderColor)
        return cell
    }

    func tableView(_ tv: UITableView, didSelectRowAt ip: IndexPath) {
        tv.deselectRow(at: ip, animated: true)
        let vc = items[ip.row].vc()
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Menu item cell

class MenuItemCell: UITableViewCell {
    static let id = "MenuItemCell"

    private let iconBg = UIView()
    private let iconLabel = UILabel()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let chevron = UIImageView(image: UIImage(systemName: "chevron.right"))

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    required init?(coder: NSCoder) { fatalError() }

    private func setupUI() {
        iconBg.layer.cornerRadius = 12
        iconBg.layer.borderWidth = 0.5

        iconLabel.font = .systemFont(ofSize: 28)
        iconLabel.textAlignment = .center

        titleLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        titleLabel.textColor = Theme.textPrimary

        subtitleLabel.font = .systemFont(ofSize: 13)
        subtitleLabel.textColor = Theme.textSecondary

        chevron.tintColor = Theme.border
        chevron.contentMode = .scaleAspectFit

        let textStack = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        textStack.axis = .vertical
        textStack.spacing = 2

        [iconBg, iconLabel, textStack, chevron].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }

        NSLayoutConstraint.activate([
            iconBg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            iconBg.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconBg.widthAnchor.constraint(equalToConstant: 48),
            iconBg.heightAnchor.constraint(equalToConstant: 48),

            iconLabel.centerXAnchor.constraint(equalTo: iconBg.centerXAnchor),
            iconLabel.centerYAnchor.constraint(equalTo: iconBg.centerYAnchor),

            textStack.leadingAnchor.constraint(equalTo: iconBg.trailingAnchor, constant: 14),
            textStack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            textStack.trailingAnchor.constraint(equalTo: chevron.leadingAnchor, constant: -8),

            chevron.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            chevron.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            chevron.widthAnchor.constraint(equalToConstant: 14),
        ])
    }

    func configure(emoji: String, title: String, subtitle: String, color: UIColor, borderColor: UIColor) {
        iconLabel.text = emoji
        titleLabel.text = title
        subtitleLabel.text = subtitle
        iconBg.backgroundColor = color
        iconBg.layer.borderColor = borderColor.cgColor
    }
}

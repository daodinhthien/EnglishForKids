import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let HomeNav = makeNav(
            root: HomeViewController(),
            title: "Home",
            image: "house",
            selectedImage: "house.fill"
        )
        
        let dialogueNav = makeNav(
            root: DialogueListViewController(),
            title: "Hội thoại",
            image: "message.circle",
            selectedImage: "message.circle.fill"
        )

        let exerciseNav = makeNav(
            root: ExerciseMenuViewController(),
            title: "Bài tập",
            image: "pencil.circle",
            selectedImage: "pencil.circle.fill"
        )

        viewControllers = [HomeNav, dialogueNav, exerciseNav]
        tabBar.tintColor = Theme.purple
    }

    private func makeNav(root: UIViewController, title: String, image: String, selectedImage: String) -> UINavigationController {
        root.tabBarItem = UITabBarItem(
            title: title,
            image: UIImage(systemName: image),
            selectedImage: UIImage(systemName: selectedImage)
        )
        return UINavigationController(rootViewController: root)
    }
}

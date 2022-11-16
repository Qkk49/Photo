import UIKit

protocol TabBarViewProtocol: AnyObject {
    func setupView()
}

class TabBarController: UITabBarController {
    
    private lazy var photoVC: UIViewController = {
        let navigationController = UINavigationController()
        let photoListViewController = PhotoListRouter.createModule(using: navigationController)
        navigationController.viewControllers = [photoListViewController]
        navigationController.tabBarItem.title = "Home"
        navigationController.tabBarItem.image = UIImage(systemName: "house.circle")!
        return navigationController
    }()
    
    var presenter: TabBarPresenterProtocol? {
        didSet {
            presenter?.viewLoaded()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension TabBarController: TabBarViewProtocol {
    
    func setupView() {
        viewControllers = [photoVC]
    }
}

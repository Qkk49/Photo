import UIKit

//MARK: - Protocol
protocol TabBarViewProtocol: AnyObject {
    func setupView()
}

class TabBarController: UITabBarController {
    
    //MARK: - Create TabBar Item
    private lazy var photoVC: UIViewController = {
        let navigationController = UINavigationController()
        let photoListViewController = PhotoListRouter.createListModule(using: navigationController)
        navigationController.viewControllers = [photoListViewController]
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

//MARK: - Setup View
extension TabBarController: TabBarViewProtocol {
    
    func setupView() {
        viewControllers = [photoVC]
        view.backgroundColor = .yellow
    }
}

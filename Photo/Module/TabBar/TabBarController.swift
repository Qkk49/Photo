import UIKit

//MARK: - Protocol
protocol TabBarViewProtocol: AnyObject {
    func setupView()
}

class TabBarController: UITabBarController {
    
    //MARK: - Create TabBar Items
    private lazy var photoVC: UIViewController = {
        let navigationController = UINavigationController()
        let photoListViewController = PhotoListRouter.createListModule(using: navigationController)
        navigationController.viewControllers = [photoListViewController]
        navigationController.tabBarItem.image = UIImage(systemName: "house.circle")
        navigationController.tabBarItem.title = "Gallery"
        navigationController.navigationBar.prefersLargeTitles = true
        return navigationController
    }()
    
    private lazy var searchVC: UIViewController = {
        let navigationController = UINavigationController()
        let searchListViewController = SearchListRouter.createSearchListModule(using: navigationController)
        navigationController.viewControllers = [searchListViewController]
        navigationController.tabBarItem.image = UIImage(systemName: "magnifyingglass.circle")
        navigationController.tabBarItem.title = "Search"
        navigationController.navigationBar.prefersLargeTitles = true
        return navigationController
    }()
    
    private lazy var favoriteVC: UIViewController = {
        let navigationController = UINavigationController()
        let favoriteListViewController = FavoriteListRouter.createFavoriteListModule(using: navigationController)
        navigationController.viewControllers = [favoriteListViewController]
        navigationController.tabBarItem.image = UIImage(systemName: "heart.circle")
        navigationController.tabBarItem.title = "Favorites"
        navigationController.navigationBar.prefersLargeTitles = true
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
        viewControllers = [photoVC, searchVC, favoriteVC]
        view.backgroundColor = .white
    }
}

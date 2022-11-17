import UIKit

//MARK: - Protocol
protocol TabBarRouterProtocol: AnyObject {
    static func createTabBarModule(using navigationController: UINavigationController) -> TabBarController
}

final class TabBarRouter: TabBarRouterProtocol {
    
    //MARK: - Create Module
    static func createTabBarModule(using navigationController: UINavigationController) -> TabBarController {
        let router = TabBarRouter()
        let view = TabBarController()
        let presenter = TabBarPresenter(view: view, router: router)
        
        view.presenter = presenter
        
        return view
    }
}

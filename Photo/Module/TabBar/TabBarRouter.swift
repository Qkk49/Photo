import UIKit

protocol TabBarRouterProtocol: AnyObject {
    static func createModule(using navigationController: UINavigationController) -> TabBarController
}

final class TabBarRouter: TabBarRouterProtocol {
    
    static func createModule(using navigationController: UINavigationController) -> TabBarController {
        let router = TabBarRouter()
        let view = TabBarController()
        let presenter = TabBarPresenter(view: view, router: router)
        
        view.presenter = presenter
        
        return view
    }
}

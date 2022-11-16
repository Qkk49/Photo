import UIKit

class PhotoListRouter: RouterPhotoListProtocol {
    static func createModule(using navigationController: UINavigationController) -> PhotoListViewController {
        let router = PhotoListRouter()
        let view = PhotoListViewController()
        let interactor = PhotoListInteractor()
        let presenter = PhotoListPresenter(view: view, router: router, interactor: interactor)

        view.presenter = presenter
        return view
    }
}

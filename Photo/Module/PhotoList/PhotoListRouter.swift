import UIKit

protocol RouterPhotoListProtocol: AnyObject {
    static func createModule(using navigationController: UINavigationController) -> PhotoListViewController
//    func pushToPhotoDetail(on view: PresenterToViewPhotoListProtocol?, with photo: PhotoDetail)
}

class PhotoListRouter: RouterPhotoListProtocol {
    static func createModule(using navigationController: UINavigationController) -> PhotoListViewController {
        let router = PhotoListRouter()
        let view = PhotoListViewController()
        let interactor = PhotoListInteractor()
        let presenter = PhotoListPresenter(view: view, router: router, interactor: interactor)

//        presenter.interactor = interactor
//        presenter.router = router
//        presenter.view = view
        interactor.presenter = presenter
//        router.presenter = presenter
        view.presenter = presenter
        return view
    }
}

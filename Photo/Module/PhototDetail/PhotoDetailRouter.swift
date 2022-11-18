import UIKit

//MARK: - Protocol
protocol RouterPhotoDetailProtocol: AnyObject {
    static func createDetailModule(using navigationController: UINavigationController, data: PhotoViewModel?) -> PhotoDetailViewController
}

final class PhotoDetailRouter: RouterPhotoDetailProtocol {
    
    weak var presenter: PresenterPhotoDetailProtocol?
    weak var navigationController: UINavigationController?
    
    static func createDetailModule(using navigationController: UINavigationController, data: PhotoViewModel?) -> PhotoDetailViewController {
        
        // Create layers
        let router = PhotoDetailRouter()
        let view = PhotoDetailViewController()
        let interactor = PhotoDetailInteractor()
        let presenter = PhotoDetailPresenter()
        
        // Connect layers
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
        view.presenter = presenter
        interactor.presenter = presenter
        router.presenter = presenter
        router.navigationController = navigationController
        
        return view
    }
}

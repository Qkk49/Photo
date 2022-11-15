import UIKit

//MARK: - View Input (View -> Presenter)
protocol ViewToPresenterPhotoDetailProtocol {
    var view: PresenterToViewPhototDetailProtocol? { get set }
    var interactor: PresenterToInteractorPhotoDetailProtocol? { get set }
    var router: PresenterToRouterPhotoDetailProtocol? { get set }
    
    func viewDidLoad()
    func populateDataIn(imgViewPhoto: UIImageView, lblDetail: UILabel)
}

//MARK: - View Output (Presenter -> View)
protocol PresenterToViewPhototDetailProtocol: AnyObject {
    func onGetImageFromURLSucces()
    func onGetImageFromURLFailure(error: String)
    func showActivity()
    func hideActivity()
}

//MARK: - Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorPhotoDetailProtocol {
    var photoDetail: PhotoDetail? { get set }
    var presenter: InteractorToPresenterPhotoListProtocol? { get set }
    func  getImageData()
}

//MARK: - Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterPhotoDetailProtocol: AnyObject {
    func GetImageFromURLSucces(photoDetail: PhotoDetail?, image: UIImage)
    func GetImageFromURLFailure(error: String)
}

//MARK: - Router Input (Presenter -> Router)
protocol PresenterToRouterPhotoDetailProtocol {
    static func createModule(with photo: PhotoDetail) -> UINavigationController?
}

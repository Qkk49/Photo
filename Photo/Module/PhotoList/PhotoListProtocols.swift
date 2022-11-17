import UIKit

protocol ViewPhotoListProtocol: AnyObject {
    func setupView()
    func setTitle(with title: String)
    func onFetchPhotoListSucces()
    func onFetchPhotoListFailure(error: String)
}

protocol PresenterPhotoListProtocol: AnyObject {
    func viewDidLoad()
    func fetchPhotoListSucces()
    func fetchPhotoListFailure()
    func getPhotoUrl(for indexpath : Int) -> String?
}

protocol InteractorPhotoListProtocol: AnyObject {
    var photos: [RandomPhoto]? { get set }
    func fetchPhotoList()
//    func getPhotoDetailAt(index: Int)
}

protocol RouterPhotoListProtocol: AnyObject {
    static func createModule(using navigationController: UINavigationController) -> PhotoListViewController
//    func pushToPhotoDetail(on view: PresenterToViewPhotoListProtocol?, with photo: PhotoDetail)
}

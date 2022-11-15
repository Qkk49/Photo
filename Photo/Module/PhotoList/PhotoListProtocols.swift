import UIKit

//MARK: - View Input (View -> Presenter)
protocol ViewToPresenterPhotoListProtocol {
    var view: PresenterToViewPhotoListProtocol? { get set }
    var interactor: PresenterToInteractorPhotoListProtocol? { get set }
    var router: PresenterToRouterPhotoListProtocol? { get set }
    func viewDidLoad()
    func refresh()
    
    func numberOfRowsInSection() -> Int //
    func setCell(tableView: UITableView, forRowAt indexPath: IndexPath) -> UITableViewCell //
    func didSelectRowAt(index: Int) //
    func tableViewCellHeight() -> CGFloat //
}

//MARK: - View Output (Presenter -> View)
protocol PresenterToViewPhotoListProtocol: AnyObject {
    func onFetchPhotoListSucces()
    func onFetchPhotoListFailure(error: String)
    func showActivity()
    func hideActivity()
}

//MARK: - Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorPhotoListProtocol {
    var presenter: InteractorToPresenterPhotoListProtocol? { get set }
    var photos: [RandomPhoto]? { get set }
    func fetchPhotoList()
    func getPhotoDetailAt(index: Int)
}

//MARK: - Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterPhotoListProtocol: AnyObject {
    func fetchPhotoListSucces(photos: [RandomPhoto])
    func fetchPhotoListFailure(error: String)
    
    // Details:
    
    func getPhotoDetailSucces(_ detail: PhotoDetail)
    func getPhotoDetailFailure()
}

//MARK: - Router Input (Presenter -> Router)
protocol PresenterToRouterPhotoListProtocol {
    static func createModule() -> UINavigationController?
    func pushToPhotoDetail(on view: PresenterToViewPhotoListProtocol?, with photo: PhotoDetail)
}

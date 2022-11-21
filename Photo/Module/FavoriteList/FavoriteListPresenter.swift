import UIKit

//MARK: - Protocol
protocol PresenterFavoriteListProtocol: AnyObject {
    func viewDidLoad()
    func getTableView() -> UITableView?
    func performed()
    func numb(number: Int) -> Int
    func getObject(indexPath: IndexPath) -> Any
    func photoSelected(using navigationController: UINavigationController, data: PhotoComplete?)
}

final class FavoriteListPresenter: PresenterFavoriteListProtocol {
    
    weak var view: ViewFavoriteListProtocol?
    var router: RouterFavoriteListProtocol?
    var interactor: InteractorFavoriteListProtocol?
    
    private let moduleTitle = "Favorites"
    
    func viewDidLoad() {
        view?.setupView()
        view?.setTitle(with: moduleTitle)
    }
    
    func performed() {
        interactor?.perform()
    }
    
    func numb(number: Int) -> Int {
        return interactor?.fetchResultController.sections?[number].numberOfObjects ?? 0
    }
    
    func getObject(indexPath: IndexPath) -> Any {
        guard let result = interactor?.fetchResultController.object(at: indexPath) else { return 0 }
        return result
    }
    
    func getTableView() -> UITableView? {
        return view?.favoriteListTableView
    }
    
    func photoSelected(using navigationController: UINavigationController, data: PhotoComplete?) {
        router?.performDetail(using: navigationController, data: data)
    }
}

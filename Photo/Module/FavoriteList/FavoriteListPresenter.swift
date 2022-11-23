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
    
    //MARK: - ViewDidLoad
    func viewDidLoad() {
        view?.setupView()
        view?.setTitle(with: moduleTitle)
    }
    
    //MARK: - PerformFetch
    func performed() {
        interactor?.perform()
    }
    
    //MARK: - Get CoreData Model
    func numb(number: Int) -> Int {
        return interactor?.fetchResultController.sections?[number].numberOfObjects ?? 0
    }
    
    func getObject(indexPath: IndexPath) -> Any {
        guard let result = interactor?.fetchResultController.object(at: indexPath) else { return 0 }
        return result
    }
     
    //MARK: - TableView to FetchResultControllerDelagate
    func getTableView() -> UITableView? {
        return view?.favoriteListTableView
    }
    
    //MARK: - Go to next Module
    func photoSelected(using navigationController: UINavigationController, data: PhotoComplete?) {
        router?.performDetail(using: navigationController, data: data)
    }
}

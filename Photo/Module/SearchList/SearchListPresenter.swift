import UIKit

//MARK: - Protocol
protocol PresenterSearchListProtocol: AnyObject {
    func viewDidLoad()
    func getSearchViewModels() -> [PhotoComplete]?
    func searchSelected(using navigationController: UINavigationController, data: PhotoComplete?)
    func fetchSearchListSucces(searchList: [RandomPhoto])
    func fetchSearchListFailure(with errorMessage: Error)
    
    func ja(text: String)
}

final class SearchListPresenter {
    
    weak var view: ViewSearchListProtocol?
    var router: RouterSearchListProtocol?
    var interactor: InteractorSearchListProtocol?
    var searchCompletes: [PhotoComplete]?
    
    private let moduleTitle = "Search"
    
}

extension SearchListPresenter: PresenterSearchListProtocol {
    
    func getSearchViewModels() -> [PhotoComplete]? {
        return searchCompletes
    }
    
    func viewDidLoad() {
        view?.setupView()
        view?.setTitle(with: moduleTitle)
    }
    
    func fetchSearchListSucces(searchList: [RandomPhoto]) {
        var searchCompletes = [PhotoComplete]()
        for search in searchList {
            let searchComplete: PhotoComplete = PhotoComplete(date: search.created_at, url: search.urls.small, name: search.user?.name)
            searchCompletes.append(searchComplete)
        }
        self.searchCompletes = searchCompletes
        view?.reloadData()
    }
    
    func fetchSearchListFailure(with errorMessage: Error) {
        print(errorMessage)
    }
    
    func ja(text: String) {
        interactor?.getSearchPhoto(query: text)
    }
    
    func searchSelected(using navigationController: UINavigationController, data: PhotoComplete?) {
        router?.performDetail(using: navigationController, data: data)
    }
}

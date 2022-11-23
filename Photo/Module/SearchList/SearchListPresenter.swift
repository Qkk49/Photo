import UIKit

//MARK: - Protocol
protocol PresenterSearchListProtocol: AnyObject {
    func viewDidLoad()
    func getSearchViewModels() -> [PhotoComplete]?
    func searchText(text: String)
    func searchSelected(using navigationController: UINavigationController, data: PhotoComplete?)
    func fetchSearchListSucces(searchList: [RandomPhoto])
    func fetchSearchListFailure(with errorMessage: Error)
}

final class SearchListPresenter {
    
    weak var view: ViewSearchListProtocol?
    var router: RouterSearchListProtocol?
    var interactor: InteractorSearchListProtocol?
    var searchCompletes: [PhotoComplete]?
    
    private let moduleTitle = "Search"
    
}

extension SearchListPresenter: PresenterSearchListProtocol {
    
    //MARK: - Get Model
    func getSearchViewModels() -> [PhotoComplete]? {
        return searchCompletes
    }
    
    //MARK: - ViewDidLoad
    func viewDidLoad() {
        view?.setupView()
        view?.setTitle(with: moduleTitle)
    }
    
    //MARK: - SearchText to Interactor
    func searchText(text: String) {
        interactor?.getSearchPhoto(query: text)
    }
    
    //MARK: - Go to next Module
    func searchSelected(using navigationController: UINavigationController, data: PhotoComplete?) {
        router?.performDetail(using: navigationController, data: data)
    }
    
    //MARK: - Get Photos from Interactor
    func fetchSearchListSucces(searchList: [RandomPhoto]) {
        var searchCompletes = [PhotoComplete]()
        for search in searchList {
            let searchComplete: PhotoComplete = PhotoComplete(date: search.created_at, url: search.urls.small, name: search.user?.name, button: false)
            searchCompletes.append(searchComplete)
        }
        self.searchCompletes = searchCompletes
        view?.reloadData()
    }
    
    func fetchSearchListFailure(with errorMessage: Error) {
        print(errorMessage)
    }
}

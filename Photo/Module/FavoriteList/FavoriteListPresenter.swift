import UIKit
//import CoreData

//MARK: - Protocol
protocol PresenterFavoriteListProtocol: AnyObject {
    func viewDidLoad()
//    func performed()
//    func getSections() -> Int
//    func getFavoritePhotoViewModels() -> [FavoritePhotoComplete]?
//    func getPhotoViewModels() -> [PhotoComplete]?
//    func photoSelected(using navigationController: UINavigationController, data: PhotoComplete?)
//    func fetchPhotoListSucces(photoList: [RandomPhoto])
//    func fetchPhotoListFailure(with errorMessage: Error)
//    func helo()
    
    
    
//    var favorite: FavoritePhoto? { get set }
//    var fetchResultController: NSFetchedResultsController<NSFetchRequestResult> { get set }
    func performed()
//    func gle() -> NSFetchedResultsController<NSFetchRequestResult>
    func numb(number: Int) -> Int
    
    func getObject(indexPath: IndexPath) -> Any
}

final class FavoriteListPresenter: PresenterFavoriteListProtocol {
    
    weak var view: ViewFavoriteListProtocol?
    var router: RouterFavoriteListProtocol?
    var interactor: InteractorFavoriteListProtocol?
    
    private let moduleTitle = "Favorites"
    
//    var favorite: FavoritePhoto?
//    var fetchResultController = CoreDataManager.instance.fetchResultController(entityName: "FavoritePhoto", sortName: "favDate")
    
    func viewDidLoad() {
        view?.setupView()
        view?.setTitle(with: moduleTitle)
    }
    
    func performed() {
        interactor?.perform()
//        do {
//            try fetchResultController.performFetch()
//        } catch {
//            print(error)
//        }
    }
//    func gle() -> NSFetchedResultsController<NSFetchRequestResult> {
//        interactor?.fetchResultController.sections
//    }
    func numb(number: Int) -> Int {
//        guard let ff = interactor?.fetchResultController.sections?.count else { return 2 }
//        print(interactor?.fetchResultController.sections?.count)
//        print(interactor?.fetchResultController.sections)
//        print(interactor?.fetchResultController.managedObjectContext)
//        print(interactor?.fetchResultController.sections[].numberOfObjects)
//        return ff
        return interactor?.fetchResultController.sections?[number].numberOfObjects ?? 0
    }
    
    func getObject(indexPath: IndexPath) -> Any {
        guard let result = interactor?.fetchResultController.object(at: indexPath) else {
            return interactor!.fetchResultController.object(at: indexPath)
        }
        return result
    }
}

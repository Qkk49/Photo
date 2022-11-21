import Foundation
import CoreData

//MARK: - Protocol
protocol InteractorFavoriteListProtocol: AnyObject {
    var favorite: FavoritePhoto? { get set }
    var fetchResultController: NSFetchedResultsController<NSFetchRequestResult> { get set }
    func perform()
//    func gree() -> NSFetchedResultsController<NSFetchRequestResult>
}

final class FavoriteListInteractor: InteractorFavoriteListProtocol {
    
    weak var presenter: PresenterFavoriteListProtocol?
    
    var favorite: FavoritePhoto?
    var fetchResultController = CoreDataManager.instance.fetchResultController(entityName: "FavoritePhoto", sortName: "favDate")
    
    func perform() {
        do {
            try fetchResultController.performFetch()
        } catch {
            print(error)
        }
    }
//    func gree() -> NSFetchedResultsController<NSFetchRequestResult> {
//        fetchResultController
//    }
}

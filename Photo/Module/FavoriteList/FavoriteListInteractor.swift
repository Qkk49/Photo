import Foundation
import CoreData

//MARK: - Protocol
protocol InteractorFavoriteListProtocol: AnyObject {
    var favorite: FavoritePhoto? { get set }
    var fetchResultController: NSFetchedResultsController<NSFetchRequestResult> { get set }
    func perform()
}

final class FavoriteListInteractor: NSObject, InteractorFavoriteListProtocol {
    
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
    
    override init() {
        super.init()
        fetchResultController.delegate = self
    }
}

extension FavoriteListInteractor: NSFetchedResultsControllerDelegate {
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        presenter?.getTableView()?.beginUpdates()
    }

    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            if let indexPath = newIndexPath {
                presenter?.getTableView()?.insertRows(at: [indexPath], with: .automatic)
            }

        case .delete:
            if let indexPath = indexPath {
                presenter?.getTableView()?.deleteRows(at: [indexPath], with: .automatic)
            }

        default:
            break
        }
    }

    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        presenter?.getTableView()?.endUpdates()
    }
}

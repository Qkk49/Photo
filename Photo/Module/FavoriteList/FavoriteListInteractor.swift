import Foundation

//MARK: - Protocol
protocol InteractorFavoriteListProtocol: AnyObject {}

final class FavoriteListInteractor: InteractorFavoriteListProtocol {
    
    weak var presenter: PresenterFavoriteListProtocol?
    
}

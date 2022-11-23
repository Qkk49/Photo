import Foundation
import CoreData

//MARK: - Protocol
protocol InteractorPhotoDetailProtocol: AnyObject {
    init(data: PhotoComplete?)
    var dataDetail: DataPhotoDetail { get set }
    
    var favorite: FavoritePhoto? { get set }
    func saveFavorite()
    func deleteFavorite()
}

final class PhotoDetailInteractor: InteractorPhotoDetailProtocol {
    
    weak var presenter: PresenterPhotoDetailProtocol?
    
    //MARK: - Get model from last Module
    var data: PhotoComplete?
    
    required init(data: PhotoComplete?) {
        self.data = data
    }

    lazy var dataDetail: DataPhotoDetail = DataPhotoDetail(date: PhotoDetailInteractor.formatDate(from: data!.date),
                                                           url: data!.url,
                                                           name: data!.name,
                                                           but: data!.button)
    
    var favorite: FavoritePhoto?
    
    //MARK: - Save to CoreData
    func saveFavorite() {
        if favorite == nil {
            favorite = FavoritePhoto()
        }
        if let favorite = favorite {
            favorite.favDate = dataDetail.date
            favorite.favURL = dataDetail.url
            favorite.favName = dataDetail.name
            CoreDataManager.instance.saveContext()
        }
    }
    
    //MARK: - Delete from CoreData
    func deleteFavorite() {
        if favorite == nil {
            favorite = FavoritePhoto()
        }
        if let favorite = favorite {
            CoreDataManager.instance.context.delete(favorite)
            CoreDataManager.instance.saveContext()
        }
    }
}

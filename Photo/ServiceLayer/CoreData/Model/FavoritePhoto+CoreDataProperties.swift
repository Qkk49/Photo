import Foundation
import CoreData


extension FavoritePhoto {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoritePhoto> {
        return NSFetchRequest<FavoritePhoto>(entityName: "FavoritePhoto")
    }

    @NSManaged public var favDate: String?
    @NSManaged public var favName: String?
    @NSManaged public var favURL: String?

}

extension FavoritePhoto : Identifiable {}

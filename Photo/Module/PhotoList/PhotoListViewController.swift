import UIKit

class PhotoListViewController: UIViewController {
    
    var presenter: (ViewToPresenterPhotoListProtocol & InteractorToPresenterPhotoListProtocol)
    
//    var tableView = UITableView

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        presenter.viewDidLoad()
    }
    
    func setUpUI() {
        self.title = "Sample"
//        ConfigUI
    }
}

extension PhotoListViewController: PresenterToViewPhotoListProtocol {
    func onFetchPhotoListSucces() {
        // reload here
        // tableView?.reloadData()
    }
    
    func onFetchPhotoListFailure(error: String) {
        print(error)
    }
    
    func showActivity() {
//        ActivityIndicator show
    }
    
    func hideActivity() {
//        ActivityIndicator hide
    }
}

//Delegate DataSource

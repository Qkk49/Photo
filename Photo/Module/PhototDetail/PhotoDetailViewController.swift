import UIKit
import Kingfisher

//MARK: - Protocol
protocol ViewPhotoDetailProtocol: AnyObject {
    func setupView()
    func setTitle(with title: String)
    func reloadData()
}

class PhotoDetailViewController: UIViewController {
    
    var presenter: PresenterPhotoDetailProtocol?
    
    //MARK: - Property
    
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.addSubview()
        presenter?.viewDidLoad()
        addConstraints()
    }
    
    //MARK: - Constraints
    private func addConstraints() {
        NSLayoutConstraint.activate([
//            .topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            .leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//            .trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//            .bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension PhotoDetailViewController: ViewPhotoDetailProtocol {
    
    func setupView() {
        
    }
    
    func setTitle(with title: String) {
        self.title = title
    }
    
    func reloadData() {
        
    }
}

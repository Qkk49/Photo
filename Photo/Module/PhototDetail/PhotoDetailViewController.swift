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
    var photoDetailImageView = UIImageView(frame: .zero)
    var nameDetailLabel = UILabel()
    var dataDetailLabel = UILabel()
    var favoriteDetailButton = UIButton()
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
    }
}

extension PhotoDetailViewController: ViewPhotoDetailProtocol {
    
    func setupView() {
        nameDetailLabel.text = "hello"
        view.addSubviews(photoDetailImageView, nameDetailLabel, dataDetailLabel, favoriteDetailButton)
        addConstraints()
    }
    
    func setTitle(with title: String) {
        self.title = title
    }
    
    func reloadData() {
        
    }
}

extension PhotoDetailViewController {
    //MARK: - Constraints
    private func addConstraints() {
        NSLayoutConstraint.activate([
            photoDetailImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            photoDetailImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            photoDetailImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            photoDetailImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            
            nameDetailLabel.topAnchor.constraint(equalTo: photoDetailImageView.bottomAnchor),
            nameDetailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            dataDetailLabel.topAnchor.constraint(equalTo: nameDetailLabel.bottomAnchor),
            dataDetailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            favoriteDetailButton.topAnchor.constraint(equalTo: dataDetailLabel.bottomAnchor),
            favoriteDetailButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

import UIKit
import Kingfisher

//MARK: - Protocol
protocol ViewPhotoDetailProtocol: AnyObject {
    func setupView()
    func setTitle(with title: String)
}

class PhotoDetailViewController: UIViewController {
    
    var presenter: PresenterPhotoDetailProtocol?
    
    //MARK: - Property
    var photoDetailImageView = UIImageView(frame: .zero)
    var nameDetailLabel = UILabel()
    var dataDetailLabel = UILabel()
    lazy var favoriteDetailButton = UIButton(type: .custom)
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension PhotoDetailViewController: ViewPhotoDetailProtocol {
    
    func setupView() {
        photoDetailImageView.kf.setImage(with: URL(string: presenter!.getPhotoComplete().url))
        photoDetailImageView.contentMode = .scaleAspectFit
        
        nameDetailLabel.text = presenter?.getPhotoComplete().name
        nameDetailLabel.font = .boldSystemFont(ofSize: 18)
        
        dataDetailLabel.text = presenter!.getPhotoComplete().date
        
        favoriteDetailButton.setTitle("Favorite", for: .normal)
        favoriteDetailButton.clipsToBounds = false
        favoriteDetailButton.layer.cornerRadius = 10
        favoriteDetailButton.backgroundColor = .blue
        favoriteDetailButton.addTarget(self, action: #selector(favoriteButton), for: .touchDown)
        favoriteDetailButton.isSelected = false
        
        view.addSubviews(photoDetailImageView, nameDetailLabel, dataDetailLabel, favoriteDetailButton)
        addConstraints()
    }
    
    func setTitle(with title: String) {
        self.title = title
    }
    
    @objc func favoriteButton(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            print("save")
            presenter?.savedFavorite()
            favoriteDetailButton.setTitle("Cancel", for: .normal)
        } else {
            print("delete")
            favoriteDetailButton.setTitle("Favorite", for: .normal)
        }
    }
}

extension PhotoDetailViewController {
    //MARK: - Constraints
    private func addConstraints() {
        NSLayoutConstraint.activate([
            photoDetailImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            photoDetailImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            photoDetailImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            photoDetailImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6),
            
            nameDetailLabel.topAnchor.constraint(equalTo: photoDetailImageView.bottomAnchor, constant: 10),
            nameDetailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            dataDetailLabel.topAnchor.constraint(equalTo: nameDetailLabel.bottomAnchor),
            dataDetailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            favoriteDetailButton.topAnchor.constraint(equalTo: dataDetailLabel.bottomAnchor, constant: 15),
            favoriteDetailButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            favoriteDetailButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.35),
            favoriteDetailButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.06)
        ])
    }
}

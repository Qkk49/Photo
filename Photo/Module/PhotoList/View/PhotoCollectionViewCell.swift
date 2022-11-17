import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Property
    static let identifire = "PhotoCell"
    
    var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(photoImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - LayoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        addConstraint()
    }
    
    //MARK: - Constraints
    func addConstraint() {
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: self.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            photoImageView.heightAnchor.constraint(equalToConstant: self.frame.height)
        ])
    }
}

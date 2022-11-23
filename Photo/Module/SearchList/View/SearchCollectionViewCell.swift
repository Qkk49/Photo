import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Property
    static let identifire = "SearchCell"
    
    var photoImageView = UIImageView()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup View
    private func setupView() {
        photoImageView.contentMode = .scaleAspectFit
        addSubviews(photoImageView)
    }
    
    //MARK: - LayoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        addConstraint()
    }
    
    //MARK: - Constraints
    private func addConstraint() {
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: self.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

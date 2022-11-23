import UIKit

class FavoriteTableViewCell: UITableViewCell {
    
    //MARK: - Property
    static let identifier = "FavoriteCell"
    
    var favoriteImageView = UIImageView()
    var favoriteNameLabel = UILabel()
    var favoriteDateLabel = UILabel()
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup View
    private func setupView() {
        favoriteImageView.contentMode = .scaleAspectFit
        addSubviews(favoriteImageView, favoriteNameLabel, favoriteDateLabel)
    }
    
    //MARK: - LayoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        addConstraints()
    }
    
    //MARK: - Add Constraints
    private func addConstraints() {
        NSLayoutConstraint.activate([
            favoriteImageView.topAnchor.constraint(equalTo: self.topAnchor),
            favoriteImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            favoriteImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            favoriteImageView.widthAnchor.constraint(equalToConstant: self.frame.width / 4),
            
            favoriteNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -15),
            favoriteNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 40),
            
            favoriteDateLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 15),
            favoriteDateLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 40)
        ])
    }
    

}

import UIKit

class BuildingCell: UITableViewCell {

    private let nameLabel = UILabel()
    private let locationLabel = UILabel()
    private let lotLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        // Add labels as subviews
        [nameLabel, locationLabel, lotLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }

        // Configure labels (font, color, etc.)
        nameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        locationLabel.font = UIFont.systemFont(ofSize: 14)
        lotLabel.font = UIFont.systemFont(ofSize: 14)

        // AutoLayout constraints
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            locationLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            locationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            locationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            lotLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 8),
            lotLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            lotLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            lotLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    func configure(with building: Building) {
        nameLabel.text = building.buildingName
        locationLabel.text = building.buildingLocation
        lotLabel.text = building.closestLot
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        locationLabel.text = nil
        lotLabel.text = nil
    }
}

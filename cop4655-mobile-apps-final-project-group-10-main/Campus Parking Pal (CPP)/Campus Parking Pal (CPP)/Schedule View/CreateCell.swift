import UIKit

class CreateCell: UITableViewCell {
    
    private let semesterYearLabel = UILabel()
    private let courseLabel = UILabel()
    private let buildingLabel = UILabel()
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
        [semesterYearLabel, courseLabel, buildingLabel, lotLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        // Configure labels (font, color, etc.)
        semesterYearLabel.font = UIFont.boldSystemFont(ofSize: 16)
        courseLabel.font = UIFont.systemFont(ofSize: 14)
        buildingLabel.font = UIFont.systemFont(ofSize: 14)
        lotLabel.font = UIFont.systemFont(ofSize: 14)

        // Example using AutoLayout:
        NSLayoutConstraint.activate([
            semesterYearLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            semesterYearLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            semesterYearLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            courseLabel.topAnchor.constraint(equalTo: semesterYearLabel.bottomAnchor, constant: 8),
            courseLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            courseLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            buildingLabel.topAnchor.constraint(equalTo: courseLabel.bottomAnchor, constant: 8),
            buildingLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            buildingLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            lotLabel.topAnchor.constraint(equalTo: buildingLabel.bottomAnchor, constant: 8),
            lotLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            lotLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            lotLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)  // This ensures that the cell expands to fit the content
        ])
    }
    
    func configure(with post: Post) {
        semesterYearLabel.text = post.semesterYear
        courseLabel.text = post.course
        buildingLabel.text = post.building
        lotLabel.text = post.lot
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        semesterYearLabel.text = nil
        courseLabel.text = nil
        buildingLabel.text = nil
        lotLabel.text = nil
    }
}

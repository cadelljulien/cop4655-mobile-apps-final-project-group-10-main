//
//  ProfileTableViewCell.swift
//  Campus Parking Pal (CPP)
//
//  Created by YUMirinBrah on 11/24/23.
//
import UIKit
import Alamofire
import AlamofireImage
class ProfileTableViewCell: UITableViewCell {
    
    
@IBOutlet weak var usernameLabel: UILabel!
@IBOutlet weak var postImageView: UIImageView!
    
    private var imageDataRequest: DataRequest?
    
    func configure(with profile: Profile) {
        // TODO: Pt 1 - Configure Post Cell
        // Username
        if let user = profile.user {
            usernameLabel.text = user.username
        }
        
        // Image
        if let imageFile = profile.imageFile,
           let imageUrl = imageFile.url {
            
            // Use AlamofireImage helper to fetch remote image from URL
            imageDataRequest = AF.request(imageUrl).responseImage { [weak self] response in
                switch response.result {
                case .success(let image):
                    // Set image view image with fetched image
                    self?.postImageView.image = image
                case.failure(let error):
                    print("❌ Error fetching image: \(error.localizedDescription)")
                    break
                }
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        // TODO: P1 - Cancel image download
        // Reset image view image
        postImageView.image = nil
        
        // Cancel image req
        imageDataRequest?.cancel()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}


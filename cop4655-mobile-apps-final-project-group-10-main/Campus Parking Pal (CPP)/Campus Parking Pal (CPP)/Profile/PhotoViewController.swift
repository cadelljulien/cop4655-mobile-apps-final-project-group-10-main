//
//  PhotoViewController.swift
//  Campus Parking Pal (CPP)
//
//  Created by YUMirinBrah on 11/24/23.
//
import UIKit
import PhotosUI
import ParseSwift
class PhotoViewController: UIViewController {
    @IBOutlet weak var changeButton: UIBarButtonItem!
    @IBOutlet weak var imagePreview: UIImageView!
    
    private var pickedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onPickedImageTapped(_ sender: UIBarButtonItem) {
        // Present image picker
        var config = PHPickerConfiguration()
        
        config.filter = .images
        
        config.preferredAssetRepresentationMode = .current
        
        config.selectionLimit = 1
        
        let picker = PHPickerViewController(configuration: config)
        
        picker.delegate = self
        
        present(picker, animated: true)
    }
    @IBAction func onShareTapped(_ sender: Any) {
        // Dismiss Keyboard
        view.endEditing(true)
        // Create and saves profile picture
        guard let image = pickedImage,
              let imageData = image.jpegData(compressionQuality: 0.1) else {
            return
        }
        
        let imageFile = ParseFile(name: "image.jpg", data: imageData)
        
        var profile = Profile()
        
        profile.imageFile = imageFile
        
        // sets the user as the current user
        profile.user = User.current
        
        profile.save { [weak self] result in
            
            DispatchQueue.main.async {
                switch result {
                case .success(let profile):
                    print("✅ Profile picture Saved! \(profile)")
                    
                    self?.navigationController?.popViewController(animated: true)
                    
                case.failure(let error):
                    self?.showAlert(description: error.localizedDescription)
                }
            }
        }
        
    }
    @IBAction func onViewTapped(_ sender: Any) {
        // Dismiss keyboard
        view.endEditing(true)
    }
    private func showAlert(description: String? = nil) {
        let alertController = UIAlertController(title: "Oops...", message: "\(description ?? "Please try again...")", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
    
    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
extension PhotoViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        
        guard let provider = results.first?.itemProvider,
              provider.canLoadObject(ofClass: UIImage.self) else {return}
        
        provider.loadObject(ofClass: UIImage.self) { [weak self] object, error in
            guard let image = object as? UIImage else {
                
                self?.showAlert()
                return
            }
            
            if let error = error {
                self?.showAlert()
                return
            } else {
                
                DispatchQueue.main.async {
                    
                    self?.imagePreview.image = image
                    self?.pickedImage = image
                }
            }
        }
    }
}


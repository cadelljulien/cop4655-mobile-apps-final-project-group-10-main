//
//  CreateViewController.swift
//  Campus Parking Pal (CPP)
//
//  Created by Cadell Julien on 11/24/23.
//

import UIKit

class CreateViewController: UIViewController {
    
    @IBOutlet weak var semesterYearField: UITextField!
    @IBOutlet weak var courseField: UITextField!
    @IBOutlet weak var buildingField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    // Example IBAction for saving the created schedule/parking lot
    @IBAction func saveSchedule(_ sender: UIButton) {
        // Validate the inputs
        guard let semesterYear = semesterYearField.text, !semesterYear.isEmpty,
              let course = courseField.text, !course.isEmpty,
              let building = buildingField.text, !building.isEmpty else {
            // Show an alert if fields are missing
            showAlert(with: "Please fill in all fields to create a schedule.")
            return
        }
        
        // Create a new Post object
        var newPost = Post()
        newPost.semesterYear = semesterYear
        newPost.course = course
        newPost.building = building
  
        
        // Save the new Post to Parse
        newPost.save { result in
            switch result {
            case .success(let savedPost):
                // Handle the success, e.g., show a confirmation message or perform a segue
                print("Successfully saved post: \(savedPost)")
            case .failure(let error):
                // Handle the error, e.g., show an error message
                self.showAlert(with: "Failed to save post: \(error.localizedDescription)")
            }
        }
    }
    private func showAlert(with message: String) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default)
            alertController.addAction(action)
            self.present(alertController, animated: true)
        }
    }
}

//
//  ProfilePageViewController.swift
//  Campus Parking Pal (CPP)
//
//  Created by YUMirinBrah on 11/25/23.
//
import UIKit
import ParseSwift
class ProfilePageViewController: UIViewController {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    private var profiles = [Profile]() {
        didSet {
            // Reload table view data any time the posts variable gets updated.
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set up the table view
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false

        // Set up the background image
        if let backgroundImage = UIImage(named: "back2") {
            view.backgroundColor = UIColor(patternImage: backgroundImage)
        }

        // Other setup...
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        queryPosts()
    }
    
    private func queryPosts() {
        
        let query = Profile.query()
            .include("user")
            .order([.descending("createdAt")]) // Sort by 'createdAt' in descending order
            .limit(1) // Limit the query to 5 results
        query.find { [weak self] result in
            switch result {
            case .success(let profiles):
                self?.profiles = profiles
            case.failure(let error):
                self?.showAlert(description: error.localizedDescription)
            }
        }
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
extension ProfilePageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profiles.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as? ProfileTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: profiles[indexPath.row])
        return cell
    }
}
extension ProfilePageViewController: UITableViewDelegate { }


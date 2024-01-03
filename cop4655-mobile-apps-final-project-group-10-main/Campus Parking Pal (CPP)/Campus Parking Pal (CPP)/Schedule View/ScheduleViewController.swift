import UIKit
import ParseSwift

class ScheduleViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private var schedules = [Post]() {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CreateCell.self, forCellReuseIdentifier: "CreateCell")
        querySchedules()
    }

    private func querySchedules() {
        let query = Post.query()
            .order([.descending("createdAt")]) // Sort by 'createdAt' in descending order
            .limit(5) // Limit the query to 5 results

        query.find { [weak self] result in
            switch result {
            case .success(let schedules):
                self?.schedules = schedules
                self?.tableView.reloadData() // Reload the table with the new data
            case .failure(let error):
                self?.showAlert(description: error.localizedDescription)
            }
        }
    }



    // Function to display an alert with a given message
    func showAlert(title: String = "Error", description: String? = nil) {
        let message = description ?? "An unexpected error occurred. Please try again later."
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
}

// MARK: - UITableViewDataSource
extension ScheduleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return min(schedules.count, 5)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CreateCell", for: indexPath) as? CreateCell else {
            fatalError("Misconfigured cell type, CreateCell expected")
        }
        let post = schedules[indexPath.row]
        cell.configure(with: post)
        return cell
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        querySchedules()
    }

}

// MARK: - UITableViewDelegate
extension ScheduleViewController: UITableViewDelegate {
    // Implement any delegate methods if needed
}
 



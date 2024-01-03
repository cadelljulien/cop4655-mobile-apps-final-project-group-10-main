import UIKit

class BuildingsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    // Use the hardcoded Building data
    //private var buildings = Building.mockData
    
    var buildings: [Building] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(BuildingCell.self, forCellReuseIdentifier: "BuildingCell") // Ensure you have a BuildingCell
        
        buildings = Building.mockData
        print(buildings)
        

    }
    
    // Optional: If you have any additional setup or refresh logic, implement it here
    // Example: override func viewWillAppear(_ animated: Bool) { ... }
    
}
    
    // MARK: - UITableViewDataSource
    extension BuildingsViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return buildings.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "BuildingCell", for: indexPath) as? BuildingCell else {
                fatalError("Misconfigured cell type, BuildingCell expected")
            }
            let building = buildings[indexPath.row]
            cell.configure(with: building) // Assuming BuildingCell has a configure(with:) method
            return cell
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

            if let cell = sender as? UITableViewCell,

                let indexPath = tableView.indexPath(for: cell),

                let detailViewController = segue.destination as? DetailViewController {
                let building = buildings[indexPath.row]
                detailViewController.building = building
                print("prepare(for segue:sender:) - Setting building: \(building.buildingName)")

            }

        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            if let indexPath = tableView.indexPathForSelectedRow {
                tableView.deselectRow(at: indexPath, animated: true)
            }
        }
        
    }

    
    // MARK: - UITableViewDelegate
    extension BuildingsViewController: UITableViewDelegate {
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            let selectedBuilding = buildings[indexPath.row]
            
            if let detailViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController{
                detailViewController.building = selectedBuilding
                
                
                if let navigationController = self.navigationController {
                    navigationController.pushViewController(detailViewController, animated: true)
                } else {
                    // If not, present the detail view controller modally
                    present(detailViewController, animated: true, completion: nil)
                }
                
               
            }
            
        }
    }
            
        
    
    


//
//  AllCitiesController.swift
//  WeatherApp
//
//  Created by Victor Garitskyu on 26.07.2022.
//

import UIKit

class AllCitiesController: UITableViewController {

    var allCities = [
        City(name: "Aktobe", image: UIImage(named: "Aktobe") ?? UIImage()),
        City(name: "Nur-Sultan", image: UIImage(named: "Nur-Sultan") ?? UIImage()),
        City(name: "Almaty", image: UIImage(named: "Almaty") ?? UIImage()),
        City(name: "Karagandy", image: UIImage(named: "Karagandy") ?? UIImage()),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allCities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath)
                as? CityCell
        else { return UITableViewCell() }
        cell.cityName.text = allCities[indexPath.row].name
        cell.cityImage.image = allCities[indexPath.row].image
        cell.cityImage.clipsToBounds = true
        cell.cityImage.layer.cornerRadius = 32
        cell.cityImage.layer.borderWidth = 2
        cell.cityImage.layer.borderColor = UIColor.gray.cgColor
        cell.cityImage.layer.shadowRadius = 3
        cell.cityImage.layer.shadowColor = UIColor.black.cgColor
        cell.cityImage.layer.cornerRadius = 40 / 2
        cell.cityImage.contentMode = .scaleAspectFill
        return cell
    }
    
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

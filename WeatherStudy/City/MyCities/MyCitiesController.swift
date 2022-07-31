//
//  MyCitiesController.swift
//  WeatherApp
//
//  Created by Victor Garitskyu on 26.07.2022.
//

import UIKit

class MyCitiesController: UITableViewController {
 
    var myCities = [City]()
    
    @IBAction func addCity(segue: UIStoryboardSegue) {
        guard
            segue.identifier == "addCity",
            let controller = segue.source as? AllCitiesController,
            let indexPath = controller.tableView.indexPathForSelectedRow,
            !myCities.contains(controller.allCities[indexPath.row])
        else { return }
        let city = controller.allCities[indexPath.row]
        myCities.append(city)
        tableView.reloadData()
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myCities.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        myCities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath)
                as? CityCell
        else { return UITableViewCell() }
        cell.cityName.text = myCities[indexPath.row].name
        cell.cityImage.image = myCities[indexPath.row].image
        
        cell.cityImage.layer.masksToBounds = false
        cell.cityImage.contentMode = .scaleToFill
        
        cell.cityImage.layer.cornerRadius = 40
        cell.cityImage.layer.borderWidth = 0.5
        cell.cityImage.layer.borderColor = UIColor.black.cgColor
      
        cell.cityImage.layer.shadowRadius = 10
        cell.cityImage.layer.shadowOpacity = 0.7
        cell.cityImage.layer.shadowPath = UIBezierPath(roundedRect: cell.cityImage.bounds, cornerRadius: cell.cityImage.layer.cornerRadius) .cgPath
        cell.cityImage.layer.shadowOffset = CGSize(width: 3, height: 3)
        cell.cityImage.layer.shadowColor = UIColor.blue.cgColor
        cell.cityImage.clipsToBounds = true
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            segue.identifier == "forecast",
            let controller = segue.destination as? WeatherViewController,
            let index = tableView.indexPathForSelectedRow
        else { return }
        
        controller.selectedCity = myCities[index.row]
    }
}

    

   

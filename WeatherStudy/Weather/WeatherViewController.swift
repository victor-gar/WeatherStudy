//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Victor Garitskyu on 27.07.2022.
//

import UIKit



class WeatherViewController: UIViewController{

   
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var weekPayPicker: WeekDayPicker!
    
    @IBOutlet weak var flowDelegate: UICollectionViewDelegateFlowLayout!
    
    
    
    
    var selectedCity: City?
    
    var weatherCounter = 15 {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weekPayPicker.addTarget(self, action: #selector(selectedDay), for: .valueChanged)
    }
    
    @objc
    private func selectedDay() {
        weatherCounter = (weekPayPicker.selectedDay?.rawValue ?? 0) + 2
    }
}

extension WeatherViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
        weatherCounter
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCell", for: indexPath)
                as? WeatherCell
        else { return UICollectionViewCell() }
    
        cell.icon.image = UIImage(named: "1d")
        cell.weather.text = "30 c"
        cell.time.text = "30.08.2017 18:00"
    
        return cell
    }
}

extension WeatherViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("collectionCell at \(indexPath)")
    }
}

extension WeatherViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 5
        let size = CGSize(width: width, height: width)
        return size
    }
}

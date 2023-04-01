//
//  WAPWeatherViewController + Extension.swift
//  WeatherApiMVVM
//
//  Created by Ali Amanvermez on 1.04.2023.
//

import Foundation
import UIKit
import Hero
extension WAPWeatherViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.weatherDataArray.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCell", for: indexPath) as! WAPICitiesCollectionViewCell
        cell.configure(with: viewModel.weatherDataArray[indexPath.row])
        cell.layer.cornerRadius = 12
      
        cell.backgroundColor = .systemBlue.withAlphaComponent(0.5)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 16)
        return CGSize(width: width, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(viewModel.weatherDataArray[indexPath.row].location.name) basıldı")
        let detailVC = WAPWeatherDetailViewController()
        detailVC.viewModel.weatherData = viewModel.weatherDataArray[indexPath.row]
        present(detailVC, animated: true)
    }
}

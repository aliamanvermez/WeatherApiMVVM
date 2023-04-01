//
//  WAPWeatherViewController.swift
//  WeatherApiMVVM
//
//  Created by Ali Amanvermez on 26.03.2023.
//

import UIKit
import SnapKit
class WAPWeatherViewController: UIViewController {
    
    let viewModel = WAPWeatherAPIViewModel()
    
    let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        getDataFromViewModel()
        
        self.collectionView.register(WAPICitiesCollectionViewCell.self, forCellWithReuseIdentifier: "WeatherCell")
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        
    }
    
    func createUI() {
        view.addSubview(collectionView)
        self.assignBackground(named: "background_image")
        collectionView.backgroundColor = .clear
        collectionView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            make.left.equalToSuperview()
            
        }
    }
    
    func getDataFromViewModel() {
        viewModel.getData { error in
            if let error = error {
                print("Error fetching data: \(error)")
            } else {
                self.viewModel.onDataLoaded = {
                    
                }
            }
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
    }
    
    
    
    
}















//
//  WAPICitiesCollectionViewCell.swift
//  WeatherApiMVVM
//
//  Created by Ali Amanvermez on 30.03.2023.
//

import UIKit
import SnapKit
class WAPICitiesCollectionViewCell: UICollectionViewCell {
    var cityNameLabel = UILabel()
    var temparatureLabel = UILabel()
    var conditionImageView = UIImageView()
    
    
    func configure (with weatherData : WeatherData) {
        cityNameLabel.text = weatherData.location.name
        temparatureLabel.text = "\(weatherData.current.temp_c) °C"
        guard let iconURL = URL(string: "https:\(weatherData.current.condition.icon)") else {
            return print("error iconURL")
        }
        do {
            let imageData = try Data(contentsOf: iconURL)
            let iconImage = UIImage(data: imageData)
            conditionImageView.image = iconImage
            
        }catch {
            print("data error")
        }

        
        configureUI()
    }
    
    func configureUI() {
        
        contentView.addSubview(cityNameLabel)
        contentView.addSubview(temparatureLabel)
        contentView.addSubview(conditionImageView)
        
        cityNameLabel.textAlignment = .center
        cityNameLabel.layer.masksToBounds = true
        cityNameLabel.layer.cornerRadius = 12
        cityNameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalToSuperview()
        }
        
        temparatureLabel.textAlignment = .center
        temparatureLabel.snp.makeConstraints { make in
            make.left.equalTo(cityNameLabel.snp.right)
            make.top.equalToSuperview()
            make.width.equalTo(80)
            make.height.equalToSuperview()
        }
        
        conditionImageView.contentMode = .scaleAspectFit
        conditionImageView.snp.makeConstraints { make in
            make.left.equalTo(temparatureLabel.snp.right)
            make.top.equalToSuperview()
            make.width.equalToSuperview().offset(-230)
            make.height.equalToSuperview()
        }
    }
}

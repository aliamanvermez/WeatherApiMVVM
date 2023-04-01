//
//  WAPWeatherDetailViewController.swift
//  WeatherApiMVVM
//
//  Created by Ali Amanvermez on 31.03.2023.
//

import UIKit
import SnapKit
class WAPWeatherDetailViewController: UIViewController {
    var cityNameLabel = UILabel()
    var cityTemparatureLabel = UILabel()
    var cityWeatherDetail = UILabel()
    var cityWeatherImage = UIImageView()
    let viewModel = WAPWeatherAPIViewModel()
    override func viewDidLoad() {
        title = "Details"
        super.viewDidLoad()
        configureUI()
        

    }
    
    func configureUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(cityNameLabel)
        view.addSubview(cityTemparatureLabel)
        view.addSubview(cityWeatherDetail)
        view.addSubview(cityWeatherImage)
        
        self.assignBackground(named: "background_detail_image")
        
        cityNameLabel.text = viewModel.weatherData?.location.name
        cityNameLabel.font = UIFont(name: "Helvetica", size: 30)
        cityNameLabel.textAlignment = .center
        cityNameLabel.backgroundColor = .systemGray.withAlphaComponent(0.5)
        cityNameLabel.layer.cornerRadius = 12
        cityNameLabel.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.left.equalTo(20)
            make.height.equalTo(100)
            make.top.equalToSuperview().offset(100)
        }
        
        cityTemparatureLabel.text = String(describing: "\(viewModel.weatherData?.current.temp_c ?? 0.0) °C") 
        cityTemparatureLabel.textAlignment = .center
        cityTemparatureLabel.backgroundColor = .systemCyan.withAlphaComponent(0.5)
        cityTemparatureLabel.font = UIFont(name: "Helvetica", size: 30)
        cityTemparatureLabel.snp.makeConstraints { make in
            make.width.equalToSuperview().offset(-170)
            make.height.equalTo(100)
            make.left.equalTo(cityNameLabel.snp.right)
            make.top.equalTo(cityNameLabel.snp.top)
        }
        
        cityWeatherDetail.text = viewModel.weatherData?.current.condition.text
        cityWeatherDetail.textAlignment = .center
        cityWeatherDetail.backgroundColor = .systemGray2.withAlphaComponent(0.5)
        cityWeatherDetail.font = UIFont(name: "Helvetica", size: 20)
        cityWeatherDetail.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(100)
            make.top.equalTo(cityTemparatureLabel.snp.bottom).offset(10)
        }
        
        DispatchQueue.main.async {
            guard let iconURL = URL(string: "https:\(self.viewModel.weatherData!.current.condition.icon)") else {
                return print("error iconURL")
            }
            do {
                let imageData = try Data(contentsOf: iconURL)
                let iconImage = UIImage(data: imageData)
                self.cityWeatherImage.image = iconImage
                
            }catch {
                print("data error")
            }
        }
     
        cityWeatherImage.contentMode = .scaleAspectFit
        cityWeatherImage.backgroundColor = .systemFill
        cityWeatherImage.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(100)
            make.top.equalTo(cityWeatherDetail.snp.bottom).offset(10)
        }
        
      

    }
    


}

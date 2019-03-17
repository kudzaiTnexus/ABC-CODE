//
//  CountryTableViewCell.swift
//  ABC-CODE
//
//  Created by Kudzai Mhou on 2019/03/14.
//  Copyright © 2019 Kudzai Mhou. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var capitalCity: UILabel!
    @IBOutlet weak var countryRegion: UILabel!
    @IBOutlet weak var countryPopulation: UILabel!
    @IBOutlet weak var countryArea: UILabel!
    @IBOutlet weak var flagImageView: UIImageView!
    
    static let reuseIdentifier = String(describing: CountryTableViewCell.self)
    static let nibName = String(describing: CountryTableViewCell.self)
    private let formatter = Formatter()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUpView() {
        countryArea.textColor = UIColor.areaGreen()
        countryPopulation.textColor = UIColor.populationRed()
    }
    
    func setViewWithData(country: CountryData) {
        countryName.text = country.name
        capitalCity.text = country.capital
        countryRegion.text = country.region
        countryPopulation.text = formatter.formatIntToString(num: country.population)
        countryArea.text = formatter.formatIntToString(num: country.area)
    }
    
}

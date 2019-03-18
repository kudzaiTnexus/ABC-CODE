//
//  CountryDetailsView.swift
//  ABC-CODE
//
//  Created by Kudzai Mhou on 2019/03/17.
//  Copyright © 2019 Kudzai Mhou. All rights reserved.
//

import UIKit

class CountryDetailsView: UIView {

    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var subRegionLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencySymbolLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var borderLabel: UILabel!

    private let formatter = Formatter()
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func commonInit() {
        Bundle(for: CountryDetailsView.self).loadNibNamed("CountryDetailsView", owner: self, options: nil)
    }
    
    func setViewWithData(country: CountryData) {
        capitalLabel.text = country.capital
        regionLabel.text = country.region
        subRegionLabel.text = country.subRegion
        populationLabel.text = formatter.formatIntToString(num: country.population)
        areaLabel.text = formatter.formatIntToString(num: country.area)
        currencyLabel.text = country.currency[0].name
        currencySymbolLabel.text = country.currency[0].symbol
        languageLabel.text = country.language[0].name
        borderLabel.text = country.borders[0]
    }
}

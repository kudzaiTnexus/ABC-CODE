//
//  CountryViewController.swift
//  ABC-CODE
//
//  Created by Kudzai Mhou on 2019/03/17.
//  Copyright © 2019 Kudzai Mhou. All rights reserved.
//

import UIKit
import SDWebImageSVGCoder

class CountryViewController: UIViewController {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var countryInfoViewPlaceHolder: UIView!
    
    private let countryDetails: CountryData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavBar(countryName: countryDetails.name)
        showFlag(flagUrl: countryDetails.flag)
        addSubView()
    }
    
    init(countryDetails: CountryData) {
        self.countryDetails = countryDetails
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    
    func setUpNavBar(countryName: String) {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.title = countryName
        self.navigationController?.navigationBar.tintColor = UIColor.countryThemeGrey()
    }
    
    func addSubView() {
//      let childview =  Bundle.main.loadNibNamed("CountryDetailsView", owner: self, options: nil)?.first as? CountryDetailsView
//        countryInfoViewPlaceHolder.addSubview(childview!)
    }
    
    func showFlag(flagUrl: String) {
        let SVGCoder = SDImageSVGCoder.shared
        let SVGImageSize = CGSize(width: 100, height: 100)
        SDImageCodersManager.shared.addCoder(SVGCoder)
        
        flagImage.sd_setImage(with: URL(string: flagUrl), placeholderImage: nil, options: [], context: [.svgImageSize : SVGImageSize])
    }
}

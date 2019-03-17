//
//  CountriesViewController.swift
//  ABC-CODE
//
//  Created by Kudzai Mhou on 2019/03/14.
//  Copyright © 2019 Kudzai Mhou. All rights reserved.
//

import UIKit
import SDWebImageSVGCoder

class CountriesViewController: UIViewController, ViewCountriesView, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var continentName: UILabel!
    @IBOutlet weak var countriesTable: UITableView!
    @IBOutlet weak var mainView: UIView!
    
    private let progressLoader = Resolver.resolve(dependency: SpinnerView.self)
    private let errorViewControllerFactory = Resolver.resolve(dependency: ErrorViewControllerFactory.self)
    private var continentInfo = [ContinentData]()
    private var countryInfo = [CountryData]()
    private let continent: String
    
    private lazy var viewModel: ContinentCountriesViewModel = {
        let viewModelFactory = Resolver.resolve(dependency:ContinentCountriesViewModelFactory.self)
        return viewModelFactory.createViewModel(view: self, continent: continent)
    }()
    
    private var contentViewController: ComposedViewController? {
        willSet {
            newValue?.add(toView: self)
        }
        didSet {
            oldValue?.removeFromView()
        }
    }
    
    init(continent: String) {
        self.continent = continent
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTable()
        setUpView()
        setUpNavBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.viewWillAppear()
        mainView.isHidden = true
    }
    
    func setUpNavBar() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = UIColor.countryThemeGrey()
    }

    func setUpView() {
        continentName.text = continent
        countriesTable.backgroundColor = UIColor.countryOffWhite()
    }
    
    func setUpTable() {
        countriesTable.delegate = self
        countriesTable.dataSource = self
        countriesTable.register(UINib(nibName: CountryTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: "countryCell")
    }
    
    func showErrorView() {
        contentViewController = errorViewControllerFactory.createViewController {
            self.viewModel.tryAgainTapped()
        }
    }
    
    func hideErrorView() {
        if contentViewController is ErrorViewController {
            contentViewController = nil
        }
    }
    
    func showProgressView() {
        progressLoader.showLoader()
    }
    
    func hideProgressView() {
        progressLoader.hideLoader()
    }
    
    func showEmptyState() {
        
    }
    
    func showCountries(continentData: [CountryData]) {
        self.countryInfo = continentData
        self.countriesTable.reloadData()
        mainView.isHidden = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =  Bundle.main.loadNibNamed("CountryTableViewCell", owner: self, options: nil)?.first as? CountryTableViewCell else {
                return UITableViewCell()
        }
        
        let SVGCoder = SDImageSVGCoder.shared
        let SVGImageSize = CGSize(width: 90, height: 70)
        SDImageCodersManager.shared.addCoder(SVGCoder)
        
        cell.flagImageView.sd_setImage(with: URL(string: countryInfo[indexPath.row].flag), placeholderImage: nil, options: [], context: [.svgImageSize : SVGImageSize])
        cell.setViewWithData(country: countryInfo[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        viewModel.showCountryDetailedInfo(country: countryInfo[indexPath.row])
        
        let countryDetailsViewController = CountryViewController(countryDetails: countryInfo[indexPath.row])
        self.navigationController?.pushViewController(countryDetailsViewController, animated: true)
    }
    
}

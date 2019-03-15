//
//  CountriesViewController.swift
//  ABC-CODE
//
//  Created by Kudzai Mhou on 2019/03/14.
//  Copyright © 2019 Kudzai Mhou. All rights reserved.
//

import UIKit

class CountriesViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var continentName: UILabel!
    @IBOutlet weak var countriesTable: UITableView!
    
    private let viewModel = ContinentCountriesViewModelImplementation()
    private var continentInfo = [ContinentData]()
    private var countryInfo = [CountryData]()
    private let continent: String
    
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.viewWillAppear(continent: continent)
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell( withIdentifier: CountryTableViewCell.reuseIdentifier)
            as? CountryTableViewCell else {
                return UITableViewCell()
        }
        cell.setViewWithData(country: countryInfo[indexPath.row])
        return cell
    }
}

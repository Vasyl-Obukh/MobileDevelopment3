//
//  ViewController.swift
//  Lab1
//

import UIKit

class ViewController: UIViewController/*, UITableViewDelegate, UITableViewDataSource*/ {

	var FilmsData: FilmEntities?

	@IBOutlet weak var FilmsTable: UITableView!

	func loadFilms() {

		let path = Bundle.main.path(forResource: "MoviesList", ofType: "txt")

		let contents = FileManager.default.contents(atPath: path!)

		FilmsData = try! JSONDecoder().decode(FilmEntities.self, from: contents!)
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.

		loadFilms()

		FilmsTable.dataSource = FilmsData
	}


}


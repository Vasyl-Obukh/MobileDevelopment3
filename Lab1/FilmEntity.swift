import UIKit


struct FilmEntity: Decodable {

	var title: String
	var year: String
	var imdbID: String
	var type: String
	var poster: String

	/*init(title: String, year: String, imdbID: String, type: String, poster: String) {
		self.title = title
		self.year = year
		self.imdbID = imdbID
		self.type = type
		self.poster = poster
	}*/
}

class FilmEntities: NSObject, Decodable, UITableViewDataSource {
	var search: [FilmEntity]

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.search.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "FilmEntityCell", for: indexPath) as! FilmEntityCell
		let path = "Posters/\(self.search[indexPath.row].poster)"
		if let path = Bundle.main.path(forResource: path, ofType: "") {
			let contents = FileManager.default.contents(atPath: path)
			cell.filmImage.image = UIImage(data: contents!)
			cell.filmTitle.text = self.search[indexPath.row].title
			cell.year.text = self.search[indexPath.row].year
			cell.imdb.text = self.search[indexPath.row].imdbID
			cell.type.text = self.search[indexPath.row].type
		}
		return cell
	}
}

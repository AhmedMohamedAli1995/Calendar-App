

import Foundation
struct AgendaData : Codable {
	var id : String?
	var date : String?
	var data : [AgendaInnerData]?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case date = "date"
		case data = "data"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		date = try values.decodeIfPresent(String.self, forKey: .date)
		data = try values.decodeIfPresent([AgendaInnerData].self, forKey: .data)
	}

}

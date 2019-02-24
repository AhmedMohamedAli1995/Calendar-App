
import Foundation
struct AgendaResponse : Codable {
	let messageText : String?
	let status : String?
	let data : [AgendaData]?

	enum CodingKeys: String, CodingKey {

		case messageText = "MessageText"
		case status = "status"
		case data = "data"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
        messageText = try values.decodeIfPresent(String.self, forKey: .messageText)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		data = try values.decodeIfPresent([AgendaData].self, forKey: .data)
	}

}

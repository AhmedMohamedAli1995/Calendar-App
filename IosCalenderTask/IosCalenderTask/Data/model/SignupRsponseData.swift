/* 
Copyright (c) 2019 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Data : Codable {
	let id : String?
	let name : String?
	let email : String?
	let image : String?
	let allow_notifi : String?
	let profileCompleted : String?
	let type : String?
	let lang : String?
	let country_id : String?
	let user_auth : String?
	let title : String?
	let first_login : String?
	let country : String?
	let interest : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case email = "email"
		case image = "image"
		case allow_notifi = "allow_notifi"
		case profileCompleted = "profileCompleted"
		case type = "type"
		case lang = "lang"
		case country_id = "country_id"
		case user_auth = "user_auth"
		case title = "title"
		case first_login = "first_login"
		case country = "country"
		case interest = "interest"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		email = try values.decodeIfPresent(String.self, forKey: .email)
		image = try values.decodeIfPresent(String.self, forKey: .image)
		allow_notifi = try values.decodeIfPresent(String.self, forKey: .allow_notifi)
		profileCompleted = try values.decodeIfPresent(String.self, forKey: .profileCompleted)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		lang = try values.decodeIfPresent(String.self, forKey: .lang)
		country_id = try values.decodeIfPresent(String.self, forKey: .country_id)
		user_auth = try values.decodeIfPresent(String.self, forKey: .user_auth)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		first_login = try values.decodeIfPresent(String.self, forKey: .first_login)
		country = try values.decodeIfPresent(String.self, forKey: .country)
		interest = try values.decodeIfPresent(String.self, forKey: .interest)
	}

}
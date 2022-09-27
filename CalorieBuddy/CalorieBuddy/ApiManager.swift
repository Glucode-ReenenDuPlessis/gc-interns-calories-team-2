//
//  ApiManager.swift
//  Eben's API Exercise
//
//  Created by IACD-019 on 2022/06/24.
//

//import Foundation
//
//protocol CharacterRequestable {
//    func retrieveCharacters(completion: () -> ())
//    var characters: [Food] { get }
//}
//
//protocol CharacterManagerDelegate {
//    func didUpdateCharacter(_ apiManager: ApiManager, character: [Food])
//    So all errors are passed to the delegate
//    func didFailWithError(error: Error)
//}

//struct ApiManager {
//    var characters: [Character] = []
    
    
//    var delegate: CharacterManagerDelegate?
    
//    func performRequest() {
        //1. Create a URL
//        if let url = URL(string: "https://api.edamam.com/api/food-database/v2/parser?app_id=08d4abd4&app_key=8be115386e91a9178c6728febb68d327&nutrition-type=cooking&ingr=meat+lasagna") {
            // 2. Create URL Session
//            let session = URLSession(configuration: .default)
            // 3. Give session a task
//            let task = session.dataTask(with: url) { data, response, error in
//                if error != nil {
//                    self.delegate?.didFailWithError(error: error!)
//                    return
//                }
//
//                if let safeData = data {
//                    DispatchQueue.main.async {
//                        let character = self.parseJSON(safeData)
    //                    tells the delegate to update character info
//                        for char in character {
//                            print(char.hints)
//                        }
//                        print(character)
//                        print("Inside")
//                        self.delegate?.didUpdateCharacter(self, character: character)
                        
//                    }
//                }
//                print("Outside")
//            }

            // 4. Start the task
//            task.resume()
//        }

//    }

//   private func parseJSON(_ characterData: Data) -> [Food] {
//        let decoder = JSONDecoder()
//        var characterNameInfo: [Food] = []
//
//        do {
//            let decodedData = try decoder.decode([Food].self, from: characterData)
//            for char in decodedData {
//                characterNameInfo.append(Food(text: char.text, parsed: char.parsed, hints: char.hints))
//            }
//
//        } catch {
//            delegate?.didFailWithError(error: error)
//        }
//
//        return characterNameInfo
//    }
//
//    func getQuote(_ name: String) {
//
//        let quoteName = String(name.map {
//            $0 == " " ? "+" : $0
//        })
//
//        if let url = (URL(string: "\(K.quotesURL)=\(quoteName)")) {
//            let session = URLSession(configuration: .default)
//            let task = session.dataTask(with: url) { data, response, error in
//                if error != nil {
//                    print("Session could not be created: \(error?.localizedDescription)")
//                    return
//                }
//
//                if let safeData = data {
//                    DispatchQueue.main.async {
//                        let quote = self.parseJSONQuotes(safeData)
//                    }
//                }
//            }
//            task.resume()
//        }
//    }
//
//    func parseJSONQuotes(_ quotes: Data) -> [Quote] {
//        let decoder = JSONDecoder()
//        var quoteInfo: [Quote] = []
//
//        do {
//            let decodedData = try decoder.decode([QuoteModel].self, from: quotes)
//            for quote in decodedData {
//                let q = Quote(quote: quote.quote)
//                quoteInfo.append(q)
//            }
//        } catch {
//            print(error)
//        }
//        return quoteInfo
//    }
//}

//extension ApiManager {
//    func retrieveCharacters(completion: () -> ()) {
//        completion()
//    }
//
//    func retrieveCharacters(completion: ([Character]) -> ()) {
//        let characters = [Character]()
//        completion(characters)
//    }
//
//}

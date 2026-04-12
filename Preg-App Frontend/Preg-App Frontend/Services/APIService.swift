//
//  APIService.swift
//  Preg-App Frontend
//
//  Created by Abraham Gomez Jr on 4/11/26.
//

import Foundation

class APIService {
    static let shared = APIService()

    func createUser(
        email: String,
        password: String,
        name: String,
        current_week: Int,
        dueDate: Date,
        completion: @escaping (Result<String, Error>) -> Void
    ) {

        guard let url = URL(string: "http://127.0.0.1:8000/users") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let body = CreateUser(
            email: email,
            password: password,
            name: name,
            current_week: current_week,
            dueDate: dueDate
        )

        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .formatted({
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            return formatter
        }())

        request.httpBody = try? encoder.encode(body)

        URLSession.shared.dataTask(with: request) { data, _, error in

            if let error = error {
                completion(.failure(error))
                return
            }

            completion(.success("User created"))

        }.resume()
    }
    
    
    func login(email: String, password: String, completion: @escaping (Result<LoginUser, Error>) -> Void) {

        guard let url = URL(string: "http://127.0.0.1:8000/login") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let body: [String: String] = [
            "email": email,
            "password": password
        ]

        request.httpBody = try? JSONSerialization.data(withJSONObject: body)

        URLSession.shared.dataTask(with: request) { data, response, error in

            if let data = data {
                do {
                    let user = try JSONDecoder().decode(LoginUser.self, from: data)
                    completion(.success(user))
                } catch {
                    completion(.failure(error))
                }
            } else if let error = error {
                completion(.failure(error))
            }

        }.resume()
    }
}

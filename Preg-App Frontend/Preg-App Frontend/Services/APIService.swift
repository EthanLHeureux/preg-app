//
//  APIService.swift
//  Preg-App Frontend
//
//  Created by Abraham Gomez Jr on 4/11/26.
//

import Foundation

class APIService {
    
    // Provides a singular way for API service to be called (singleton)
    static let shared = APIService()

    func createUser(
        email: String,
        password: String,
        name: String,
        current_week: Int,
        dueDate: Date,
        
        // Allows the result of the request to be stored and used later, after the function has returned.
        completion: @escaping (Result<String, Error>) -> Void
    ) {

        guard let url = URL(string: "http://127.0.0.1:8000/users") else { return }

        var request = URLRequest(url: url)
        
        // POST because we are sending data to be created and stored.
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let body = CreateUser(
            email: email,
            password: password,
            name: name,
            current_week: current_week,
            dueDate: dueDate
        )

        // Handles how the user data will be encoded before being sent to the backend. Since date is specially formatted in JSON,
        // this piece of code ensures date values are taken care of appropriately.
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .formatted({
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            return formatter
        }())

        // Encodes the data to JSON
        request.httpBody = try? encoder.encode(body)

        // Sends the HTTP request to the backend
        URLSession.shared.dataTask(with: request) { data, response, error in

            // Checks for network/transfer error
            if let error = error {
                completion(.failure(error))
                return
            }
            
            // Checks for HTTP response
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    
                completion(.failure(NSError(
                    domain: "HTTPError",
                    code: 0,
                    userInfo: [NSLocalizedDescriptionKey: "Request failed"]
                )))
                return
            }

            completion(.success("User created"))

        }.resume()
    }
    

    func login(email: String, password: String, completion: @escaping (Result<LoginUser, Error>) -> Void) {

        guard let url = URL(string: "http://127.0.0.1:8000/login") else { return }

        var request = URLRequest(url: url)
        
        // POST since data is being sent to backend.
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        // This body and encoding process is a little different because my LoginUser struct
        // has current_week as a constant, but we are not providing this in the request.
        // Thus, the body is constructed as a dictionary with our user inputs, and
        // serialization has to be used instead of encoder.
        let body: [String: String] = [
            "email": email,
            "password": password
        ]

        request.httpBody = try? JSONSerialization.data(withJSONObject: body)

        // Works similarly as create user.
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                
                completion(.failure(NSError(
                    domain: "HTTPError",
                    code: 0,
                    userInfo: [NSLocalizedDescriptionKey: "Login failed"]
                )))
                return
            }

            // Since we are expecting data back, it is checked that it is recieved here.
            guard let data = data else {
                completion(.failure(NSError(
                    domain: "DataError",
                    code: 0,
                    userInfo: [NSLocalizedDescriptionKey: "No data returned"]
                )))
                return
                
            }
            
            // If data is recieved, it is decoded.
            do {
                let user = try JSONDecoder().decode(LoginUser.self, from: data)
                completion(.success(user))
            } catch {
                completion(.failure(error))
            }

        }.resume()
    }
    
    func fetchWeek(week: Int, completion: @escaping (Result<Week, Error>) -> Void) {

        guard let url = URL(string: "http://127.0.0.1:8000/home/\(week)") else {
            return
        }

        // Since we do not specify the HTTP method, it is automatically assumed to be GET.
        // The rest is handled just like the login.
        URLSession.shared.dataTask(with: url) { data, response, error in

            if let error = error {
                completion(.failure(error))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(NSError(
                    domain: "HTTPError",
                    code: 0,
                    userInfo: [NSLocalizedDescriptionKey: "Request failed"]
                )))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(
                    domain: "DataError",
                    code: 0,
                    userInfo: [NSLocalizedDescriptionKey: "No data returned"]
                )))
                return
            }

            do {
                let decoded = try JSONDecoder().decode(Week.self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(error))
            }

        }.resume()
    }
}

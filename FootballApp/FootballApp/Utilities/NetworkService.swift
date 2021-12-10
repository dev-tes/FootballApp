//
//  NetworkService.swift
//  TheClosedCircuit
//
//  Created by  Tes on 10/12/2021.
//

import Foundation

struct NetworkService {
    
    static let shared = NetworkService()
    private init() {}
    
    
    private func request<T: Decodable>(route: Route,
                                       method: Method,
                                       parameters: [String: Any]? = nil,
                                       completion: @escaping(Result<T, Error>) -> Void) {
        guard let request = createRequest(route: route, method: method, parameters: parameters) else {
            completion(.failure(NetworkingError.unknownError))
            return
        }
        
        URLSession.shared.dataTask(with: request) {
            data, response, error in
            var result: Result<Data, Error>?
            if let data = data {
                result = .success(data)
                let responseString = String(data: data, encoding: .utf8) ?? "Could not stringify data"
            } else if let error = error {
                result = .failure(error)
                print("Error is \(error.localizedDescription )")
            }
            DispatchQueue.main.async {
                self.handleResponse(result: result, completion: completion)
            }
        }.resume()
    }
    
    private func handleResponse<T: Decodable>(result: Result<Data, Error>?, completion: (Result<T, Error>) -> Void) {
        guard let result = result else {
            completion(.failure(NetworkingError.unknownError))
            
            return
        }
        
        switch result {
        case .success(let data):
            let decoder = JSONDecoder()
            guard let response = try? decoder.decode(T.self, from: data)
            else {
                completion(.failure(NetworkingError.errorDecoding))
                return
            }
            completion(.success(response))
        case .failure(let error):
            completion(.failure(error))
        }
    }
    
    
    private func createRequest(route: Route,
                               method: Method,
                               parameters: [String: Any]? = nil) -> URLRequest?
    {
        let urlString = Route.baseUrl + route.description
        guard let url = urlString.asUrl else { return nil }
        var urlRequest = URLRequest(url: url)

        
        
        
        urlRequest.httpMethod = method.rawValue
        
        if let params = parameters {
            switch method {
            case .get:
                var urlComponent = URLComponents(string: urlString)
                urlComponent?.queryItems = params.map{(URLQueryItem(name: $0, value: "\($1)"))}
                urlRequest.url = urlComponent?.url
            case .post, .delete, .patch:
                let bodyData = try? JSONSerialization.data(withJSONObject: params, options: [])
                urlRequest.httpBody = bodyData
            }
        }
        return urlRequest
    }

}

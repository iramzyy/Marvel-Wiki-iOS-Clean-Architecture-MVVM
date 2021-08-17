//
//  URLSessionClient.swift
//  Marvel-Wiki
//
//  Created by Ramzy on 15/08/2021.
//

import Foundation

protocol NetworkProtocol: AnyObject {
    func call<T: Codable>(_ endpoint: Endpoint, _ expectedModel: T.Type, onComplete: @escaping ((Result<T, Error>) -> Void))
    func cancelPreviousTask()
}

final class URLSessionClient: NetworkProtocol {
    lazy private var session = URLSession(configuration: .default)
    private var dataTask: URLSessionDataTask?
    

    func call<T: Codable>(_ endpoint: Endpoint, _ expectedModel: T.Type, onComplete: @escaping ((Result<T, Error>) -> Void)) {
        let urlRequest = URLRequestFactory.generateRequest(outOf: endpoint)
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let self = self else { return }
            self.dataTask = self.session.dataTask(with: urlRequest) { (data, response, error) in
                DispatchQueue.main.async {
                    if let error = error {
                        onComplete(.failure(error))
                    } else if let data = data, let response = response as? HTTPURLResponse {
                        switch response.statusCode {
                        case 200...399:
                            guard let parsedModel = data.decode(expectedModel) else {
                                onComplete(.failure(NetworkError.decodingError))
                                return
                            }
                            onComplete(.success(parsedModel))
                        default:
                            onComplete(.failure(NetworkError.somethingWentWrong))
                        }
                    }
                }
            }
            self.dataTask?.resume()
        }
    }
    
    func cancelPreviousTask() {
        dataTask?.cancel()
    }
}

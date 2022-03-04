//
//  SearchModule.swift
//  translator
//
//  Created by Сергей Яковлев on 02.03.2022.
//
import Foundation

public class RequestFactory {

    public init() {}

    public func makeRequest(endpoint: Endpoint) throws -> URLRequest {
        let endpointURL = endpoint.baseURL.appendingPathComponent(endpoint.path)
        var components = URLComponents(url: endpointURL, resolvingAgainstBaseURL: false)
        var body: Data?
        switch endpoint.parameterEncoding {
        case .json:
            let encoder = JSONEncoder()
            body = try encoder.encode(endpoint.parameters)
        case .data:
            body = endpoint.parametersData
        case .url:
            components?.queryItems = endpoint.parameters.map { key, value in
                URLQueryItem(name: key, value: value)
            }
        }
        guard let url = components?.url else {
            throw NetworkingError.wrongURL
        }
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.httpBody = body
        for header in endpoint.headers {
            request.addValue(header.value, forHTTPHeaderField: header.key)
        }
        return request
    }
}

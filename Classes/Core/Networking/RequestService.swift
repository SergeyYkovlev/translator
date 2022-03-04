//
//  SearchModule.swift
//  translator
//
//  Created by Сергей Яковлев on 02.03.2022.
//

import Foundation

public typealias ResultCompletion<Response> = (Result<Response, Error>) -> Void
public typealias Success<Response> = (Response) -> Void
public typealias Failure<Error> = (Error) -> Void

public enum ParameterEncoding {
    case url
    case json
    case data
}

public enum NetworkingError: Swift.Error {
    case noData
    case wrongURL
}

open class RequestService {

    public enum UploadTask {
        case file(URL)
        case data(Data?)
    }

    public let sessionTaskService: SessionTaskService
    public let requestFactory: RequestFactory
    public let decoder: JSONDecoder

    public init(sessionTaskService: SessionTaskService = .init(),
                requestFactory: RequestFactory = .init(),
                decoder: JSONDecoder = .init()) {
        self.sessionTaskService = sessionTaskService
        self.requestFactory = requestFactory
        self.decoder = decoder
    }

    // MARK: - Decoding

    @discardableResult
    public func request<Response: Decodable>(_ endpoint: Endpoint,
                                             completion: @escaping ResultCompletion<Response>) -> URLSessionDataTask? {
        request(endpoint) { [unowned decoder] result in
            completion(decoder.decodeResult(result))
        }
    }

    @discardableResult
    public func request<Response: Decodable>(_ endpoint: Endpoint,
                                             success: @escaping Success<Response>,
                                             failure: Failure<Error>? = nil) -> URLSessionDataTask? {
        request(endpoint) { (result: Result<Response, Error>) in
            switch result {
            case .success(let response):
                success(response)
            case .failure(let error):
                failure?(error)
            }
        }
    }

    @discardableResult
    public func uploadRequest<Response: Decodable>(_ endpoint: Endpoint,
                                                   task: UploadTask,
                                                   completion: @escaping ResultCompletion<Response>) -> URLSessionUploadTask? {
        uploadRequest(endpoint, task: task) { [unowned decoder] result in
            completion(decoder.decodeResult(result))
        }
    }

    @discardableResult
    public func uploadRequest<Response: Decodable>(_ endpoint: Endpoint,
                                                   task: UploadTask,
                                                   success: @escaping Success<Response>,
                                                   failure: Failure<Error>? = nil) -> URLSessionUploadTask? {
        uploadRequest(endpoint, task: task) { (result: Result<Response, Error>) in
            switch result {
            case .success(let response):
                success(response)
            case .failure(let error):
                failure?(error)
            }
        }
    }

    // MARK: - Requests

    @discardableResult
    public func request(_ endpoint: Endpoint, completion: @escaping ResultCompletion<Data>) -> URLSessionDataTask? {
        do {
            let request = try requestFactory.makeRequest(endpoint: endpoint)
            return sessionTaskService.dataTask(with: request, completion: completion)
        }
        catch {
            completion(.failure(error))
        }
        return nil
    }

    @discardableResult
    public func request(_ endpoint: Endpoint,
                        success: @escaping Success<Data>,
                        failure: Failure<Error>? = nil) -> URLSessionDataTask? {
        request(endpoint) { result in
            switch result {
            case .success(let response):
                success(response)
            case .failure(let error):
                failure?(error)
            }
        }
    }

    @discardableResult
    public func uploadRequest(_ endpoint: Endpoint,
                              task: UploadTask,
                              completion: @escaping ResultCompletion<Data>) -> URLSessionUploadTask? {
        do {
            let request = try requestFactory.makeRequest(endpoint: endpoint)
            switch task {
            case .file(let url):
                return sessionTaskService.uploadTask(with: request, fileURL: url, completion: completion)
            case .data(let data):
                return sessionTaskService.uploadTask(with: request, data: data, completion: completion)
            }
        }
        catch {
            completion(.failure(error))
        }
        return nil
    }

    @discardableResult
    public func uploadRequest(_ endpoint: Endpoint,
                              task: UploadTask,
                              success: @escaping Success<Data>,
                              failure: Failure<Error>? = nil) -> URLSessionDataTask? {
        uploadRequest(endpoint, task: task) { result in
            switch result {
            case .success(let response):
                success(response)
            case .failure(let error):
                failure?(error)
            }
        }
    }

    @discardableResult
    public func downloadRequest(_ endpoint: Endpoint, completion: @escaping ResultCompletion<URL>) -> URLSessionDownloadTask? {
        do {
            let request = try requestFactory.makeRequest(endpoint: endpoint)
            return sessionTaskService.downloadTask(with: request, completion: completion)
        }
        catch {
            completion(.failure(error))
        }
        return nil
    }

    @discardableResult
    public func downloadRequest(_ endpoint: Endpoint,
                                success: @escaping Success<URL>,
                                failure: Failure<Error>? = nil) -> URLSessionDownloadTask? {
        downloadRequest(endpoint) { result in
            switch result {
            case .success(let response):
                success(response)
            case .failure(let error):
                failure?(error)
            }
        }
    }
}

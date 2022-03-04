//
//  SearchModule.swift
//  translator
//
//  Created by Сергей Яковлев on 02.03.2022.
//
import Foundation

public class SessionTaskService {

    public let session: URLSession

    public init(session: URLSession = .shared) {
        self.session = session
    }

    // MARK: - Data

    @discardableResult
    public func dataTask(with request: URLRequest, completion: @escaping ResultCompletion<Data>) -> URLSessionDataTask {
        let task = session.dataTask(with: request) { [weak self] data, _, error in
            self?.handle(data, error: error, completion: completion)
        }
        task.resume()
        return task
    }

    @discardableResult
    public func dataTask(with request: URLRequest, success: @escaping Success<Data>, failure: Failure<Error>? = nil) -> URLSessionDataTask {
        dataTask(with: request) { result in
            switch result {
            case .success(let data):
                success(data)
            case .failure(let error):
                failure?(error)
            }
        }
    }

    // MARK: - Upload

    @discardableResult
    public func uploadTask(with request: URLRequest, fileURL: URL, completion: @escaping ResultCompletion<Data>) -> URLSessionUploadTask {
        let task = session.uploadTask(with: request, fromFile: fileURL) { [weak self] data, _, error in
            self?.handle(data, error: error, completion: completion)
        }
        task.resume()
        return task
    }

    @discardableResult
    public func uploadTask(with request: URLRequest,
                           fileURL: URL,
                           success: @escaping Success<Data>,
                           failure: Failure<Error>? = nil) -> URLSessionUploadTask {
        uploadTask(with: request, fileURL: fileURL) { result in
            switch result {
            case .success(let data):
                success(data)
            case .failure(let error):
                failure?(error)
            }
        }
    }

    @discardableResult
    public func uploadTask(with request: URLRequest, data: Data?, completion: @escaping ResultCompletion<Data>) -> URLSessionUploadTask {
        let task = session.uploadTask(with: request, from: data) { [weak self] data, _, error in
            self?.handle(data, error: error, completion: completion)
        }
        task.resume()
        return task
    }

    @discardableResult
    public func uploadTask(with request: URLRequest,
                           data: Data?,
                           success: @escaping Success<Data>,
                           failure: Failure<Error>? = nil) -> URLSessionUploadTask {
        uploadTask(with: request, data: data) { result in
            switch result {
            case .success(let data):
                success(data)
            case .failure(let error):
                failure?(error)
            }
        }
    }

    // MARK: - Download

    @discardableResult
    public func downloadTask(with request: URLRequest, completion: @escaping ResultCompletion<URL>) -> URLSessionDownloadTask {
        let task = session.downloadTask(with: request) { [weak self] url, _, error in
            self?.handle(url, error: error, completion: completion)
        }
        task.resume()
        return task
    }

    @discardableResult
    public func downloadTask(with request: URLRequest,
                             success: @escaping Success<URL>,
                             failure: Failure<Error>? = nil) -> URLSessionDownloadTask {
        downloadTask(with: request) { result in
            switch result {
            case .success(let data):
                success(data)
            case .failure(let error):
                failure?(error)
            }
        }
    }

    @discardableResult
    public func downloadTask(withResumeData resumeData: Data, completion: @escaping ResultCompletion<URL>) -> URLSessionDownloadTask {
        let task = session.downloadTask(withResumeData: resumeData) { [weak self] url, _, error in
            self?.handle(url, error: error, completion: completion)
        }
        task.resume()
        return task
    }

    @discardableResult
    public func downloadTask(withResumeData resumeData: Data,
                             success: @escaping Success<URL>,
                             failure: Failure<Error>? = nil) -> URLSessionDownloadTask {
        downloadTask(withResumeData: resumeData) { result in
            switch result {
            case .success(let data):
                success(data)
            case .failure(let error):
                failure?(error)
            }
        }
    }

    // MARK: - Private

    private func handle<Response>(_ response: Response?, error: Swift.Error?, completion: ResultCompletion<Response>) {
        if let error = error {
            completion(.failure(error))
        }
        else if let response = response {
            completion(.success(response))
        }
        else {
            completion(.failure(NetworkingError.noData))
        }
    }
}

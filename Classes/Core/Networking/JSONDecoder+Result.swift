//
//  SearchModule.swift
//  translator
//
//  Created by Сергей Яковлев on 02.03.2022.
//

import Foundation

public extension JSONDecoder {

    func decodeResult<T>(from data: Data) -> Result<T, Error> where T: Decodable {
        do {
            let decodedData: T = try decode(T.self, from: data)
            return .success(decodedData)
        }
        catch {
            return .failure(error)
        }
    }

    func decodeResult<T>(_ result: Result<Data, Error>) -> Result<T, Error> where T: Decodable {
        do {
            let decodedData: T = try decode(T.self, from: try result.get())
            return .success(decodedData)
        }
        catch {
            return .failure(error)
        }
    }
}

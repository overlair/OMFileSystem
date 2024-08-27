//
//  File.swift
//  
//
//  Created by John Knowles on 8/26/24.
//

import Foundation
//
//public enum OMFileSystemError: Error {
//    case couldntRead
//}
//
//


public struct UUIDPath {
    public let folder: String
    public let file: String
}

extension UUID {
    public func path() -> UUIDPath {
        let split: String.Index = .init(utf16Offset: 3, in: self.uuidString)
        let folder = String(self.uuidString.prefix(upTo: split))
        let file = String(self.uuidString.suffix(from: split))
        
        return UUIDPath(folder: folder, file: file)
    }
}

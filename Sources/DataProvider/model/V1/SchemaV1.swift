//
//  File.swift
//  
//
//  Created by 宋璞 on 2024/3/26.
//

import Foundation
import SwiftData


/// 当前版本系统
public typealias CurrentScheme = SchemaV1

/// 版本系统
public enum SchemaV1: VersionedSchema {

    /// The textual description of the migration’s version or purpose.
    public static var versionIdentifier: Schema.Version {
        .init(1, 0, 0)
    }
    
    /// The models to include in this version of the schema.
    public static var models: [any PersistentModel.Type] {
        [Item.self]
    }
    
}

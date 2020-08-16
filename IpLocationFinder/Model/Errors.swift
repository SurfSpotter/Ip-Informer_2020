//
//  Errors.swift
//  IpLocationFinder
//
//  Created by Алексей Чигарских on 28.07.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import Foundation

enum Errors: Error {
    case loadingFailed
    case wrongJsonFormat
    case apiKeyIsNotValid
    case internalServerError
}

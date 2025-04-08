//
//  ViewModel.swift
//  Thelp
//
//  Created by Tom Hartnett on 4/5/25.
//

import Foundation

protocol ViewModel {
    var encoded: String { get set }
    var decoded: String { get set }
    var title: String { get }
    func clearAll()
    func decode()
    func encode()
}

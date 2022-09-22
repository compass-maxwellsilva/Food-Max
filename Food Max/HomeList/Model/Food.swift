//
//  Food.swift
//  Food Max
//
//  Created by Maxwell da Silva e Silva on 19/08/22.
//

import UIKit

struct Food {
    let type: String
    let itens: [Item]
}

struct Item {
    let name: String
    let description: String
    
    var image: UIImage? {
        UIImage(named: name)
    }
}

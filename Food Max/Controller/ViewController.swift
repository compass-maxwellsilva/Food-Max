//
//  ViewController.swift
//  Food Max
//
//  Created by Maxwell da Silva e Silva on 17/08/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let typeFood: [Food] = [
        Food(type: "Carne", itens: [Item(name: "Carne")]),
        Food(type: "Massas", itens: [Item(name: "Pizza"), Item(name: "Macarrão Taiwan")]),
        Food(type: "Complemento", itens: [Item(name: "Pão de alho")]),
        Food(type: "Bebidas", itens: [Item(name: "Refrigerante"), Item(name: "Suco Natural")]),
        Food(type: "Sobremesa", itens: [Item(name: "Shake")])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configTableView()
    }
    
    private func configTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(CustomCell.nib(), forCellReuseIdentifier: CustomCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.typeFood.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.typeFood[section].itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else {
            return UITableViewCell()
        }
        let food = typeFood[indexPath.section].itens
        cell.setupCell(product: food[indexPath.row].name, image: food[indexPath.row].image ?? UIImage(imageLiteralResourceName: "❌"))
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.typeFood[section].type
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let food = typeFood[indexPath.section].itens
        print(food[indexPath.row].name)
    }
    
}

// 👉🏾 Constraints
// 👉🏾 Segunda tela: Descrição do item, título e imagem
// 👉🏾 Usar StackView na segunda tela

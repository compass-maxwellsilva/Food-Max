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
        Food(type: "Carne", itens: [Item(name: "Picanha", description: "Carne ao ponto Lorem ipsum dolor sit amet. Qui internos rerum est enim ad consequatur voluptas aut consequatur earum qui labore neque et adipisci nostrum non officiis nobis. Sit maiores necessitatibus et dolores autem et eveniet architecto. Est sequi corrupti non dicta molestias et eaque culpa non ipsam sequi vel natus saepe. Et earum quas et molestiae ut cupiditate voluptas non minima voluptatem. Eum sint commodi aut quibusdam omnis et ratione consectetur eum quia nesciunt aut asperiores iure! Ut libero ullam ex dolorem provident qui dignissimos beatae qui saepe consequatur. Et totam totam in sunt rem alias dolor 33 sunt voluptatibus in ipsum doloribus.")]),
        Food(type: "Massas", itens: [Item(name: "Pizza", description: "Borda recheada"), Item(name: "Macarrão Taiwan", description: "Lombo crispy")]),
        Food(type: "Complemento", itens: [Item(name: "Pão de alho", description: "Pão de alho com queijo")]),
        Food(type: "Bebidas", itens: [Item(name: "Refrigerante", description: "Pepsi"), Item(name: "Suco Natural", description: "Feito da polpa")]),
        Food(type: "Sobremesa", itens: [Item(name: "Shake", description: "Shake de chocolate")])
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
        present(DetailViewController(item: food[indexPath.row]), animated: true, completion: nil)
    }
    
}
// 👉🏾 Melhorar a tela de detalhes:
//      1️⃣ Aumentar a imagem
//      2️⃣ Acrescentar informações nutricionais
//      3️⃣ porção, receita e até tempo de preparo
// 👉🏾 Reorganizar a arquitetura MVC para ficar mais legível
// 👉🏾 Estudo sobre StackView e entender a diferença e aplicações na horizontal e vertical

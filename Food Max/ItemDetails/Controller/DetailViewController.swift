//
//  DetailViewController.swift
//  Food Max
//
//  Created by Maxwell da Silva e Silva on 31/08/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    private let item: Item
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    init(item: Item) {
        self.item = item
        super.init(nibName: "DetailViewController", bundle: Bundle(identifier: "DetailViewController"))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = item.name
        imageView.image = item.image
        descriptionLabel.text = item.description
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

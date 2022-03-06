//
//  ViewController.swift
//  next
//
//  Created by Ivan on 03.03.2022.
//

//
//  new_moduleApp.swift
//  new_module
//
//  Created by Ivan on 02.03.2022.
//

import UIKit
import SnapKit

class ImageViewController: UIViewController {
    
    private let imageURL: URL = URL(string: "https://www.imgonline.com.ua/examples/bee-on-daisy.jpg")!
    
    private lazy var stackView:  UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillEqually
        view.spacing = 20
        return view
    }()
    
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        let queue = DispatchQueue.global(qos: .utility) //ассинхронная очередь global
        
        
        queue.async {
            sleep(arc4random() % 4)
            
            if let data = try? Data(contentsOf: self.imageURL) {
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    let view = UIImageView(image: UIImage(data: data))
                    view.contentMode = .scaleAspectFit
                    self.stackView.addArrangedSubview(view)
                    print("image is added")
                }
                print("done1")
                
            }
            
            
            
            
            
            
        }
    }
    
    
    
    
    private func setupViews() {
        view.addSubview(stackView)
        stackView.snp.makeConstraints {make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottomMargin)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            make.left.right.equalToSuperview()
        }
        stackView.addArrangedSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
}





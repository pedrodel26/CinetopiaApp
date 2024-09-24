//
//  FavoriteCollectionReusableView.swift
//  Cinetopia
//
//  Created by Pedro Delmondes  on 12/09/2024.
//

import UIKit

class FavoriteCollectionReusableView: UICollectionReusableView {

    //MARK: - UI Components
    
    private lazy var headerLabel = LabelDefault(fontSize: 28, fontWeight: .medium, textAligment: .left)
    
    //MARK: - INIT
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Class methods
    
    func setupTitle(_ text: String) {
        headerLabel.text = text
    }
    
    private func setupConstraints() {
        addSubview(headerLabel)
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: topAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

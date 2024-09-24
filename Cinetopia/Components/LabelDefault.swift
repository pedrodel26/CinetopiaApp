//
//  LabelDefault.swift
//  Cinetopia
//
//  Created by John on 24/09/24.
//

import UIKit

class LabelDefault: UILabel {
    
    init(text: String = "", textColor: UIColor = .white, fontSize: CGFloat, fontWeight: UIFont.Weight = .regular, opacity: CGFloat = 1, numberOfLines: Int = 0, textAligment: NSTextAlignment = .natural) {
        super.init(frame: .zero)
        
        self.initDefault(text, textColor, fontSize, fontWeight, opacity, numberOfLines, textAligment)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initDefault(_ text: String,_ textColor: UIColor,_ fontSize: CGFloat, _ fontWeight: UIFont.Weight,_ opacity: CGFloat,_ numberOfLines: Int, _ textAligment: NSTextAlignment) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = text
        self.textColor = textColor
        self.font = .systemFont(ofSize: fontSize, weight: fontWeight)
        self.textAlignment = textAligment
        self.textColor = .label
        self.alpha = opacity
        self.numberOfLines = numberOfLines
    }
}

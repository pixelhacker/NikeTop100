//
//  BaseButton.swift
//  NikeTop100
//
//  Created by Ray Dolber on 3/22/20.
//  Copyright © 2020 Pixelhacker. All rights reserved.
//

import UIKit

class BaseButton: UIButton {
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor(named: "top100LightGray") : UIColor(named: "top100White")
            let highlightedTitleColor = isHighlighted ? UIColor(named: "top100Red") : UIColor(named: "top100DarkGray")
            setTitleColor(highlightedTitleColor, for: .normal)
        }
    }
    
    required init(title: String = "") {
        super.init(frame: .zero)
        backgroundColor = UIColor(named: "top100White")
		layer.borderWidth = 0.5
        layer.borderColor = UIColor(named: "top100Red")?.cgColor
        layer.cornerRadius = 12
		
		layer.shadowColor = UIColor.init(named: "demoLightGray")?.cgColor
		layer.shadowOffset = CGSize(width: 0, height: 1.0)
		layer.shadowOpacity = 0.5
		layer.shadowRadius = 2.0
		
        setTitle(title, for: .normal)
        setTitleColor(UIColor(named: "top100DarkGray"), for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

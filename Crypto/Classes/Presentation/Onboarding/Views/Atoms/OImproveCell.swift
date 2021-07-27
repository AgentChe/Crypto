//
//  OImproveCell.swift
//  FNP
//
//  Created by Andrey Chernyshev on 12.07.2021.
//

import UIKit

final class OImproveCell: CircleView {
    lazy var label = makeLabel()
    
    var isSelected = false {
        didSet {
            update()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Private
private extension OImproveCell {
    func update() {
        backgroundColor = isSelected ? UIColor(integralRed: 102, green: 71, blue: 226) : UIColor(integralRed: 48, green: 50, blue: 118)
    }
}

// MARK: Make constraints
private extension OImproveCell {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}

// MARK: Lazy initialization
private extension OImproveCell {
    func makeLabel() -> UILabel {
        let view = UILabel()
        view.numberOfLines = 0
        view.textColor = UIColor.white
        view.font = Fonts.SFProRounded.semiBold(size: 17.scale)
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
}

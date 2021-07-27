//
//  TestStatsView.swift
//  Nursing
//
//  Created by Vitaliy Zagorodnov on 11.02.2021.
//

import UIKit

class TestStatsView: GradientView {
    lazy var tableView = makeTableView()
    lazy var closeButton = makeCloseButton()
    lazy var titleLabel = makeTitleLabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        makeConstraints()
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Private
private extension TestStatsView {
    func initialize() {
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.colors = [
            Appearance.backgroundColorTop.cgColor,
            Appearance.backgroundColorBottom.cgColor
        ]
    }
}

// MARK: Make constraints
private extension TestStatsView {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            closeButton.heightAnchor.constraint(equalToConstant: 30.scale),
            closeButton.widthAnchor.constraint(equalTo: closeButton.heightAnchor),
            closeButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -10.scale),
            closeButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: ScreenSize.isIphoneXFamily ? 59.scale : 31.scale),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16.scale),
            titleLabel.rightAnchor.constraint(equalTo: closeButton.leftAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: tableView.topAnchor, constant: -20.scale)
        ])
        
        NSLayoutConstraint.activate([
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }
}

// MARK: Lazy initialization
private extension TestStatsView {
    func makeTableView() -> TestStatsTableView {
        let view = TestStatsTableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsVerticalScrollIndicator = false
        view.backgroundColor = .clear
        view.separatorStyle = .none
        addSubview(view)
        return view
    }
    
    func makeCloseButton() -> UIButton {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(UIImage(named: "Question.Close"), for: .normal)
        view.tintColor = .white
        addSubview(view)
        return view
    }
    
    func makeTitleLabel() -> UILabel {
        let view = UILabel()
        view.font = Fonts.SFProRounded.regular(size: 20.scale)
        view.textAlignment = .center
        view.textColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
}

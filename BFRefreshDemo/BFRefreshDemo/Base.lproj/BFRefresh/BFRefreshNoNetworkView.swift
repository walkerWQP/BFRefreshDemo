//
//  BFRefreshNoNetworkView.swift
//  BFRefreshDemo
//
//  Created by HJQ on 2018/7/29.
//  Copyright © 2018年 HJQ. All rights reserved.
//

import UIKit
import Foundation

public class BFRefreshNoNetworkView: UIView {

    public var refreshNoNetworkViewBlock: BFRefreshRefreshingBlock?

    public var offsetY: CGFloat = 100
    public var imageViewSize = CGSize.init(width: 150.0, height: 150.0)
    public var buttonSize = CGSize.init(width: 120, height: 40)

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addSubview(tipImageView)
        addSubview(tipLabel)
        addSubview(tipButton)
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override public func layoutSubviews() {
        super.layoutSubviews()
        tipImageView.frame = CGRect.init(x: (bounds.width - imageViewSize.width) / 2.0, y: offsetY, width: imageViewSize.width, height: imageViewSize.height)
        tipLabel.frame = CGRect.init(x: 10, y: tipImageView.frame.origin.y + tipImageView.frame.height + 20.0, width: bounds.width - 20, height: 20.0)
        tipButton.frame = CGRect.init(x: (bounds.width - buttonSize.width) / 2.0, y: tipLabel.frame.origin.y + tipLabel.frame.height + 20.0, width: buttonSize.width, height: buttonSize.height)
    }

    // MARK: - Event response
    @objc
    func tipButtonAction(btn: UIButton) {
        if let _ = refreshNoNetworkViewBlock {
            refreshNoNetworkViewBlock!()
        }
    }

    // MARK: - Lazy load
    public lazy var tipImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage.init(named: "RefreshTableView.bundle/refreshtableview_nonetwork.png", in: Bundle.init(for: BFRefreshNoNetworkView.self), compatibleWith: nil)
        imageView.image = image
        return imageView
    }()

    public lazy var tipLabel: UILabel = {
        let label = UILabel.init(frame: .zero)
        label.text = "网络连接异常, 重新检查网络吧"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .gray
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.numberOfLines = 0
        return label
    }()

    public lazy var tipButton: UIButton = { [weak self] in
        let button = UIButton.init(type: .custom)
        button.setTitle("点击刷新", for: .normal)
        let color = UIColor.init(red: 36/255.0, green: 191.0/255.0, blue: 161.0/255.0, alpha: 1.0)
        button.setTitleColor(color, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.clipsToBounds = true
        button.layer.borderWidth = 1.0
        button.layer.borderColor = color.cgColor
        button.addTarget(self, action: #selector(tipButtonAction(btn:)), for: .touchUpInside)
        return button
    }()

}

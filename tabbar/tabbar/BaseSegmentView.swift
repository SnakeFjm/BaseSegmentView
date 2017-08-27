//
//  BaseSegmentView.swift
//  tabbar
//
//  Created by Snake on 17/8/27.
//  Copyright © 2017年 Snake. All rights reserved.
//

import UIKit


@objc protocol BaseSegmentViewDelegate: NSObjectProtocol {
    
    @objc optional func segmentViewTitleButtonDidTouch(index: Int)
    
    @objc optional func segmentViewTitleCategoryListDidSelected(AtIndex index: Int)
    
}


class BaseSegmentView: UIView {
    
    private var _lastSelectedIndex: Int = 0
    private var titleArray: [String] = []
    private var buttonArray: [UIButton] = []
    private var unreadLabelArray: [UILabel] = []
    
    private var underLineView: UIView!
    var widthOfUnderLine: CGFloat = 40.0
    var delegate: BaseSegmentViewDelegate? = nil
    
    var lastSelectedIndex: Int {
        get {
            return _lastSelectedIndex
        }
    }
    
    
    // =================================
    // MARK:
    // =================================
    
    
    
    
    
    init(frame: CGRect, aDelegate: BaseSegmentViewDelegate?, aTitleArray: [String], aWidthOfUnderLine: CGFloat?) {
        super.init(frame: frame)
        //
        delegate = aDelegate
        titleArray = aTitleArray
        if aWidthOfUnderLine != nil {
            widthOfUnderLine = aWidthOfUnderLine!
        }
        //
//        self.createSubview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // 创建子视图
//    func createSubview() {
//        //
//        self.backgroundColor = .white
//        
//        // 下划线
//        underLineView = UIView.init(frame: calcUnderLineViewFrame(index: 0))
//        underLineView.backgroundColor = RGBCOLOR(r: 251, g: 37, b: 100, a: 1)
//        self.addSubview(underLineView)
//        
//        // 创建按钮
//        for index in 0..<self.titleArray.count {
//            let title: String = self.titleArray[index]
//            let btn: UIButton = self.createButton(title, index: index)
//            btn.tag = index
//            self.addSubview(btn)
//            self.buttonArray.append(btn)
//            
//            if index == 0 {
//                btn.isSelected = true
//            }
//            
//            //
//            let label: UILabel = self.createUnreadCountLabel()
//            btn.addSubview(label)
//            self.unreadLabelArray.append(label)
//            
//            label.autoSetDimensions(to: CGSize(width: 20, height: 20))
//            label.autoPinEdge(.left, to: .right, of: btn.titleLabel!, withOffset: 5)
//            label.autoAlignAxis(.horizontal, toSameAxisOf: btn.titleLabel!)
//            label.isHidden = true
//        }
//    }
    
    // 创建按钮
//    func createButton(_ title: String, index: Int) -> UIButton {
//        let frame: CGRect = self.calcButtonFrame(index)
//        let btn: UIButton = createCustomButton(frame: frame, title: title, normalImageName: nil, highlightImageName: nil, target: self, action: #selector(titleButtonDidTouch(_:)))
//        
//        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16.0)
//        btn.setTitleColor(RGBCOLOR(r: 130, g: 130, b: 130, a: 1), for: .normal)
//        btn.setTitleColor(RGBCOLOR(r: 251, g: 37, b: 100, a: 1), for: .selected)
//        return btn
//    }
    
    // 计算按钮的大小
//    func calcButtonFrame(_ index: Int) -> CGRect {
//        let count: Int = self.titleArray.count
//        if count == 0 {
//            return CGRect_Zero
//        }
//        let width: CGFloat = self.width / CGFloat(count)
//        return CGRect(x: width * CGFloat(index), y: 0, width: width, height: self.height)
//    }
    
    // 创建未读红点
//    func createUnreadCountLabel() -> UILabel {
//        let label: UILabel = createLabel()
//        label.font = UIFont.systemFont(ofSize: 12)
//        label.textColor = .white
//        label.textAlignment = .center
//        label.backgroundColor = .red
//        label.layer.cornerRadius = 10
//        label.layer.masksToBounds = true
//        return label
//    }
    
    //
    
    
    // 重置按钮状态
//    func resetButton() {
//        for button in self.buttonArray {
//            button.isSelected = false
//        }
//    }
    
    
    // 计算下划线的大小
//    func calcUnderLineViewFrame(index: Int) -> CGRect {
//        
//        let count: Int = self.titleArray.count
//        if count == 0 {
//            return CGRect_Zero
//        }
//        let width: CGFloat = self.width / CGFloat(count)
//        
//        let x: CGFloat = CGFloat(index) * width + (width - widthOfUnderLine) / 2
//        
//        return CGRect(x: x, y: self.height - 3, width: widthOfUnderLine, height: 3)
//    }
    
    
    // 按钮点击事件
//    func titleButtonDidTouch(_ sender: UIButton) {
//        
//        let index: Int = sender.tag
//        
//        if self.lastSelectedIndex == index {
//            return
//        } else {
//            _lastSelectedIndex = index
//            // 重置按钮状态
//            self.resetButton()
//            // 被点击的按钮设置
//            sender.isSelected = true
//            // 下划线动画
//            UIView.animate(withDuration: 0.2, animations: {
//                self.underLineView.frame = self.calcUnderLineViewFrame(index: index)
//            })
//            // 取消未读数
//            self.setUnreadCount(index: index, unreadCount: 0)
//        }
//        
//        if delegate != nil && (delegate?.responds(to: #selector(BaseSegmentViewDelegate.segmentViewTitleButtonDidTouch(index:))))! {
//            delegate?.segmentViewTitleButtonDidTouch!(index: index)
//        }
//    }
    
    
    // 设置未读数
    func setUnreadCount(index: Int, unreadCount: Int) {
        if index >= self.unreadLabelArray.count || index < 0 {
            return
        }
        let label: UILabel = self.unreadLabelArray[index]
        label.isHidden = (unreadCount == 0)
        label.text = String(unreadCount)
    }
    
    
}

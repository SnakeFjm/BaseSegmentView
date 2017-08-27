//
//  tabbar.swift
//  tabbar
//
//  Created by Snake on 17/8/27.
//  Copyright © 2017年 Snake. All rights reserved.
//

import UIKit

class BaseSegmentView6: UIView {
    
    
    var titleArray: [String] = []
    var buttonArray: [UIButton] = []
    
    var delegate: BaseSegmentViewDelegate!
    
    var lastSelectedIndex: Int = 0 {
        didSet {
            self.lastSelectedIndexDidSet()
        }
    }
    
    var UnderLineView: UIView!
    var UnderLineViewLeftConstraints: NSLayoutConstraint!
    
    var RightLineView: UIView!
    
    
    // 加载数据
    func reloadData(aDelegate: BaseSegmentViewDelegate, aTitleArray: [String]) {
        self.delegate = aDelegate
        self.titleArray = aTitleArray
        //
        createSubviews()
    }
    
    
    func cleanSubviews() {
        for view in self.subviews {
            view.removeFromSuperview()
        }
    }
    
    // 创建子视图
    func createSubviews() {
        
        //
        self.cleanSubviews()
        
        //
        self.buttonArray.removeAll()
        
        //
        var lastButton: UIButton? = nil
        for index in 0..<self.titleArray.count {
            let button = self.createButton(index: index)
            self.addSubview(button)
            self.buttonArray.append(button)
            
            button.autoPinEdge(.top, to: .top, of: self)
            button.autoPinEdge(.bottom, to: .bottom, of: self)
            
            if index == 0 {
                button.setTitleColor(UIColor.black, for: .normal)
                button.autoPinEdge(.left, to: .left, of: self)
            }else {
                button.autoPinEdge(.left, to: .right, of: lastButton!)
                button.autoMatch(.width, to: .width, of: lastButton!)
            }
            if index == self.titleArray.count - 1 {
                button.autoPinEdge(.right, to: .right, of: self)
            }
            
            lastButton = button
        }
        
        // underLineView
        let count = self.buttonArray.count
        let width: CGFloat = WindowWidth / CGFloat(count)
        UnderLineView = UIView.init()
        UnderLineView.backgroundColor = UIColor.black
        UnderLineView.autoSetDimension(.height, toSize: 2)
        UnderLineView.autoSetDimension(.width, toSize: width)
        self.addSubview(UnderLineView)
        UnderLineViewLeftConstraints = UnderLineView.autoPinEdge(.left, to: .left, of: self)
        UnderLineView.autoPinEdge(.bottom, to: .bottom, of: self)
        
        //RightLineView
        let heightRightLinView: CGFloat = self.frame.size.height
        let widthRightLinView: CGFloat = CGFloat(0.5)
        for index in 0..<self.buttonArray.count-1 {
            RightLineView = UIView.init()
            RightLineView.backgroundColor = UIColor.lightGray
            RightLineView.autoSetDimension(.height, toSize: heightRightLinView)
            RightLineView.autoSetDimension(.width, toSize: widthRightLinView)
            self.addSubview(RightLineView)
            RightLineView.autoPinEdge(.right, to: .right, of: buttonArray[index])
            RightLineView.autoPinEdge(.top, to: .top, of: self)
        }
        
        
        // update underline
        self.updateUnderLineViewConstraints(index: self.lastSelectedIndex)
        
    }
    
    //
    func createButton(index: Int) -> UIButton {
        let button: UIButton = UIButton(type: .custom)
        button.tag = index
        let title: String = self.titleArray[index]
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.lightGray, for: .normal)
        button.addTarget(self, action: #selector(buttonDidTouch(_:)), for: .touchUpInside)
        return button
    }
    
    // 重置按钮状态
    func resetButton() {
        for button in self.buttonArray {
            button.isSelected = false
            button.setTitleColor(UIColor.lightGray, for: .normal)
        }
    }
    
    
    func lastSelectedIndexDidSet() {
        
        resetButton()
        
        if lastSelectedIndex>=0 && lastSelectedIndex<self.buttonArray.count {
            let btn: UIButton = self.buttonArray[lastSelectedIndex]
            btn.isSelected = true
            btn.setTitleColor(UIColor.black, for: .normal)
        }
        
        self.updateUnderLineViewConstraints(index: lastSelectedIndex)
        
        if self.delegate != nil && (delegate.responds(to: #selector(BaseSegmentViewDelegate.segmentViewTitleButtonDidTouch(index:)))) {
            delegate.segmentViewTitleButtonDidTouch!(index: lastSelectedIndex)
        }
        
    }
    
    
    func buttonDidTouch(_ sender: UIButton) {
        
        let index: Int = sender.tag
        
        if lastSelectedIndex == index {
            return
        }else {
            lastSelectedIndex = index
        }
        
    }
    
    
    func updateUnderLineViewConstraints(index: Int) {
        
        let width = self.frame.size.width / CGFloat(self.buttonArray.count)
        UnderLineViewLeftConstraints.constant = width * CGFloat(index)
        
    }
    
    
}

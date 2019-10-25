//
//  ViewController.swift
//  ScrollViewHomeWork
//
//  Created by Ani on 10/24/19.
//  Copyright © 2019 Ani. All rights reserved.
//


import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    var scrollView:UIScrollView! = nil
    var pageControl:UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height - 50.0))
        
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(width: 10.0*scrollView.bounds.size.width, height: 0)
        self.view.addSubview(scrollView)
        var x = 0
        let y = 0
        let w = self.scrollView.frame.size.width
        let h = self.scrollView.frame.size.height
        for _ in 1...10 {
            let imgView = ScrollViewClass( frame: CGRect( x: CGFloat(x), y: CGFloat(y), width: w, height: h))
            scrollView.addSubview(imgView)
            x = x + Int(w)
        }
        
        scrollView.showsHorizontalScrollIndicator = false
        pageControl = UIPageControl(frame: CGRect(x: 0,
                                                  y: view.bounds.size.height - CGFloat(50),
                                                  width: self.view.bounds.size.width,
                                                  height: 50.0))
        pageControl.numberOfPages = 10
        pageControl.addTarget(self,
                              action: #selector(changePage(sender:)),
                              for: .valueChanged)
        pageControl.pageIndicatorTintColor = UIColor.red
        pageControl.currentPageIndicatorTintColor = UIColor.blue
        self.view.addSubview(pageControl)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @objc func changePage(sender:UIPageControl) {
        let offsetX = CGFloat(sender.currentPage) * CGFloat(scrollView.frame.size.width)
        scrollView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        print("scrollViewDidEndScrollingAnimation")
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / self.scrollView.frame.size.width
        pageControl.currentPage = Int(page)
    }
}


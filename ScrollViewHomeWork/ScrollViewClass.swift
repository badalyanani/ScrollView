//
//  ScrollViewClass.swift
//  ScrollViewHomeWork
//
//  Created by Ani on 10/24/19.
//  Copyright © 2019 Ani. All rights reserved.
//

import UIKit

class ScrollViewClass: UIScrollView , UIScrollViewDelegate{
    
    var imageView:UIImageView!
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        delegate = self
        minimumZoomScale = 0.2
        maximumZoomScale = 5
        imageView = UIImageView(image: UIImage(named: "image.jpg"))
        imageView.frame = CGRect(x: 0, y: 0, width: bounds.size.width, height: bounds.size.height)
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap(tap:)))
        tap.numberOfTapsRequired = 2
        self.addGestureRecognizer(tap)
        
    }
    
    @objc func handleDoubleTap(tap: UITapGestureRecognizer){
        if zoomScale > minimumZoomScale {
            setZoomScale(minimumZoomScale, animated: true)
        } else {
            let location = tap.location(in: imageView)
            let rect = CGRect(x: location.x, y: location.y, width: 1, height: 1)
            self.zoom(to: rect, animated: true)
        }
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        
        centerContent()
    }
    
    func centerContent() {
        let imageViewSize = imageView.frame.size
        
        var vertical:CGFloat = 0, horizontal:CGFloat = 0
        if imageViewSize.width < self.bounds.size.width  {
            horizontal = (self.bounds.size.width - imageViewSize.width) / 2.0
        }
        if imageViewSize.height < bounds.size.height  {
            vertical = (bounds.size.height - imageViewSize.height) / 2.0
        }
        contentInset = UIEdgeInsets(top: vertical,
                                    left: horizontal,
                                    bottom: vertical,
                                    right: horizontal)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}

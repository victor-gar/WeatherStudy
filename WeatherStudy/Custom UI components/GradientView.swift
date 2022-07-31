//
//  GradientView.swift
//  WeatherApp
//
//  Created by Victor Garitskyu on 28.07.2022.
//

import UIKit
@IBDesignable class GradientView : UIView{
    
    @IBInspectable var startColor : UIColor = .white {
        didSet {
            self.updateColors()
        }
    }
    @IBInspectable var endColor : UIColor = .black {
        didSet {
            self.updateColors()
        }
    }
    @IBInspectable var startLocation : CGFloat = 0 {
        didSet {
            self.updateLocation()
        }
    }
    @IBInspectable var endLocation : CGFloat = 1 {
        didSet {
            self.updateLocation()
        }
    }
    @IBInspectable var startPoint : CGPoint = .zero {
        didSet {
            self.updateStartPoint()
        }
    }
    @IBInspectable var endPoint : CGPoint = CGPoint(x: 0, y: 1)
    {
        didSet {
            self.updateEndPoint()
        }
    }
    
    override static var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    var gradientLayer: CAGradientLayer {
        return self.layer as! CAGradientLayer
    }
    
    func updateLocation(){
        self.gradientLayer.locations = [self.startLocation as NSNumber, self.endLocation as NSNumber]
}

    func updateColors(){
        self.gradientLayer.colors = [self.startColor.cgColor, self.endColor.cgColor]
    }
    
    func updateStartPoint(){
        self.gradientLayer.startPoint = startPoint
    }
    
    func updateEndPoint(){
        self.gradientLayer.endPoint = endPoint
}
}

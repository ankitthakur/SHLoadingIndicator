//
//  SHLoadingIndicator.swift
//  SHLoadingIndicator
//
//  Created by Ankit Thakur on 05/11/14.
//  Copyright (c) 2014 Ankit Thakur. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

class SHLoadingIndicator:UIView {
    
    internal var borderColor:UIColor?;
    internal var borderWidth:CGFloat?;
    
    internal var startAngle:CGFloat?;
    internal var endAngle:CGFloat?;
    
    required override init(frame: CGRect) {
        
        super.init(frame: frame);
        initialize();
        
    }
    required init(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder);
        initialize();
    }
    
    internal func initialize(){
        
        borderColor = UIColor.redColor(); //UIColor(red: 0.0/255.0, green: 183/255.0, blue: 229/255.0, alpha: 0.9);
        
        borderWidth = 2;
        
        startAngle = CGFloat(M_PI_2);
        endAngle = CGFloat(2*M_PI);
        animate();
    }
    
    
    internal func animate() {
        
        
        var scale1:CGFloat = self.bounds.size.width * 0.35;
        var scale2:CGFloat = self.bounds.size.width * 0.75;
        var scale3:CGFloat = self.bounds.size.width * 0.85;
        var scale4:CGFloat = self.bounds.size.width * 0.95;
        
        var layerRect1:CGRect = CGRectMake(scale1 , scale1, self.bounds.size.width - 2*scale1,  self.bounds.size.height - 2*scale1);
        var bezierPath1:UIBezierPath = UIBezierPath();
        var shapeLayer1:CAShapeLayer =  CAShapeLayer();
        bezierPath1.addArcWithCenter(CGPointMake(CGRectGetMidX(layerRect1), CGRectGetMidY(layerRect1)), radius: CGRectGetWidth(layerRect1) / 2, startAngle: startAngle!, endAngle: endAngle!, clockwise: true);
        
        var layerRect2:CGRect = CGRectMake(scale2 , scale2, self.bounds.size.width - 2*scale2,  self.bounds.size.height - 2*scale2);
        var bezierPath2:UIBezierPath = UIBezierPath();
        var shapeLayer2:CAShapeLayer =  CAShapeLayer();
        bezierPath2.addArcWithCenter(CGPointMake(CGRectGetMidX(layerRect2), CGRectGetMidY(layerRect2)), radius: CGRectGetWidth(layerRect2) / 2, startAngle: startAngle!, endAngle: endAngle!, clockwise: true);
        
        var layerRect3:CGRect = CGRectMake(scale3 , scale3, self.bounds.size.width - 2*scale3,  self.bounds.size.height - 2*scale3);
        var bezierPath3:UIBezierPath = UIBezierPath();
        var shapeLayer3:CAShapeLayer =  CAShapeLayer();
        bezierPath3.addArcWithCenter(CGPointMake(CGRectGetMidX(layerRect3), CGRectGetMidY(layerRect3)), radius: CGRectGetWidth(layerRect3) / 2, startAngle: startAngle!, endAngle: endAngle!, clockwise: true);
        
        var layerRect4:CGRect = CGRectMake(scale4 , scale4, self.bounds.size.width - 2*scale4,  self.bounds.size.height - 2*scale4);
        var bezierPath4:UIBezierPath = UIBezierPath();
        var shapeLayer4:CAShapeLayer =  CAShapeLayer();
        bezierPath4.addArcWithCenter(CGPointMake(CGRectGetMidX(layerRect4), CGRectGetMidY(layerRect4)), radius: CGRectGetWidth(layerRect4) / 2, startAngle: startAngle!, endAngle: endAngle!, clockwise: true);
        
        bezierPath1.lineWidth = borderWidth!;
        bezierPath2.lineWidth = borderWidth!;
        bezierPath3.lineWidth = borderWidth!;
        bezierPath4.lineWidth = borderWidth!;
        
        for shapeLayer in [shapeLayer1, shapeLayer2, shapeLayer3, shapeLayer4] {
            
            shapeLayer.frame = self.bounds;
            shapeLayer.strokeColor = borderColor!.CGColor;
            shapeLayer.lineWidth = borderWidth!;
            shapeLayer.shadowColor = borderColor!.CGColor;
            shapeLayer.shadowOffset = CGSizeMake(0.0, 0.0);
            shapeLayer.shadowOpacity = 1;
            
        }
        
        shapeLayer1.shadowRadius = scale1;
        shapeLayer2.shadowRadius = scale2;
        shapeLayer3.shadowRadius = scale3;
        shapeLayer4.shadowRadius = scale4;
        
        shapeLayer1.path = bezierPath1.CGPath;
        shapeLayer2.path = bezierPath2.CGPath;
        shapeLayer3.path = bezierPath3.CGPath;
        shapeLayer4.path = bezierPath4.CGPath;
        
        self.layer.addSublayer(shapeLayer4);
        self.layer.addSublayer(shapeLayer3);
        self.layer.addSublayer(shapeLayer2);
        self.layer.addSublayer(shapeLayer1);
        
        var rotationAnimation1:CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z");
        rotationAnimation1.fromValue = NSNumber(float: 0.0);
        rotationAnimation1.toValue = NSNumber(double: 2*M_PI);
        rotationAnimation1.duration = 1.5;
        rotationAnimation1.repeatCount = Float.infinity;
        
        var rotationAnimation2:CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z");
        rotationAnimation2.toValue = NSNumber(float: 0.0);
        rotationAnimation2.fromValue = NSNumber(double: 2*M_PI);
        rotationAnimation2.duration = 1.5;
        rotationAnimation2.repeatCount = Float.infinity;
        
        shapeLayer1.addAnimation(rotationAnimation1, forKey: "indeterminateAnimation");
        shapeLayer2.addAnimation(rotationAnimation2, forKey: "indeterminateAnimation");
        shapeLayer3.addAnimation(rotationAnimation1, forKey: "indeterminateAnimation");
        shapeLayer4.addAnimation(rotationAnimation2, forKey: "indeterminateAnimation");
        
        self.layer.cornerRadius = self.bounds.size.width/2;
        self.layer.backgroundColor = UIColor.blackColor().CGColor;
        
    }
    
    
}
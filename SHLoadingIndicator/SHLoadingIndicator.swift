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
    
    internal var biggerShadeLayer:CAShapeLayer?;
    internal var smallerShadeLayer:CAShapeLayer?;
    
    internal var biggerBezierPath:UIBezierPath?;
    internal var smallerBezierPath:UIBezierPath?;
    
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
        
        biggerShadeLayer = CAShapeLayer();
        smallerShadeLayer = CAShapeLayer();
        
        biggerBezierPath = UIBezierPath();
        smallerBezierPath = UIBezierPath();
        startAngle = CGFloat(M_PI_2);
        endAngle = CGFloat(2*M_PI);
        animate();
    }
    
    internal func animate(){
        
        var center:CGPoint = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
        var radius:CGFloat = min(self.bounds.size.width/5, self.bounds.size.height/5);
        
        var blueHalf:UIBezierPath = UIBezierPath(arcCenter: center, radius: CGFloat(radius), startAngle: startAngle!, endAngle: endAngle!, clockwise: true);
        blueHalf.lineWidth = borderWidth!;

        var radius1:CGFloat = min(self.bounds.size.width/3, self.bounds.size.height/3);
        var blueHalf1:UIBezierPath = UIBezierPath(arcCenter: center, radius: CGFloat(radius1), startAngle: startAngle!, endAngle: endAngle!, clockwise: true);
        blueHalf1.lineWidth = borderWidth!;

        biggerShadeLayer!.frame = self.bounds;
        smallerShadeLayer!.frame = self.bounds;
        biggerShadeLayer!.strokeColor = borderColor!.CGColor;
        smallerShadeLayer!.strokeColor = borderColor!.CGColor;
        biggerShadeLayer!.lineWidth = borderWidth!;
        smallerShadeLayer!.lineWidth = borderWidth!;
        
        
        
        biggerShadeLayer!.shadowColor = borderColor!.CGColor;
        biggerShadeLayer!.shadowOffset = CGSizeMake(0.0, 0.0);
        biggerShadeLayer!.shadowOpacity = 1;
        biggerShadeLayer!.shadowRadius = radius;
        
        smallerShadeLayer!.shadowColor = borderColor!.CGColor;
        smallerShadeLayer!.shadowOffset = CGSizeMake(0.0, 0.0);
        smallerShadeLayer!.shadowOpacity = 1;
        smallerShadeLayer!.shadowRadius = radius1;
        
        
        biggerShadeLayer!.path = blueHalf.CGPath;
        smallerShadeLayer!.path = blueHalf1.CGPath;
        
        self.layer.addSublayer(smallerShadeLayer);
        self.layer.addSublayer(biggerShadeLayer);
//        self.layer.addSublayer(biggerShadowLayer);
//        self.layer.addSublayer(smallerShadowLayer);

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
        
        
        biggerShadeLayer!.addAnimation(rotationAnimation1, forKey: "indeterminateAnimation");
        smallerShadeLayer!.addAnimation(rotationAnimation2, forKey: "indeterminateAnimation");
        
        self.layer.cornerRadius = self.bounds.size.width/2;
        self.layer.backgroundColor = UIColor.blackColor().CGColor;
        
        
    }
    
}
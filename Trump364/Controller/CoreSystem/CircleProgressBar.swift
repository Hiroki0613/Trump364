//
//  ProgressBar.swift
//  CircularProgressBar
//
//  Created by 宏輝 on 16/07/2019.
//  Copyright © 2019 Hiroki Kondo. All rights reserved.
//

import UIKit

class CircleProgressBar: UIView {
    
//ここでは丸型のプログレスバーを実装するコードが書かれています。
//クラス名をProgressBarからCircleProgressBarへ変更させたい
    
    @IBInspectable public var backgroundCircleColor: UIColor = UIColor.lightGray
    @IBInspectable public var startGradientColor: UIColor = UIColor.red
    @IBInspectable public var endGradientColor: UIColor = UIColor.orange
    @IBInspectable public var textColor: UIColor = UIColor.white
//    @IBInspectable public var cardImage: UIImage = UIImage(named: "0.png")!

    
    private var backgroundLayer: CAShapeLayer!
    private var foregroundLayer: CAShapeLayer!
    private var textLayer: CATextLayer!
    private var gradientLayer: CAGradientLayer!
    

    public var progress: CGFloat = 0 {
        didSet {
            didProgressUpdated()
        }
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        guard layer.sublayers == nil else {
            return
        }
        
        
        let width = rect.width
        let height = rect.height
        
        let lineWidth = 0.01 * min(width, height)
        

        
        backgroundLayer = createCircularLayer(rect: rect, strokeColor: backgroundCircleColor.cgColor, fillColor: UIColor.clear.cgColor, lineWidth: lineWidth)
        
        
        foregroundLayer = createCircularLayer(rect: rect, strokeColor: UIColor.red.cgColor, fillColor: UIColor.clear.cgColor, lineWidth: lineWidth)
        
        foregroundLayer.strokeEnd = 0.5
        
        
        gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.5)
        
        gradientLayer.colors = [startGradientColor.cgColor, endGradientColor.cgColor]
        gradientLayer.frame = rect
        gradientLayer.mask = foregroundLayer

        
        textLayer = createTextLayer(rect: rect, textColor: textColor.cgColor)
        
//        createImageLayer(rect: rect, cardImage: cardImage)
        
        layer.addSublayer(backgroundLayer)
        layer.addSublayer(gradientLayer)
        layer.addSublayer(textLayer)
//        layer.addSublayer(createImageLayer)
    }
    
    private func createCircularLayer(rect: CGRect, strokeColor: CGColor,fillColor: CGColor,lineWidth: CGFloat) -> CAShapeLayer {
        
        let width = rect.width
        let height = rect.height
        
        let center = CGPoint(x: width/2, y: height/2)
        let radius = (min(width, height) - lineWidth) / 2
        
        let startAngle = -CGFloat.pi / 2
        let endAngle = startAngle + 2 * CGFloat.pi
        
        let circularPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circularPath.cgPath
        
        shapeLayer.strokeColor = strokeColor
        shapeLayer.fillColor = fillColor
        shapeLayer.lineWidth = lineWidth
        shapeLayer.lineCap = .round

        return shapeLayer
        
    }
    
    private func createTextLayer(rect: CGRect,textColor: CGColor) -> CATextLayer {
        let width = rect.width
        let height = rect.height
        
        let fontSize = min(width, height) / 4
        let offSet = min(width, height) * 0.1
        
        let layer = CATextLayer()
        layer.string = "\(Int(progress * 100))"
        layer.backgroundColor = UIColor.clear.cgColor
        layer.foregroundColor = textColor
        layer.fontSize = fontSize
        layer.frame = CGRect(x: 0, y: (height - fontSize - offSet) / 2, width: width, height: fontSize + offSet)
        layer.alignmentMode = .center
        
        return layer
    }
    
//    private func createImageLayer(rect: CGRect,cardImage: UIImage) -> UIImage {
//        let width = rect.width
//        let height = rect.height
        
//        let fontSize = min(width, height) / 4
//        let offSet = min(width, height) * 0.1
        
//        let image = UIImage()
//        image.string = "\(Int(progress * 100))"
//        image.backgroundColor = UIColor.clear.cgColor
//        image.foregroundColor = textColor
//        image.fontSize = fontSize
//        image.frame = CGRect(x: 0, y: (height - fontSize - offSet) / 2, width: width, height: fontSize + offSet)
//        image.alignmentMode = .center
        
//        return image
//    }
    
    
    private func didProgressUpdated(){
        textLayer?.string = "\(Int(progress * 100))"
        foregroundLayer?.strokeEnd = progress
    }

}

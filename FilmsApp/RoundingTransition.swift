
import UIKit
import Foundation
// анимация открытия постера в полноэкранном режиме
class RoundingTransition: NSObject {
    // view круга
    var circle = UIView()
    
    // начальные координаты круга
    var start = CGPoint.zero {
        didSet {
            circle.center = start
        }
    }
    // цвет круга по умолчанию
    var circleColor = UIColor.red
    
    // длительность анимации
    var time = 0.5
    
    // виды состояния анимации
    enum RoundingTransitionProfile: Int {
        case show, cancel, pop
    }
    
    // текущий, рабочий, профиль состояния анимации
    var transitionProfile: RoundingTransitionProfile = .show
}

extension RoundingTransition: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return time
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView
        
        // обработка разных профилей анимации
        if transitionProfile == .show {
            // инструкция для показа view перехода
            if let showedView = transitionContext.view(forKey: UITransitionContextViewKey.to){
                let viewCenter = showedView.center
                circle = UIView()
                circleSetup(showedView,circle,viewCenter)
                showedViewSetup(showedView)
                container.addSubview(circle)
                container.addSubview(showedView)
                
                UIView.animate(withDuration: time, animations: {
                    self.circle.transform = CGAffineTransform.identity
                    showedView.transform = CGAffineTransform.identity
                    showedView.alpha = 1
                    showedView.center = viewCenter
                }, completion: { (success: Bool) in
                    transitionContext.completeTransition(success)
                   })
            }
        } else {
            let transitionModeKey = (transitionProfile == .pop) ? UITransitionContextViewKey.to: UITransitionContextViewKey.from
            
            if let returnableView = transitionContext.view(forKey: transitionModeKey) {
                let viewCenter = returnableView.center
                returnableViewSetup(returnableView, viewCenter)
                
                UIView.animate(withDuration: time, animations: {
                    self.circle.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                    returnableView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                    returnableView.center = self.start
                    returnableView.alpha = 0
                    
                    if self.transitionProfile == .pop {
                        container.insertSubview(returnableView, belowSubview: returnableView)
                        container.insertSubview(self.circle, belowSubview: returnableView)
                    }
                }, completion: { (success: Bool) in
                    returnableView.center = viewCenter
                    returnableView.removeFromSuperview()
                    
                    self.circle.removeFromSuperview()
                    transitionContext.completeTransition(success)
                })
                
            }
        }
        
    }
    // создание круглого view с заданными размерами и положением
    func roundFrame(withViewCenter viewCenter: CGPoint, size viewSize: CGSize, startPoint: CGPoint) -> CGRect{
        let xLength = fmax(startPoint.x, viewSize.width - startPoint.x)
        let yLength = fmax(startPoint.y, viewSize.height - startPoint.y)
        
        let offsetVector = sqrt(xLength * xLength + yLength * yLength) * 2
        let size = CGSize(width: offsetVector, height: offsetVector)
        
        return CGRect(origin: CGPoint.zero, size: size)
    }
    // подробная настройка круглого view
    func circleSetup(_ view: UIView, _ circle: UIView,_ center: CGPoint) {
        let viewSize = view.frame.size
        circle.frame = roundFrame(withViewCenter: center, size: viewSize, startPoint: start)
        circle.layer.cornerRadius = circle.frame.size.height/2
        circle.center = start
        circle.backgroundColor = circleColor
        circle.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
    }
    // настройка отображаемого view
    func showedViewSetup(_ showedView: UIView){
        showedView.center = start
        showedView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
        showedView.alpha = 0
    }
    
    func returnableViewSetup(_ returnableView:UIView, _ center: CGPoint){
        let viewSize = returnableView.frame.size
        circle.frame = roundFrame(withViewCenter: center, size: viewSize, startPoint: start)
        circle.layer.cornerRadius = circle.frame.size.height/2
        circle.center = start
    }
    
}



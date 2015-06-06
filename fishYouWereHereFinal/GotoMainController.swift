
import UIKit

class GotoMainController: UIViewController {
    
    var window: UIWindow?
    var mask: CALayer?
    var imageView: UIImageView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        println("goto view controller loaded")
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        let imageView = UIImageView(frame: self.window!.frame)
        imageView.image = UIImage(named: "firstViewControllerScreenShot")
        self.window!.addSubview(imageView)
        self.mask = CALayer()
        self.mask!.contents = UIImage(named: "fish2")!.CGImage
        self.mask!.contentsGravity = kCAGravityResizeAspect
        self.mask!.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        self.mask!.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.mask!.position = CGPoint(x: imageView.frame.size.width/2, y: imageView.frame.size.height/2)
        imageView.layer.mask = mask
        self.imageView = imageView
        
        animateMask()
        
        // Override point for customization after application launch.
        self.window!.backgroundColor = UIColor(red: 70/255, green: 154/255, blue: 233/255, alpha: 1)
        self.window!.makeKeyAndVisible()
        UIApplication.sharedApplication().statusBarHidden = true
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func animateMask() {
        let keyFrameAnimation = CAKeyframeAnimation(keyPath: "bounds")
        keyFrameAnimation.delegate = self
        keyFrameAnimation.duration = 1
        keyFrameAnimation.beginTime = CACurrentMediaTime() + 1 //add delay of 1 second
        let initalBounds = NSValue(CGRect: mask!.bounds)
        let secondBounds = NSValue(CGRect: CGRect(x: 0, y: 0, width: 90, height: 90))
        let finalBounds = NSValue(CGRect: CGRect(x: 0, y: 0, width: 1500, height: 1500))
        keyFrameAnimation.values = [initalBounds, secondBounds, finalBounds]
        keyFrameAnimation.keyTimes = [0, 0.3, 1]
        keyFrameAnimation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut), CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)]
        self.mask!.addAnimation(keyFrameAnimation, forKey: "bounds")
    }
    
    override func animationDidStop(anim: CAAnimation!, finished flag: Bool) {
        headerToViewControllerNumeroUno()

        self.imageView!.layer.mask = nil //remove mask when animation completes
        println("TEESSSST")
        headerToViewControllerNumeroUno()
        //        self.window!.backgroundColor = nil
        self.imageView!.image = nil
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        
        
    }
    
    func headerToViewControllerNumeroUno(){
        performSegueWithIdentifier("gotoMain", sender: nil)
        
    }
    
    
    
}


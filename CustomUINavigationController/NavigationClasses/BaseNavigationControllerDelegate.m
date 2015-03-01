//
//  TransitionViewControllerDelegate.m
//  ABCustomUINavigationController
//
//  Created by Andres Brun Moreno on 27/02/15.
//  Copyright (c) 2015 Andrés Brun. All rights reserved.
//

#import "BaseNavigationControllerDelegate.h"
#import "BaseControllerAnimatedTransitioningDelegate.h"

@implementation BaseNavigationControllerDelegate

- (instancetype)initWithAnimatedTransitioning:(BaseControllerAnimatedTransitioningDelegate *)animatedTransitioningUsed {
    self = [super init];
    if (self) {
        self.transitionDelegate = animatedTransitioningUsed;
    }
    return self;
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC {
    self.transitionDelegate.presenting = (operation == UINavigationControllerOperationPush);
    return self.transitionDelegate;
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.forwardDelegate) {
        [self.forwardDelegate navigationController:navigationController willShowViewController:viewController animated:animated];
    }
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.forwardDelegate) {
        [self.forwardDelegate navigationController:navigationController didShowViewController:viewController animated:animated];
    }
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    if (self.forwardDelegate) {
        return [self.forwardDelegate navigationController:navigationController interactionControllerForAnimationController:animationController];
    }
    return nil;
}

- (UIInterfaceOrientation)navigationControllerPreferredInterfaceOrientationForPresentation:(UINavigationController *)navigationController {
    if (self.forwardDelegate) {
        return [self.forwardDelegate navigationControllerPreferredInterfaceOrientationForPresentation:navigationController];
    }
    return UIInterfaceOrientationPortrait;
}

- (NSUInteger)navigationControllerSupportedInterfaceOrientations:(UINavigationController *)navigationController {
    if (self.forwardDelegate) {
        return [self.forwardDelegate navigationControllerSupportedInterfaceOrientations:navigationController];
    }
    return UIInterfaceOrientationMaskPortrait;
}

@end

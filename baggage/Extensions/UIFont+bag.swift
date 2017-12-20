//
//  UIFont+bag.swift
//  baggage
//
//  Created by Nicolas Palmieri on 12/19/17.
//  Copyright © 2017 Nicolas Palmieri. All rights reserved.
//

import UIKit

extension UIFont {

    private enum FontSize: CGFloat {
        case Bigger = 40.0
        case Big = 29.0
        case Header = 20.0
        case BodyTitle = 18.0
        case Body = 16.0
        case BodySmall = 15.0
        case Small = 14.0
    }

    class func defaultFont(size: CGFloat) -> UIFont {
        return UIFont(name: "Latam_Sans_Regular", size: size)!
    }

    class func defaultFontBold(size: CGFloat) -> UIFont {
        return UIFont(name: "Latam_Sans_Bold", size: size)!
    }

    class func defaultFontLight(size: CGFloat) -> UIFont {
        return UIFont(name: "Latam_Sans_Light", size: size)!
    }

    private func withTraits(traits: UIFontDescriptorSymbolicTraits...) -> UIFont {
        let descriptor = self.fontDescriptor
            .withSymbolicTraits(UIFontDescriptorSymbolicTraits(traits))
        return UIFont(descriptor: descriptor!, size: 0)
    }

    // feel free to add methods needed as the app grows.
    class func bigger() -> UIFont {
        return defaultFont(size: FontSize.Bigger.rawValue)
    }

    class func big() -> UIFont {
        return defaultFont(size: FontSize.Big.rawValue)
    }

    class func body() -> UIFont {
        return defaultFont(size: FontSize.Body.rawValue)
    }

    class func bodyBold() -> UIFont {
        return defaultFontBold(size: FontSize.Body.rawValue)
    }

    class func bodyTitle() -> UIFont {
        return defaultFont(size: FontSize.BodyTitle.rawValue)
    }

    class func bodyTitleItalic() -> UIFont {
        return bodyTitle().withTraits(traits: .traitItalic)
    }

    class func bodyTitleBold() -> UIFont {
        return bodyTitle().withTraits(traits: .traitBold)
    }

    class func bodySmall() -> UIFont {
        return defaultFont(size: FontSize.BodySmall.rawValue)
    }

    class func bodySmallItalic() -> UIFont {
        return bodySmall().withTraits(traits: .traitItalic)
    }

    class func bodySmallBold() -> UIFont {
        return bodySmall().withTraits(traits: .traitBold)
    }

    class func header() -> UIFont {
        return defaultFont(size: FontSize.Header.rawValue)
    }

    class func headerBold() -> UIFont {
        return header().withTraits(traits: .traitBold)
    }

    class func small() -> UIFont {
        return defaultFont(size: FontSize.Small.rawValue)
    }

    class func smallItalic() -> UIFont {
        return small().withTraits(traits: .traitItalic)
    }

    class func smallBold() -> UIFont {
        return defaultFontBold(size: FontSize.Small.rawValue)
    }
}

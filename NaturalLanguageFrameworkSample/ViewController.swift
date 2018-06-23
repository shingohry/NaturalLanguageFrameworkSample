//
//  ViewController.swift
//  NaturalLanguageFrameworkSample
//
//  Created by Shingo Hiraya on 6/23/18.
//  Copyright © 2018 Shingo Hiraya. All rights reserved.
//

import UIKit
import NaturalLanguage

class ViewController: UIViewController {
    
    @IBAction func tokenizeButtonDidTap(_ sender: Any) {
        let text = """
        All human beings are born free and equal in dignity and rights.
        They are endowed with reason and conscience and should act towards one another in a spirit of brotherhood.

        All human beings.
        """
        
        print("---word---")
        let wordTokenizer = NLTokenizer(unit: .word)
        wordTokenizer.string = text
        wordTokenizer.enumerateTokens(in: text.startIndex..<text.endIndex) { tokenRange, _ in
            print(tokenRange, text[tokenRange])
            return true
        }
        
        print("\n---sentence--")
        let sentenceTokenizer = NLTokenizer(unit: .sentence)
        sentenceTokenizer.string = text
        sentenceTokenizer.enumerateTokens(in: text.startIndex..<text.endIndex) { tokenRange, _ in
            print(text[tokenRange])
            return true
        }
        
        print("\n---paragraph--")
        let paragraphTokenizer = NLTokenizer(unit: .paragraph)
        paragraphTokenizer.string = text
        paragraphTokenizer.enumerateTokens(in: text.startIndex..<text.endIndex) { tokenRange, _ in
            print(text[tokenRange])
            return true
        }
        
        print("\n---document--")
        let documentTokenizer = NLTokenizer(unit: .document)
        documentTokenizer.string = text
        documentTokenizer.enumerateTokens(in: text.startIndex..<text.endIndex) { tokenRange, _ in
            print(text[tokenRange])
            return true
        }
    }
}

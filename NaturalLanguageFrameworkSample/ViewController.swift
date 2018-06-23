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
    
    @IBAction func tokenize(_ sender: Any) {
        /**
         https://developer.apple.com/documentation/naturallanguage/tokenizing_natural_language_text
         
         When you work with natural language text, it’s often useful to tokenize the text into individual words. Using NLTokenizer to enumerate words, rather than simply splitting components by whitespace, ensures correct behavior in multiple scripts and languages. For example, neither Chinese nor Japanese uses spaces to delimit words.
         
         The example and accompanying steps below show how you use NLTokenizer to enumerate over the words in natural language text.
         */
        let text = """
        All human beings are born free and equal in dignity and rights.
        They are endowed with reason and conscience and should act towards one another in a spirit of brotherhood.

        All human beings.
        """
        
        print("---word---")
        // 1. Create an instance of NLTokenizer, specifying NLTokenUnit.word as the unit to tokenize.
        let wordTokenizer = NLTokenizer(unit: .word)
        // 2. Set the string property of the tokenizer to the natural language text.
        wordTokenizer.string = text
        // 3. Enumerate over the entire range of the string by calling the enumerateTokens(in:using:) method, specifying the entire range of the string to process.
        wordTokenizer.enumerateTokens(in: text.startIndex..<text.endIndex) { tokenRange, _ in
            // 4. In the enumeration block, take a substring of the original text at tokenRange to obtain each word.
            // 5. Run this code to print out each word in text on a new line.
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
    
    @IBAction func identify(_ sender: Any) {
        /**
         https://developer.apple.com/documentation/naturallanguage/identifying_parts_of_speech
         
         Identifying the parts of speech for words in natural language text can help your program understand the meaning of sentences. For example, provided the transcription of a request spoken by the user, you might programmatically determine general intent by looking at only the nouns and verbs.
         
         The example below shows how to use NLTagger to enumerate over natural language text and identify the part of speech for each word.
         */
        
        let text = "The ripe taste of cheese improves with age."
        
        print("\n---lexicalClass--")
        // 1. Create an instance of NLTagger, specifying lexicalClass as the tag scheme to be used.
        let tagger = NLTagger(tagSchemes: [.lexicalClass])
        // 2. Set the string property of the linguistic tagger to the natural language text.
        tagger.string = text
        // 3. Create the options to omit punctuation and whitespace.
        let options: NLTagger.Options = [.omitPunctuation, .omitWhitespace]
        // 4. Enumerate over the entire range of the string, specifying word as the tag unit and lexicalClass as the tag scheme, and the tagger options.
        tagger.enumerateTags(in: text.startIndex..<text.endIndex, unit: .word, scheme: .lexicalClass, options: options) { tag, tokenRange in
            // 5. In the enumeration block, take a substring of the original text at tokenRange to obtain each word.
            if let tag = tag {
                // 6. Run this code to print out each word and its part of speech on a new line.
                print("\(text[tokenRange]): \(tag.rawValue)")
            }
            return true
        }
        
        print("\n---language--")
        let languageTagger = NLTagger(tagSchemes: [.language])
        languageTagger.string = text
        let languageOptions: NLTagger.Options = [.omitPunctuation, .omitWhitespace]
        languageTagger.enumerateTags(in: text.startIndex..<text.endIndex, unit: .word, scheme: .language, options: languageOptions) { tag, tokenRange in
            if let tag = tag {
                print("\(text[tokenRange]): \(tag.rawValue)")
            }
            return true
        }
        
        print("\n---lemma--")
        let lemmaTagger = NLTagger(tagSchemes: [.lemma])
        lemmaTagger.string = text
        let lemmaOptions: NLTagger.Options = [.omitPunctuation, .omitWhitespace]
        lemmaTagger.enumerateTags(in: text.startIndex..<text.endIndex, unit: .word, scheme: .lemma, options: lemmaOptions) { tag, tokenRange in
            if let tag = tag {
                print("\(text[tokenRange]): \(tag.rawValue)")
            }
            return true
        }
        
        print("\n---script--")
        let scriptTagger = NLTagger(tagSchemes: [.script])
        scriptTagger.string = text
        let scriptOptions: NLTagger.Options = [.omitPunctuation, .omitWhitespace]
        scriptTagger.enumerateTags(in: text.startIndex..<text.endIndex, unit: .word, scheme: .script, options: scriptOptions) { tag, tokenRange in
            if let tag = tag {
                print("\(text[tokenRange]): \(tag.rawValue)")
            }
            return true
        }
    }
}

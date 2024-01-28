class Solution {

    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        
        var magDict = [Character:Int]()

        for letter in magazine {
            magDict[letter, default: 0] += 1
        }

        for letter in ransomNote {
            if let letterCount = magDict[letter], letterCount > 0 {
                magDict[letter] = letterCount - 1
            } else {
                return false
            }
        }
        return true
    }
}

// definition of abbr
// 1. no continuous abbr, the number must be representing one word only
// 2. no zero, except it's after another number
// 3. whenever we have number, it substitude for a series of chars

// observation
// if number has a leading zero, return false
// if number is larger than the length, return false (adjacent)
// check if the number is right before we encounter the next english char

//==================
// PLAN
//
// for loop to go thru the word
// if each location is the same as abbr, coontinue
// if not, check if it's a valid abbr
// --- how? get the number 
// first check if it's within (1-10)
// -- no, return false
// second, check if it's larger than the word length
// -- yes, return  false
// third, skip the number of chars in the word (i += num)
// -- continue checking in the next iteration

//==================


class Solution {
    func validWordAbbreviation(_ word: String, _ abbr: String) -> Bool {

        var wordArr = Array(word)
        var abbrArr = Array(abbr)
        var wordIndex = 0
        var i = 0

        while i < abbrArr.count && wordIndex < wordArr.count {
            if !abbrArr[i].isNumber {
                if abbrArr[i] == wordArr[wordIndex] { i += 1; wordIndex += 1; continue }
                else { return false }
            }
            let val = getNumber(abbrArr, i)
            if val > wordArr.count { return false }
            
            switch val {
                case ...0: return false
                case 1...9: wordIndex += (val-1)
                case 10...20: i += 1; wordIndex += (val-1)
                default: print(""); return false
            }
            i += 1
            wordIndex += 1
        }
        if i == abbrArr.count && wordIndex == wordArr.count {
            return true
        }
        return false
    }

    func getNumber (_ abbrArr: [Character], _ index: Int) -> Int {
        let n = Int(String(abbrArr[index])) ?? 0
        if index != abbrArr.count - 1 {
            let num2 = abbrArr[index+1]
            if num2.isNumber {
                let n2 = Int(String(num2)) ?? 0
                return n*10 + n2
            }
        }
        return n
    }
}
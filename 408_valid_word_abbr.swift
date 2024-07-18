
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
            let (val, c) = getNumber(abbrArr, i)
            if val > wordArr.count { return false }
            
            switch val {
                case ...0: return false
                case 1...9: wordIndex += (val-1)
                case 10...: i += c; wordIndex += (val-1)
                default: print("ya"); return false
            }
            i += 1
            wordIndex += 1
        }
        if i == abbrArr.count && wordIndex == wordArr.count {
            return true
        }
        return false
    }

    func getNumber (_ abbrArr: [Character], _ index: Int) -> (Int, Int) {
        var n = Int(String(abbrArr[index])) ?? 0
        if n == 0 { return (-1, 0) }
        var count = 0
        var i = index
        while i != abbrArr.count - 1 {
            let num2 = abbrArr[i+1]
            if !num2.isNumber { break }
            let n2 = Int(String(num2)) ?? 0
            n = n*10 + n2
            count += 1
            i += 1
        }
        return (n, count)
    }
}
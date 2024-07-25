class Solution {

    // 3 materials
    // an array of basic numbers 0~9
    let basics : [String] = [
        "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine"
    ]
    // an array of 2nd-digit numbers 10,20,30...90
    let tens : [String] = [
        "Ten", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"
    ]
    // an array of 11~19
    let teens : [String] = [
        "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen"
    ]
    
    // answer array to insert strings to the beginning
    var res : [String] = []

    func numberToWords(_ num: Int) -> String {
    
        if num == 0 {
            return "Zero"
        }
        
        // 3 major parts
        storeWords(0, num % 1000)
        if num >= 1000 {
            storeWords(1, (num / 1000) % 1000)
        }
        if num >= 1000000 {
            storeWords(2, (num / 1000000) % 1000)
        }
        if num >= 1000000000 {
            storeWords(3, (num / 1000000000) % 1000)
        }

        // return the answer string
        let ans = res.joined(separator: " ")
        return ans
    }
    func storeWords(_ part: Int, _ num: Int) {
        // process last 2 digits
        var count = 0
        let digits = num % 100
        var hasSTH = digits > 0 ? true : false

        if digits >= 20 {
            let second = digits / 10
            let first = digits % 10
            if first != 0 {
                res.insert(basics[first-1], at: 0)
                count += 1
            }
            res.insert(tens[second-1], at: 0)
            count += 1
        } else if digits > 10 {
            res.insert(teens[digits-11], at: 0)
            count += 1
        } else if digits == 10 {
            res.insert(tens[0], at: 0)
            count += 1
        } else if digits >= 1 {
            let first = digits % 10
            res.insert(basics[first-1], at: 0)
            count += 1
        }
        // process hundred
        let hundred = num / 100
        if hundred != 0 {
            res.insert("Hundred", at: 0)
            res.insert(basics[hundred-1], at: 0)
            count += 2
            hasSTH = true
        }
        // process thousand, million, and billion
        if hasSTH {
            switch part {
                case 1:
                res.insert("Thousand", at: count)
                case 2:
                res.insert("Million", at: count)
                case 3:
                res.insert("Billion", at: count)
                default:
                hasSTH = true
            }
        }
    }
}
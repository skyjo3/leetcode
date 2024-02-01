class Solution {
    func romanToInt(_ s: String) -> Int {
        
        var count = 0
        let letters = Array(s)
        var i = 0

        while i < letters.count {
            switch letters[i] {
                case "I":
                    // check next
                    if i != letters.count-1 {
                        if letters[i+1] == "V" {
                            count += 4
                            i += 2
                            continue
                        } else if letters[i+1] == "X" {
                            count += 9
                            i += 2
                            continue
                        }
                    }
                    count += 1
                case "V":
                    count += 5
                case "X":
                    // check next
                    if i != letters.count-1 {
                        if letters[i+1] == "L" {
                            count += 40
                            i += 2
                            continue
                        } else if letters[i+1] == "C" {
                            count += 90
                            i += 2
                            continue
                        }
                    }
                    count += 10
                case "L":
                    count += 50
                case "C":
                    // check next
                    if i != letters.count-1 {
                        if letters[i+1] == "D" {
                            count += 400
                            i += 2
                            continue
                        } else if letters[i+1] == "M" {
                            count += 900
                            i += 2
                            continue
                        }
                    }
                    count += 100
                case "D":
                    count += 500
                case "M":
                    count += 1000
                default:
                    print("sth wrong")
            }
            i += 1
        }
        return count
    }
}
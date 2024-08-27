class Solution {
    func multiply(_ num1: String, _ num2: String) -> String {
        if num1 == "0" || num2 == "0" { return "0" }
        
        let n1 = Array(num1.reversed())
        let n2 = Array(num2.reversed())
        
        var arr : [Int] = Array(repeating: 0, count: n1.count + n2.count)

        for j in 0 ..< n2.count {
            for i in 0 ..< n1.count {
                let digit = (Int(String(n1[i])) ?? 0) * (Int(String(n2[j])) ?? 0)
                arr[i+j] += digit
                arr[i+j+1] += arr[i+j] / 10
                arr[i+j] = arr[i+j] % 10
            }
        }
        arr = arr.reversed()
        var numOfZero = 0
        while numOfZero < arr.count && arr[numOfZero] == 0 {
            numOfZero += 1
        }
        return arr[numOfZero...].map { String($0) }.joined()
    }
}
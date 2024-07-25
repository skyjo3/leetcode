class Solution {
    
    func romanToInt(_ s: String) -> Int {
        var res = 0
        var i = 0
        var arr = Array(s)
        
        while i < arr.count {
            print(arr[i])
            var prev : Character = "A"
            if i-1 >= 0 { prev = arr[i-1] }
            
            switch arr[i] {
                case "M": res += prev != "C" ? 1000 : 800
                case "D": res += prev != "C" ? 500 : 300
                case "C": res += prev != "X" ? 100 : 80   
                case "L": res += prev != "X" ? 50 : 30   
                case "X": res += prev != "I" ? 10 : 8      
                case "V": res += prev != "I" ? 5 : 3
                case "I": res += 1     
                default: break // error
            }
            
            i += 1
        }
        return res
    }
}
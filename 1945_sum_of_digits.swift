class Solution {
    let dict: [Character: String] = [
        "a": "1",
        "b": "2",
        "c": "3",
        "d": "4",
        "e": "5",
        "f": "6",
        "g": "7",
        "h": "8",
        "i": "9",
        "j": "10",
        "k": "11",
        "l": "12",
        "m": "13",
        "n": "14",
        "o": "15",
        "p": "16",
        "q": "17",
        "r": "18",
        "s": "19",
        "t": "20",
        "u": "21",
        "v": "22",
        "w": "23",
        "x": "24",
        "y": "25",
        "z": "26"
    ]

    func getSum(_ s: String) -> String {
        let arr = Array(s)
        var sum = 0
        for i in 0 ..< arr.count {
            sum += Int(String(arr[i]))!
        }
        return String(sum)
    }

    func getLucky(_ s: String, _ k: Int) -> Int {
        var str = ""
        let arr = Array(s)
        for i in 0 ..< s.count {
            if let char = dict[arr[i]] {
                str += char
            }
        }
        for j in 0 ..< k {
            str = getSum(str)
        }
        return Int(str)!
    }
}
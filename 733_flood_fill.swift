class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int) -> [[Int]] {
        
        var affectedPixels:[[Int]] = image

        if image[sr][sc] != color {
            affectedPixels = fill(affectedPixels, sr, sc, color, image[sr][sc])
        }
        
        return affectedPixels
    }

    private func fill (_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int, _ originalColor: Int) -> [[Int]] {
        
       guard sr >= 0, sr < image.count, sc >= 0, sc < image[0].count, originalColor == image[sr][sc] else {
            return image
        }

        // Change the color of the current pixel
        var newImage = image
        newImage[sr][sc] = color

        // Recursively fill neighboring pixels
        newImage = fill(newImage, sr + 1, sc, color, originalColor)
        newImage = fill(newImage, sr - 1, sc, color, originalColor)
        newImage = fill(newImage, sr, sc + 1, color, originalColor)
        newImage = fill(newImage, sr, sc - 1, color, originalColor)

        return newImage
    }

}
import UIKit

/*
 Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.
 
Note:  the solution set must not contain duplicate triplets.

Example 1:

 Input: nums = [-1,0,1,2,-1,-4]
Output: [[-1,-1,2],[-1,0,1]]
Explanation:
  nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0.
  nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0.
  nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0.
  The distinct triplets are [-1,0,1] and [-1,-1,2].

!! Notice that the order of the output and the order of the triplets
 does not matter.
*/

func threeSum(_ nums: [Int]) -> [[Int]] {
    let sortedArray = nums.sorted { $0 < $1}
    var result: [Int] = []
    
    for i in 0..<sortedArray.count - 2 {
        
        if sortedArray[i] > 0 {
            break
        }
        
        if (i > 0 && sortedArray[i-1] == sortedArray[i]) {
            continue
        }
        
        let j = i + 1
        let k = nums.count - 1
        
        while (j < k) {
            let sum = sortedArray[i] + sortedArray[j] + sortedArray[k]
            if sum < 0 {
                j += 1
            } else if sum > 0 {
                k -= 1
            } else {
                result.append([sortedArray[i], sortedArray[j], sortedArray[k]])
                
                while (j < k) {
                    j += 1
                    if (sortedArray[j] != sortedArray[j-1]) { break }
                }
                
                while (j < k) {
                    k -= 1
                    if (sortedArray[k] != sortedArray[k+1]) { break }
                }
            }
        }
    }
}

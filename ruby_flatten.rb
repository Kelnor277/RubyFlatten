#Requires the arr variable to be an array of arrays or integers. Passing something else will put the object in the new list.
#See last 2 testcases for examples where a hash and a string were put in the input.
#(Note the fails of those last two test cases only happen because the reference array was not updated. They're just for examples)
class RubyFlatten
  def self.flatten_recursive(arr)
    result = []
    if arr.is_a? Array
      arr.each do |element|
        if element.is_a? Array
          result += flatten_recursive(element)
        else
          result << element
        end
      end
    end
    return result
  end

  def self.flatten_non_recurssive(arr)
    result = []
    if arr.is_a? Array
      queue = arr
      until queue.empty?
        element = queue.shift
        if element.is_a? Array
          queue = element + queue
        else
          result.push element
        end
      end
    end
    return result
  end
  #testing
  reference = [1,2,3,4,5,6,7,8,9,10,11,12]
  test_cases = [[1,2,3,4,5,6,7,8,9,10,11,12],
                [1,2,3,4,5,[6,7],8,9,10,11,12],
                [1,2,3,4,[5,6,7],8,[9,10,11],12],
                [1,2,3,[4,5,[6,7],8],9,[10,11,12]],
                [1,2,[3,[4,[5,6,[7,[8,9]],10],11],12]],
                [1,2,3,4,5,6,7,8,9,10,{11=>12}],
                [1,2,3,4,5,6,7,8,9,[10,"a"]]]
  test_cases.each do |test_case|
    flat_test = flatten_recursive(test_case)
    flat_test_result = reference == flat_test
    print "recursive test using #{test_case} array\n"
    print "Test for flat_test: #{flat_test_result} return: #{flat_test}\n"
    flat_test = flatten_non_recurssive(test_case)
    flat_test_result = reference == flat_test
    print "non-recursive test using #{test_case} array\n"
    print "Test for flat_test: #{flat_test_result} return: #{flat_test}\n"
  end
end
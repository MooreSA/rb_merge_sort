require 'pry'

def sort(input)
  if input.length <= 1
    input
  else
    half = input.length / 2
    left_half = sort(input[0...half])
    right_half = sort(input[half..-1])
    merge(left_half, right_half)
  end
end

def merge(left_half, right_half, result = [])
  return left_half if right_half.nil?

  until left_half.length.zero? && right_half.length.zero?
    if left_half.length.zero?
      result.append(right_half.shift)
    elsif right_half.length.zero?
      result.append(left_half.shift)
    else
      left_half[0] < right_half[0] ? result.append(left_half.shift) : result.append(right_half.shift)
    end
  end
  result
end

p sort([5,3,2,7,1,7,5,12,52,63,1,0])
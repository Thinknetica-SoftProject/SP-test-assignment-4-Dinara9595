## Задача №2:
#
# Ганс Грубер в это время пытается намайнить биткоины - чтобы сделать это ему нужно найти MD5 хэши,
# которые начинаются как минимум с 5 нулей.
# Значение, хэш которого нужно посчитать - это инпут (пользовательский ввод), за которым следует положительное число (1, 2, 3 итд).
#
# Например, для инпута abcdef результатом будет число 609043, потому что MD5 хэш для abcdef609043 начинается с 5 нулей (000001dbbfa...)
# и это минимальное такое число.
#
# Помогите Гансу найти это число.
#
# Требования к решению:
# - Инпут вводится пользователем (получение данных в коде через команду gets)
# - Результат (число) выводится через puts
#
#
## Решение:

require 'digest'

class Find_key

  attr_accessor :key, :number

  def initialize(key, number)
    @key = key
    @number = number
  end

  def addition_number
    @number = @number.to_i + 1
  end

  def start_5_zeroes
    md5_hash = Digest::MD5.new
    md5_hash.update(@key + @number.to_s)
    md5_hash.hexdigest.start_with?("00000")
  end
end

  input = gets
  find_key = Find_key.new(input.chomp, "0")
  find_key.addition_number until find_key.start_5_zeroes
  puts find_key.number
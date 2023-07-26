str = "Hi"

str.bytes
# => [72, 105] # Decimal bytes (for humans)

# Why 72 and 105?
#
# Letter `H` (uppercase) has its decimal code in ASCII table equal to 72 and letter `i` (downcase) has the decimal code 105.
# Letters are in different case to show how ASCII table works clearly. For example letter `I` (uppercase) has the decimal code 73 (just next to H's 72).

str.bytes.map { |b| b.to_s(2) }
# => ["1001000", "1101001"] # String representation of bytes in base 2.

str.bytes.map { |b| b.to_s(2).rjust(8, '0') }
# => ["01001000", "01101001"] # The same but justified to be lenght of 8 with leading zeros.

str.bytes.map { |b| b.to_s(16) }
# => ["48", "69"] # Hex (base 16) representation of bytes

# Together with decimal codes ASCII table contains hexadecimal (hex) codes.
#
# 48 is a decimal number 72 presented in base 16: 72 (decimal) = 48 (hexadecimal)
# 69 is a decimal number 105 presented in base 16: 105 (decimal) = 69 (hexadecimal)
#
# "Hi" => [72, 105] => [0x48, 0x69] - just different forms to represent the same thing (idea, mean).
#

# Why there are both representations: base 10 and base 16?
# The answer is simple: base 10 is more convinient for humans, base 16 - for computers.
#
# ASCII table encodes 256 symbols.
# In base 10 codes could have lenght of 1 (1,2,...,9), 2 (10,11,...,99) and 3 (100,101,...,255).
# In hex format codes are 1 or two symbols lenght only: 0,1,...,9,0A,0B,...,FF.
# See ascii.txt for details.

# Packing data
# https://ruby-doc.org/3.2.2/packed_data_rdoc.html
#
# Examples of getting bytes from strings can be rewritten with `String#unpack` method as follow:

# Decimal ACSII codes
str.bytes == str.unpack('cc')
# => true
str.bytes == str.unpack('c2')
# => true
str.bytes == str.unpack('c*')
# => true
str.unpack('c*')
# => [72, 105]

# Bit strings
str.bytes.map { |b| b.to_s(2) } == str.unpack('B8B8')
# => true
str.unpack('B8B8')
# => ["1001000", "1101001"]

# Hexadecimal ASCII codes
str.bytes.map { |b| b.to_s(16) } == str.unpack('H2H2')
# => true
str.unpack('H2H2')
# => ["48", "69"] # Hex (base 16) representation of bytes

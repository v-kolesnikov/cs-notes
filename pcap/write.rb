io = File.open('binary', 'wb')
io << [0xA1B2C3D4].pack('V')
io << [2, 4].pack('S2')
io << [0, 0].pack('V2')
io << [0].pack('V')
io.close

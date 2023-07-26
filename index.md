# CS Notes

Or what I would like to know clear (ясно).

- bytes (despite I know bits quite well)
- byte-strings
- encodings
- packing & unpacking bytes (Ruby Array#pack & String#unpack etc)

## Bit

Bit is quite simple as I see: bit is a binary digit or in other words it's something that has a dual nature: left and right, up and bottom, black and white, 0 (zero) and 1 (one). Bit is an *abstraction* to represent anything that has such dual nature:

- Black and white picture (or a screen to present such picture). The bit there is not an entire picture or screen, but each smallest fragment of the picture (also known as pixel - pix (picture) element) is a bit. Each element may be in one of two states (or accepts one of two values): black and white.

One more time: bit - is an abstraction. It is important to understand once in order not to confuse further.
A good example of what the abstraction is - is a meridian. What color a meridian is? What width and length?
There is no answer since a meridian is an abstraction that does not provide such properties as color, width and length. You can't see a meridian when you fly and yet you are able to think about meridians and imagine what they are clearly.

Example of bit. Imagine a primitive screen: wooden board 4x5 rows. In each row you can write down `X` or `O`. Only one of two.
Each row is a bit. Knowing this you can use rows-bits as stones to build something bigger than just a heap of stones: you can *order* things. You have a language and letters. You can build (draw) a letter on the board (screen), `L` for example, from bits as follow:


```
X O O O
X O O O
X O O O
X O O O
X X X X
```

...to be continue

## Byte

Byte in simple words is just a set of 8 bits. Sounds easy and is quite enough for start honestly.
But underlying nature of bytes is much more complex and reason for that is bytes in comparison with bits mostly are not an abstraction but an implementation. Being an implementation makes them different in different contexts (computer platforms).
Byte is not strongly a set of 8 bits. It could by any number of bits, it depends. Historically there were bytes of 6, 32 and 36 bits. It doesn't matter so much. It just for convenience. The number of bits in a single byte is how much bits the current platform could accept at once.

- *Octet* - is a canonical name for 8-bits based *bytes*.

As soon as byte is 8-bits and each bit may be only one of two (0 or 1 for example, but it doesn't matter which values exactly, it could be black and white for example) - so there is final and counted set of values that byte accepts: 2^8 = 256.


```
0 0 0 0 0 0 0 0 - the first possible byte: 8 zeros
0 0 0 0 0 0 0 1 - another byte: 7 zeros and 1 at the most right postition
0 0 0 0 0 0 1 0 - the same byte but with 1 in the last but one right position
0 0 0 0 0 0 1 1 - the same byte but with 1 in the last two positions
0 0 0 0 0 1 0 0 - the next byte figured out that way
... (the rest are from 256 bytes)

1 1 1 1 1 1 1 1 - the last byte figured out that way
```

This example is quite common in modern computers but it is not a only way to represent bytes. Bytes may grow on the left to right:

```
0 0 0 0 0 0 0 0 - the first byte is the same
1 0 0 0 0 0 0 0 - another byte: 7 zeros and 1 at the most *left* postition
0 1 0 0 0 0 0 0
1 1 0 0 0 0 0 0
0 0 1 0 0 0 0 0
... (the rest are from 256 bytes)
1 1 1 1 1 1 1 1 - the last byte figured out that way
```

## ASCII table

There is common standard in modern computers called ASCII table. ASCII is American Standard Code for Information Interchange. Literally ASCII is an alphabet for computers.

---

## References

- https://mcilloni.ovh/2023/07/23/unicode-is-hard/
- https://www.davidegrayson.com/presentations/20140507-binary-data-ruby/binary-data-ruby.pdf

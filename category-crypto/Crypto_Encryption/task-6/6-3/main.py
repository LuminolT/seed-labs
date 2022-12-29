'''
Author: LuminolT luminol.chen@gmail.com
Date: 2022-12-29 14:02:04
LastEditors: LuminolT luminol.chen@gmail.com
LastEditTime: 2022-12-30 00:12:28
FilePath: /6-3/main.py
Description:

Copyright (c) 2022 by LuminolT luminol.chen@gmail.com, All Rights Reserved.
'''
from pwn import *
from binascii import hexlify, unhexlify
from utils import *

conn = remote('10.9.0.80', '3000')

bob_cipher = conn.recvline_contains(b'cipher').split()[-1]
bob_iv = conn.recvline_contains(b'IV').split()[-1]

print('(*) bob cipher:'.ljust(15), bob_cipher)
print('(*) bob iv:'.ljust(15), bob_iv)

for item in [b'Yes', b'No']:
    print('-'*20 + f' {item} '.ljust(8) + '-'*20)
    text_p = PKCS7_padding(item, 16)
    next_iv = conn.recvline_contains(b'Next').split()[-1]
    tmp = xor(unhexlify(bob_iv), unhexlify(next_iv))
    res = xor(tmp, text_p)
    print('(*) next iv:'.ljust(15), next_iv)
    # conn.interactive()
    print('(*) send data:'.ljust(15), hexlify(res))
    conn.sendline(hexlify(res))
    print('(=) recv data:'.ljust(15), conn.recvline().split()[-1])

'''
Author: LuminolT luminol.chen@gmail.com
Date: 2022-12-30 00:11:59
LastEditors: LuminolT luminol.chen@gmail.com
LastEditTime: 2022-12-30 00:12:14
FilePath: /6-3/utils.py
Description: 

Copyright (c) 2022 by LuminolT luminol.chen@gmail.com, All Rights Reserved. 
'''


def xor(first, second):
    return bytearray(x ^ y for x, y in zip(first, second))


def PKCS7_padding(data: bytes, block_size: int):
    padding_len = block_size - (len(data) % block_size)
    padding = bytes([padding_len] * padding_len)
    return data + padding

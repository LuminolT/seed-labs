###
 # @Author: LuminolT copper_sulfate@qq.com
 # @Date: 2022-12-27 08:06:42
 # @LastEditors: LuminolT copper_sulfate@qq.com
 # @LastEditTime: 2022-12-27 08:12:01
 # @FilePath: /Lab-2-Crpyto-Sym/task-5/4-auto.sh
 # @Description: 
 # 
 # Copyright (c) 2022 by LuminolT copper_sulfate@qq.com, All Rights Reserved. 
### 

openssl enc -aes-128-ecb -e -in text.txt -out text_ecb.dat \
            -K 00112233445566778899aabbccddeeff
dd if=text_ecb.dat bs=1 skip=54 count=1 conv=notrunc | \
    xxd -p -c1 | \
    awk '{ printf "%02x", $1 ^ 1 }' | \
    xxd -r -p | \
    dd of=text_ecb.dat bs=1 seek=54 count=1 conv=notrunc
openssl enc -aes-128-ecb -d -in text_ecb.dat -out text_ecb_dec.dat \
            -K 00112233445566778899aabbccddeeff -nopad

openssl enc -aes-128-cbc -e -in text.txt -out text_cbc.dat \
            -K 00112233445566778899aabbccddeeff \
			-iv 0102030405060708
dd if=text_cbc.dat bs=1 skip=54 count=1 conv=notrunc | \
    xxd -p -c1 | \
    awk '{ printf "%02x", $1 ^ 1 }' | \
    xxd -r -p | \
    dd of=text_cbc.dat bs=1 seek=54 count=1 conv=notrunc
openssl enc -aes-128-cbc -d -in text_cbc.dat -out text_cbc_dec.dat \
            -K 00112233445566778899aabbccddeeff \
            -iv 0102030405060708 -nopad

openssl enc -aes-128-ofb -e -in text.txt -out text_ofb.dat \
            -K 00112233445566778899aabbccddeeff \
			-iv 0102030405060708
dd if=text_ofb.dat bs=1 skip=54 count=1 conv=notrunc | \
    xxd -p -c1 | \
    awk '{ printf "%02x", $1 ^ 1 }' | \
    xxd -r -p | \
    dd of=text_ofb.dat bs=1 seek=54 count=1 conv=notrunc
openssl enc -aes-128-ofb -d -in text_ofb.dat -out text_ofb_dec.dat \
            -K 00112233445566778899aabbccddeeff \
            -iv 0102030405060708 -nopad
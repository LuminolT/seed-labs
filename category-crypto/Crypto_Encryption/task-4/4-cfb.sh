###
 # @Author: LuminolT copper_sulfate@qq.com
 # @Date: 2022-12-27 07:35:15
 # @LastEditors: LuminolT copper_sulfate@qq.com
 # @LastEditTime: 2022-12-27 07:36:46
 # @FilePath: /Lab-2-Crpyto-Sym/task-4/4-cfb.sh
 # @Description: 
 # 
 # Copyright (c) 2022 by LuminolT copper_sulfate@qq.com, All Rights Reserved. 
### 
openssl enc -aes-128-cfb -e -in 5.txt -out 5_cfb.dat \
			-K 00112233445566778899aabbccddeeff \
			-iv 0102030405060708
openssl enc -aes-128-cfb -e -in 10.txt -out 10_cfb.dat \
			-K 00112233445566778899aabbccddeeff \
			-iv 0102030405060708
openssl enc -aes-128-cfb -e -in 15.txt -out 15_cfb.dat \
			-K 00112233445566778899aabbccddeeff \
			-iv 0102030405060708
openssl enc -aes-128-cfb -d -in 5_cfb.dat -out 5_cfb_dec.dat \
			-K 00112233445566778899aabbccddeeff \
			-iv 0102030405060708 -nopad
openssl enc -aes-128-cfb -d -in 10_cfb.dat -out 10_cfb_dec.dat \
			-K 00112233445566778899aabbccddeeff \
			-iv 0102030405060708 -nopad
openssl enc -aes-128-cfb -d -in 15_cfb.dat -out 15_cfb_dec.dat \
			-K 00112233445566778899aabbccddeeff \
			-iv 0102030405060708 -nopad
###
 # @Author: LuminolT copper_sulfate@qq.com
 # @Date: 2022-12-27 07:25:22
 # @LastEditors: LuminolT copper_sulfate@qq.com
 # @LastEditTime: 2022-12-27 07:37:01
 # @FilePath: /Lab-2-Crpyto-Sym/task-4/2-cbc.sh
 # @Description: 
 # 
 # Copyright (c) 2022 by LuminolT copper_sulfate@qq.com, All Rights Reserved. 
### 
openssl enc -aes-128-cbc -e -in 5.txt -out 5_cbc.dat \
			-K 00112233445566778899aabbccddeeff \
			-iv 0102030405060708
openssl enc -aes-128-cbc -e -in 10.txt -out 10_cbc.dat \
			-K 00112233445566778899aabbccddeeff \
			-iv 0102030405060708
openssl enc -aes-128-cbc -e -in 15.txt -out 15_cbc.dat \
			-K 00112233445566778899aabbccddeeff \
			-iv 0102030405060708
openssl enc -aes-128-cbc -d -in 5_cbc.dat -out 5_cbc_dec.dat \
			-K 00112233445566778899aabbccddeeff \
			-iv 0102030405060708 -nopad
openssl enc -aes-128-cbc -d -in 10_cbc.dat -out 10_cbc_dec.dat \
			-K 00112233445566778899aabbccddeeff \
			-iv 0102030405060708 -nopad
openssl enc -aes-128-cbc -d -in 15_cbc.dat -out 15_cbc_dec.dat \
			-K 00112233445566778899aabbccddeeff \
			-iv 0102030405060708 -nopad
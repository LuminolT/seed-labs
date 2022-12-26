###
 # @Author: LuminolT copper_sulfate@qq.com
 # @Date: 2022-12-27 07:35:15
 # @LastEditors: LuminolT copper_sulfate@qq.com
 # @LastEditTime: 2022-12-27 07:36:19
 # @FilePath: /Lab-2-Crpyto-Sym/task-4/5-ofb.sh
 # @Description: 
 # 
 # Copyright (c) 2022 by LuminolT copper_sulfate@qq.com, All Rights Reserved. 
### 
openssl enc -aes-128-ofb -e -in 5.txt -out 5_ofb.dat \
			-K 00112233445566778899aabbccddeeff \
			-iv 0102030405060708
openssl enc -aes-128-ofb -e -in 10.txt -out 10_ofb.dat \
			-K 00112233445566778899aabbccddeeff \
			-iv 0102030405060708
openssl enc -aes-128-ofb -e -in 15.txt -out 15_ofb.dat \
			-K 00112233445566778899aabbccddeeff \
			-iv 0102030405060708
openssl enc -aes-128-ofb -d -in 5_ofb.dat -out 5_ofb_dec.dat \
			-K 00112233445566778899aabbccddeeff \
			-iv 0102030405060708 -nopad
openssl enc -aes-128-ofb -d -in 10_ofb.dat -out 10_ofb_dec.dat \
			-K 00112233445566778899aabbccddeeff \
			-iv 0102030405060708 -nopad
openssl enc -aes-128-ofb -d -in 15_ofb.dat -out 15_ofb_dec.dat \
			-K 00112233445566778899aabbccddeeff \
			-iv 0102030405060708 -nopad
###
 # @Author: LuminolT copper_sulfate@qq.com
 # @Date: 2022-12-27 07:35:14
 # @LastEditors: LuminolT copper_sulfate@qq.com
 # @LastEditTime: 2022-12-27 07:40:22
 # @FilePath: /Lab-2-Crpyto-Sym/task-4/3-ecb.sh
 # @Description: 
 # 
 # Copyright (c) 2022 by LuminolT copper_sulfate@qq.com, All Rights Reserved. 
### 
openssl enc -aes-128-ecb -e -in 5.txt -out 5_ecb.dat \
			-K 00112233445566778899aabbccddeeff
openssl enc -aes-128-ecb -e -in 10.txt -out 10_ecb.dat \
			-K 00112233445566778899aabbccddeeff
openssl enc -aes-128-ecb -e -in 15.txt -out 15_ecb.dat \
			-K 00112233445566778899aabbccddeeff
openssl enc -aes-128-ecb -d -in 5_ecb.dat -out 5_ecb_dec.dat \
			-K 00112233445566778899aabbccddeeff -nopad
openssl enc -aes-128-ecb -d -in 10_ecb.dat -out 10_ecb_dec.dat \
			-K 00112233445566778899aabbccddeeff -nopad
openssl enc -aes-128-ecb -d -in 15_ecb.dat -out 15_ecb_dec.dat \
			-K 00112233445566778899aabbccddeeff -nopad
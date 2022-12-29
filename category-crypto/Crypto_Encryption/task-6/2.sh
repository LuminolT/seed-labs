###
 # @Author: LuminolT copper_sulfate@qq.com
 # @Date: 2022-12-29 07:09:41
 # @LastEditors: LuminolT copper_sulfate@qq.com
 # @LastEditTime: 2022-12-29 07:09:45
 # @FilePath: /Lab-2-Crpyto-Sym/task-6/2.sh
 # @Description: 
 # 
 # Copyright (c) 2022 by LuminolT copper_sulfate@qq.com, All Rights Reserved. 
### 

# same key, same IV

openssl enc -aes-128-cbc -e -in text.txt -out 2-1.dat \
            -K 00112233445566778899aabbccddeeff \
            -iv 0102030405060708

openssl enc -aes-128-cbc -e -in text.txt -out 2-2.dat \
            -K 00112233445566778899aabbccddeeff \
            -iv 0102030405060708
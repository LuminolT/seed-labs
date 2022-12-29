###2030405060708
###
 # @Author: LuminolT copper_sulfate@qq.com
 # @Date: 2022-12-29 07:06:00
 # @LastEditors: LuminolT copper_sulfate@qq.com
 # @LastEditTime: 2022-12-29 07:10:26
 # @FilePath: /Lab-2-Crpyto-Sym/task-6/1.sh
 # @Description: 
 # 
 # Copyright (c) 2022 by LuminolT copper_sulfate@qq.com, All Rights Reserved. 
### 
 # @Author: LuminolT copper_sulfate@qq.com
 # @Date: 2022-12-29 07:06:00
 # @LastEditors: LuminolT copper_sulfate@qq.com
 # @LastEditTime: 2022-12-29 07:08:13
 # @FilePath: /Lab-2-Crpyto-Sym/task-6/1.sh
 # @Description: 
 # 
 # Copyright (c) 2022 by LuminolT copper_sulfate@qq.com, All Rights Reserved. 
###

printf "A%.0s" $(seq 1 50) > text.txt

# same key, different IV

openssl enc -aes-128-cbc -e -in text.txt -out 1-1.dat \
            -K 00112233445566778899aabbccddeeff \
            -iv 0102030405060708

openssl enc -aes-128-cbc -e -in text.txt -out 1-2.dat \
            -K 00112233445566778899aabbccddeeff \
            -iv 1112131415161718


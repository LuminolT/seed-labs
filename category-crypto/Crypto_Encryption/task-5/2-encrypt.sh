###
 # @Author: LuminolT copper_sulfate@qq.com
 # @Date: 2022-12-27 07:53:11
 # @LastEditors: LuminolT copper_sulfate@qq.com
 # @LastEditTime: 2022-12-27 08:01:49
 # @FilePath: /Lab-2-Crpyto-Sym/task-5/2-encrypt.sh
 # @Description: 
 # 
 # Copyright (c) 2022 by LuminolT copper_sulfate@qq.com, All Rights Reserved. 
### 

openssl enc -aes-128-ecb -e -in text.txt -out text_ecb.dat \
            -K 00112233445566778899aabbccddeeff \
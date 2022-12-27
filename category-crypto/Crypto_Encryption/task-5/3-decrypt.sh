###
 # @Author: LuminolT copper_sulfate@qq.com
 # @Date: 2022-12-27 08:00:58
 # @LastEditors: LuminolT copper_sulfate@qq.com
 # @LastEditTime: 2022-12-27 08:01:02
 # @FilePath: /Lab-2-Crpyto-Sym/task-5/3-decrypt.sh
 # @Description: 
 # 
 # Copyright (c) 2022 by LuminolT copper_sulfate@qq.com, All Rights Reserved. 
### 

openssl enc -aes-128-ecb -d -in text_ecb.dat -out text_ecb_dec.dat \
            -K 00112233445566778899aabbccddeeff -nopad
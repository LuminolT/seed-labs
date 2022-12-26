###
 # @Author: LuminolT copper_sulfate@qq.com
 # @Date: 2022-12-27 07:16:27
 # @LastEditors: LuminolT copper_sulfate@qq.com
 # @LastEditTime: 2022-12-27 07:18:22
 # @FilePath: /Lab-2-Crpyto-Sym/task-3/run.sh
 # @Description: 
 # 
 # Copyright (c) 2022 by LuminolT copper_sulfate@qq.com, All Rights Reserved. 
### 
head -c 54 pic_original.bmp > pic_header
tail -c +55 pic_original.bmp > pic_body
openssl enc -aes-128-cbc -e -in pic_body -out pic_body_cbc \
			-K 00112233445566778899aabbccddeeff \
			-iv 0102030405060708
openssl enc -aes-128-ecb -e -in pic_body -out pic_body_ecb \
			-K 00112233445566778899aabbccddeeff \
			-iv 0102030405060708
cat pic_header pic_body_cbc > pic_cbc_merged.bmp
cat pic_header pic_body_ecb > pic_ecb_merged.bmp
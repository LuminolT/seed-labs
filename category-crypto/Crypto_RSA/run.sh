###
 # @Author: LuminolT luminol.chen@gmail.com
 # @Date: 2023-02-06 15:20:38
 # @LastEditors: LuminolT luminol.chen@gmail.com
 # @LastEditTime: 2023-02-06 15:33:15
 # @FilePath: /Lab-3-Crypto-RSA/run.sh
 # @Description: 
 # 
 # Copyright (c) 2023 by ${git_name_email}, All Rights Reserved. 
### 
echo "-----------------task1-----------------"
gcc -o ./task1 ./task1.c -lcrypto && ./task1

echo "-----------------task2-----------------"
gcc -o ./task2 ./task2.c -lcrypto && ./task2

echo "-----------------task3-----------------"
gcc -o ./task3 ./task3.c -lcrypto && ./task3
python3 ./task3.py

echo "-----------------task4-----------------"
python3 ./task4.py
gcc -o ./task4 ./task4.c -lcrypto && ./task4

echo "-----------------task5-----------------"
python3 ./task5.py
gcc -o ./task5 ./task5.c -lcrypto && ./task5

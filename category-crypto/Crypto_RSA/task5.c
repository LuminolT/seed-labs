/*
 * @Author: LuminolT luminol.chen@gmail.com
 * @Date: 2023-02-06 12:51:56
 * @LastEditors: LuminolT luminol.chen@gmail.com
 * @LastEditTime: 2023-02-06 14:33:03
 * @FilePath: /Lab-3-Crypto-RSA/task5.c
 * @Description:
 *
 * Copyright (c) 2023 by ${git_name_email}, All Rights Reserved.
 */

#include <openssl/bn.h>
#include <stdio.h>

#define NBITS 256

#define CB(x) case x:
#define CS(x)                                                                  \
  break;                                                                       \
  case x:
#define DF                                                                     \
  break;                                                                       \
  default:                                                                     \
    break;

void printBN(char *msg, BIGNUM *a) {
  /* Use BN_bn2hex(a) for hex string
   * Use BN_bn2dec(a) for decimal string */
  char *number_str = BN_bn2hex(a);
  printf("%s %s\n", msg, number_str);
  OPENSSL_free(number_str);
}

int main() {
  BN_CTX *ctx = BN_CTX_new();

  BIGNUM *n = BN_new();
  BIGNUM *e = BN_new();
  BIGNUM *d = BN_new();
  BIGNUM *msg_bn = BN_new();
  BIGNUM *msg_bn_prime = BN_new();
  BIGNUM *sig = BN_new();
  //   BIGNUM *msg_bn_prime = BN_new();

  // Initialize n, e, d, c
  BN_hex2bn(&n,
            "AE1CD4DC432798D933779FBD46C6E1247F0CF1233595113AA51B450F18116115");
  BN_hex2bn(&e, "010001");
  BN_hex2bn(
      &sig,
      "643D6F34902D9C7EC90CB0B2BCA36C47FA37165C0005CAB026C0542CBDB6802F  ");
  BN_hex2bn(&msg_bn, "4c61756e63682061206d697373696c652e");

  // m' = s^e mod n
  BN_mod_exp(msg_bn_prime, sig, e, n, ctx);
  printBN("m' = ", msg_bn_prime);

  // compare m and m'
  switch (BN_cmp(msg_bn, msg_bn_prime)) {
    CB(-1)
    printf("msg_bn not equal to msg_bn_prime\n");
    CS(0)
    printf("msg_bn equal to msg_bn_prime\n");
    DF
  }

  //   printf("%d\n", BN_cmp(msg_bn, msg_bn_prime));

  // print msg_bn, msg_bn_prime
  printBN("msg_bn       = ", msg_bn);
  printBN("msg_bn_prime = ", msg_bn_prime);

  return 0;
}
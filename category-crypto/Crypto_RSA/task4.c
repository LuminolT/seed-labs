/*
 * @Author: LuminolT luminol.chen@gmail.com
 * @Date: 2023-02-06 12:51:56
 * @LastEditors: LuminolT luminol.chen@gmail.com
 * @LastEditTime: 2023-02-06 14:28:41
 * @FilePath: /Lab-3-Crypto-RSA/task4.c
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
  BIGNUM *sig = BN_new();
  //   BIGNUM *msg_bn_prime = BN_new();

  // Initialize n, e, d, c
  BN_hex2bn(&n,
            "DCBFFE3E51F62E09CE7032E2677A78946A849DC4CDDE3A4D0CB81629242FB1A5");
  BN_hex2bn(&e, "010001");
  BN_hex2bn(&d,
            "74D806F9F3A62BAE331FFE3F0A68AFE35B3D2E4794148AACBC26AA381CD7D30D");
  BN_hex2bn(&msg_bn, "49206f776520796f752024323030302e");

  // s = m^d mod n
  BN_mod_exp(sig, msg_bn, d, n, ctx);
  printBN("s  = ", sig);

  // Change the message
  BN_hex2bn(&msg_bn, "49206f776520796f752024333030302e");

  // s = m^d mod n
  BN_mod_exp(sig, msg_bn, d, n, ctx);
  printBN("s  = ", sig);

  return 0;
}
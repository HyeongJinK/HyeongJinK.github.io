# 33 BigInteger를 기본 유형으로 변환


```java
BigInteger bi = BigInteger.valueOf(Long.MAX_VALUE);
long biLong = bi.longValue();   // 9223372036854775807
int biInt = bi.intValue();  // -1 너무 커서 기본유형에 맞지 않음

// jdk 8

long biExactLong = bi.longValueExact(); // 성공
int biExactInt = bi.intValueExact(); // throws ArithmeticException
```
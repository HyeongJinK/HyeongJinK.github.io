# 논리적 AND / OR / XOR을 두 개에 적용 부울 표현식


## jdk 8

```java
int s = 10;
int m = 21;
// if (s > m && m < 50) { } else { }
if (Boolean.logicalAnd(s > m, m < 50)) {} else {}
// if (s > m || m < 50) { } else { }
if (Boolean.logicalOr(s > m, m < 50)) {} else {}
// if (s > m ^ m < 50) { } else { }
if (Boolean.logicalXor(s > m, m < 50)) {} else {}


if (Boolean.logicalAnd(
 Boolean.logicalOr(s > m, m < 50),
 Boolean.logicalOr(s <= m, m > 50))) {} else {}
```
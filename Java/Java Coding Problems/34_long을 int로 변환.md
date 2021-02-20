---
sort: 34
---

# 34. long을 int로 변환


```java
long lm = Integer.MAX_VALUE;
int intNrCast = (int) lm;

int intNrValue = Long.valueOf(lm).intValue();

// jdk8
long nrMaxLong = Long.MAX_VALUE;
int intNrMaxExact = Math.toIntExact(nrMaxLong); // throws ArithmeticException
```
---
sort: 43
---

# 43. null 참조 확인 및 지정된 예외 발생

```java
if (name == null) { // ==
  throw new IllegalArgumentException("Name cannot be null");
}
```




```java
public static <T> T requireNonNullElseThrowIAE(T obj, String message) {
  if (obj == null) {
    throw new IllegalArgumentException(message);
  }

  return obj;
}

public static <T> T requireNonNullElseThrowIAE(T obj, Supplier<String> messageSupplier) {
  if (obj == null) {
    throw new IllegalArgumentException(messageSupplier == null 
      ? null : messageSupplier.get());
  }

  return obj;
}

public static <T, X extends Throwable> T requireNonNullElseThrow(T obj, X exception) throws X {
  if (obj == null) {
    throw exception;
  }

  return obj;
}

public static <T, X extends Throwable> T requireNotNullElseThrow(T obj, Supplier<<? extends X> exceptionSupplier) throws X {
  if (obj != null) {
    return obj;
  } else {
    throw exceptionSupplier.get();
  }
}
```

```java
public Car(String name, Color color) {
  this.name = MyObjects.requireNonNullElseThrow(name, new UnsupportedOperationException("Name cannot be set as null"));
  this.color = MyObjects.requireNotNullElseThrow(color, () -> new UnsupportedOperationException("Color cannot be set as null"));
}
```
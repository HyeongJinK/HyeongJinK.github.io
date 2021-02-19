---
sort: 79
---

# 간단한 var 예제

버전 10부터 Java는 var유형 이라고도하는 JEP 286 또는 Java LVTI와 함께 제공됩니다 .

```java
public Object fetchTransferableData(String data) throws UnsupportedFlavorException, IOException {
  StringSelection ss = new StringSelection(data);
  DataFlavor[] df = ss.getTransferDataFlavors();
  Object obj = ss.getTransferData(df[0]);

  return obj;
}

public Object fetchTransferableData(String data) throws UnsupportedFlavorException, IOException {
  var ss = new StringSelection(data);
  var df = ss.getTransferDataFlavors();
  var obj = ss.getTransferData(df[0]);

  return obj;
}
```
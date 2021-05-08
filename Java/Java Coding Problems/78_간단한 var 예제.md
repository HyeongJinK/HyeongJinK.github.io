---
sort: 78
---

# 78. 간단한 var 예제

Local Variable Type Inference(LVTI)

버전 10부터 Java는 var유형 이라고도 하는 JEP 286 또는 Java LVTI와 함께 제공됩니다 .

LVTI에는 여러 가지 이점이 있습니다. 예를 들어, 코드 상세도를 줄이고 중복성 및 상용구 코드를 완화 합니다. 또한 LVTI는 특히 다음과 같이 무거운 선언이 포함 된 경우 코드 작성에 소요되는 시간을 줄일 수 있습니다.

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

### 의미 있는 이름을 사용하기

```java
public Object fetchTransferableData(String data) throws UnsupportedFlavorException, IOException {
  var stringSelection = new StringSelection(data);
  var dataFlavorsArray = stringSelection.getTransferDataFlavors();
  var obj = stringSelection.getTransferData(dataFlavorsArray[0]);

  return obj;
}
```

### 리스트

```java
// Avoid
public List<Player> fetchPlayersByTournament(String tournament) {
  var t = tournamentRepository.findByName(tournament);
  var p = t.getPlayers();

  return p;
}

// Prefer
public List<Player> fetchPlayersByTournament(String tournament) {
  var tournamentName = tournamentRepository.findByName(tournament);
  var playerList = tournamentName.getPlayers();

  return playerList;
}
```
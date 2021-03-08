---
sort: 87
---

# 87. LVTI 및 가변 범위

깨끗한 코드 모범 사례에는 모든 지역 변수에 대해 작은 범위를 유지하는 것이 포함됩니다. 이것은 LVTI가 존재하기 전에 따랐던 깨끗한 코드 황금 규칙 중 하나입니다.

이 규칙은 가독성 및 디버깅 단계를 유지합니다. 버그를 찾고 수정 사항을 작성하는 프로세스의 속도를 높일 수 있습니다. 이 규칙을 세분화하는 다음 예를 고려하십시오.


```java
// Avoid
...
var stack = new Stack<String>();
stack.push("John");
stack.push("Martin");
stack.push("Anghel");
stack.push("Christian");

// 스택을 사용하지 않는 50 줄의 코드

// John, Martin, Anghel, Christian
stack.forEach(...);
```

```java
// Avoid
...
var stack = new ArrayDeque<String>();
stack.push("John");
stack.push("Martin");
stack.push("Anghel");
stack.push("Christian");

// 마지막에서 먼저 아웃 ( LIFO )

// Christian, Anghel, Martin, John
stack.forEach(...);
```

```java
// Prefer
...
var stack = new Stack<String>();
stack.push("John");
stack.push("Martin");
stack.push("Anghel");
stack.push("Christian");

// John, Martin, Anghel, Christian
stack.forEach(...);
```
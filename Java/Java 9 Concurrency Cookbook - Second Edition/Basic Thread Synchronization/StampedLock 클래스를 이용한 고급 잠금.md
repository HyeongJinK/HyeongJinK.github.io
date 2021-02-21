---
sort: 8
---

# StampedLock 클래스를 이용한 고급 잠금(Advanced locking with the StampedLock class)

`StampedLock` 클래스는 Lock 또는 `ReadWriteLock` 인터페이스에서 제공하는 것과 다른 특별한 종류의 잠금을 제공합니다. 사실 이 클래스는 이러한 인터페이스를 구현하지 않지만 제공하는 기능은 매우 유사합니다.

이러한 종류의 잠금에 대해 가장 먼저 알아 두어야 할 점은 주요 목적은 스레드 안전한 구성요소를 구현하는 도우미 클래스라는 것이므로 일반적인 응용 프로그램에서는 그 용도가 일반적이지 않습니다.

`StampedLock`잠금의 가장 중요한 기능은 다음과 같습니다.

- 세 가지 모드로 잠금을 제어 할 수 있습니다.
    - **쓰기(Write)**: 이 모드에서는 잠금에 독점적으로 액세스 할 수 있습니다. 이 모드에서는 다른 스레드가 잠금을 제어 할 수 없습니다.
    - **읽기(Read)**: 이 모드에서는 잠금에 대한 배타적이지 않은 액세스 권한이 있습니다. 이 모드 또는 낙관적 읽기 모드에서 잠금에 액세스 할 수 있는 다른 스레드가 있을 수 있습니다.
    - **낙관적 읽기(Optimistic Read)**: 여기서 스레드는 블록을 제어 할 수 없습니다. 다른 스레드는 쓰기 모드에서 잠금을 제어 할 수 있습니다. 낙관적 읽기 모드에서 잠금이 설정되어 있고 보호된 공유 데이터에 액세스하려는 경우 `validate()`메소드를 사용하여 액세스 할 수 있는 지 여부를 확인해야 합니다.
- 이 `StampedLock`클래스는 다음과 같은 메소드를 제공합니다.
    - 이전 모드 중 하나에서 잠금을 제어하십시오. 메서드(`readLock(), writeLock(), readLockInterruptibly()`)가 잠금의 제어를 얻을 수 없는  경우 이 잠금을 얻을 때 까지 현재 스레드가 일시 중단됩니다.
    - 이전 모드 중 하나에서 잠금을 제어하십시오. 메서드 ( `tryOptimisticRead(), tryReadLock(), tryWriteLock()`)가 잠금의 제어를 얻을 수 없을 때 그들은 이 상황을 나타내는 특정한 값을 반환한다.
    - 가능하면 한 모드를 다른 모드로 변환하십시오. 그렇지 않으면, 메서드(`asReadLock(), asWriteLock(), asReadWriteLock()`)는 특별한 값을 반환합니다.
    - 잠금을 해제하십시오.
- 이러한 모든 메소드는 잠금 작업에 사용해야 하는 스탬프라는 긴 값을 반환합니다. 메소드가 0을 리턴하면 잠금을 시도했지만 실패했습니다.
- `StampedLock` 잠금은 `Lock` 및 `ReadWriteLock` 인터페이스와 같은 재진입 잠금이 아닙니다. 잠금을 다시 얻으려는 메서드를 호출하면 차단 될 수 있으며 교착 상태가 됩니다.
- 소유권 개념이 없습니다. 그것들은 하나의 스레드에 의해 획득되고 다른 스레드에 의해 해제 될 수 있습니다.
- 마지막으로 잠금을 제어할 다음 스레드에 대한 정책이 없습니다.

이 레시피에서는 `StampedLock` 클래스의 다양한 모드를 사용하여 공유 데이터 개체에 대한 액세스를 보호하는 방법을 배웁니다. `StampedLock` (쓰기, 읽기 및 낙관적 읽기)으로 세 가지 액세스 모드를 테스트하기 위해 세 가지 동시 작업간에 공유 객체를 사용합니다.

# **준비하기**

이 레시피의 예는 Eclipse IDE를 사용하여 구현되었습니다. Eclipse 또는 NetBeans와 같은 다른 IDE를 사용하는 경우 Eclipse를 열고 새 Java 프로젝트를 작성하십시오.

# **그것을 하는 방법 ...**

예제를 구현하려면 다음 단계를 수행하십시오.

먼저 공유 데이터 개체를 구현합니다. 두 개의 정수 속성, 즉 `x`와 `y`가 있는 `Position`이라는 클래스를 만듭니다. 속성 값을 가져오고 설정하려면 메서드를 포함해야합니다. 코드는 매우 간단하므로 여기에 포함되지 않습니다.

이제 `Writer` 작업을 구현해 보겠습니다. `Runnable` 인터페이스를 구현하고 두 가지 속성, 즉 `position`이라는 `Position` 객체와 `lock`이라는 `StampedLock`을 갖게됩니다. 생성자에서 초기화됩니다.

```java
public class Writer implements Runnable { 
	private final Position position; 
	private final StampedLock lock; 
	public Writer (Position position, StampedLock lock) { 
	  this.position=position; 
	  this.lock=lock; 
	}
```

`run()` 메서드를 구현합니다. 우리가 10 번 반복 할 루프에서 쓰기 모드에서 잠금을 얻고, 위치 객체의 두 속성 값을 변경하고, 스레드 실행을 잠시 중단하고, 잠금을 해제합니다 (`try`의 `finally`섹션에서 `...catch` `...finally` 구조를 사용하여 어떤 상황에서도 잠금을 해제하고 스레드를 잠시 중단합니다.

```java
@Override 
public void run() { 
  for (int i=0; i<10; i++) { 
    long stamp = lock.writeLock(); 
    try { 
      System.out.printf("Writer: Lock acquired %d\n",stamp); 
      position.setX(position.getX()+1); 
      position.setY(position.getY()+1); 
      TimeUnit.SECONDS.sleep(1); 
    } catch (InterruptedException e) { 
      e.printStackTrace(); 
    } finally { 
      lock.unlockWrite(stamp); 
      System.out.printf("Writer: Lock released %d\n",stamp); 
    } 
    try { 
      TimeUnit.SECONDS.sleep(1); 
    } catch (InterruptedException e) { 
      e.printStackTrace(); 
    } 
  } 
}
```

그런 다음 `Reader` 태스크를 구현하여 공유 객체의 값을 읽습니다. `Runnable` 인터페이스를 구현하는 `Reader`라는 클래스를 만듭니다. 두 가지 속성, 즉 `position`이라는 `Position` 개체와 `lock`이라는 `StampedLock` 개체가 있습니다. 클래스 생성자에서 초기화됩니다.

```java
public class Reader implements Runnable { 
  private final Position position; 
  private final StampedLock lock; 
  public Reader (Position position, StampedLock lock) { 
    this.position=position; 
    this.lock=lock; 
  }
```

이제 `run()` 메서드를 구현합니다. `50`번 반복하는 루프에서 읽기 모드에서 잠금을 제어하고 콘솔에 위치 개체의 값을 쓰고 스레드를 200 밀리 초 동안 일시 중단합니다. 마지막으로 `try...catch...finally` 구조의 `finally` 블록을 사용하여 잠금을 해제합니다.

```java
@Override 
public void run() { 
  for (int i = 0; i < 50; i++) { 
    long stamp=lock.readLock(); 
    try { 
      System.out.printf("Reader: %d - (%d,%d)\n", stamp, position.getX(), position.getY()); 
      TimeUnit.MILLISECONDS.sleep(200); 
    } catch (InterruptedException e) { 
      e.printStackTrace(); 
    } finally { 
      lock.unlockRead(stamp); 
      System.out.printf("Reader: %d - Lock released\n", stamp); 
    } 
  } 
}
```

그런 다음 `OptimisticReader` 태스크를 구현하십시오. `OptimisticReader` 클래스는 `Runnable` 인터페이스를 구현합니다. 두 가지 속성, 즉 `position`이라는 `Position` 개체와 `lock`이라는 `StampledLock` 개체가 있습니다. 클래스 생성자에서 초기화됩니다.

```java
public class OptimisticReader implements Runnable { 
  private final Position position; 
  private final StampedLock lock; 
  public OptimisticReader (Position position, StampedLock lock) { 
    this.position=position; 
    this.lock=lock; 
  }
```

이제 `run()` 메서드를 구현합니다. 먼저 `tryOptimisticRead()` 메서드를 사용하여 낙관적 읽기 모드에서 잠금 스탬프를 가져옵니다. 그런 다음 루프를 `100`번 반복합니다. 루프에서 `validate()` 메서드를 사용하여 데이터에 액세스 할 수 있는지 확인합니다. 이 메서드가 true를 반환하면 콘솔에 위치 개체의 값을 작성합니다. 그렇지 않으면 콘솔에 메시지를 쓰고 `tryOptimisticRead()` 메서드를 다시 사용하여 다른 스탬프를 가져옵니다. 그런 다음 스레드를 `200`밀리 초 동안 일시 중단합니다.

```java
@Override 
public void run() { 
  long stamp; 
  for (int i=0; i<100; i++) { 
    try { 
      stamp=lock.tryOptimisticRead(); 
      int x = position.getX(); 
      int y = position.getY(); 
      if (lock.validate(stamp)) { 
        System.out.printf("OptmisticReader: %d - (%d,%d)\n",
                          stamp,x, y); 
      } else { 
        System.out.printf("OptmisticReader: %d - Not Free\n",
                          stamp); 
      } 
      TimeUnit.MILLISECONDS.sleep(200); 
    } catch (InterruptedException e) { 
      e.printStackTrace(); 
    } 
  } 
}
```
마지막으로 `main()` 메서드로 `Main` 클래스를 구현합니다. `Position` 및 `StampedLock` 개체를 만들고 각 작업에 대해 하나씩 3개의 스레드를 만들고 스레드를 시작하고 완료 될 때까지 기다립니다.

```java
public class Main { 
  public static void main(String[] args) { 
    Position position=new Position(); 
    StampedLock lock=new StampedLock(); 
    Thread threadWriter=new Thread(new Writer(position,lock)); 
    Thread threadReader=new Thread(new Reader(position, lock)); 
    Thread threadOptReader=new Thread(new OptimisticReader
                                        (position, lock)); 
    threadWriter.start(); 
    threadReader.start(); 
    threadOptReader.start(); 
    try { 
      threadWriter.join(); 
      threadReader.join(); 
      threadOptReader.join(); 
    } catch (InterruptedException e) { 
      e.printStackTrace(); 
    } 
  } 
}
```

# **작동 원리 ...**

이 예에서는 스탬프 잠금과 함께 사용할 수 있는 세 가지 모드를 테스트했습니다. `Writer`태스크에서 `writeLock()` 메서드(쓰기 모드에서 잠금을 획득)로 잠금을 얻습니다. `Reader`테스크에서 `readLock()` 메서드를 사용하여 잠금을 얻습니다(읽기 모드에서 잠금을 획득 함). 마지막으로 `OptimisticRead` 작업에서 먼저 `tryOptimisticRead()`를 사용한 다음 `validate()` 메서드를 사용하여 데이터에 액세스 할 수 있는지 여부를 확인합니다.

처음 두 방법은 잠금을 제어 할 수 있는 경우 잠금을 얻을 때까지 기다립니다. `tryOptimisticRead()` 메서드는 항상 값을 반환합니다. 잠금을 사용할 수 없는 경우 0이고 사용할 수 있는 경우 0과 다른 값이 됩니다. 이 경우 데이터에 실제로 액세스 할 수 있는지 확인하기 위해 항상 `validate()` 메서드를 사용해야 합니다.

다음 스크린 샷은 프로그램 실행 출력의 일부를 보여줍니다.

![](asserts/Untitled.png)

`Writer` 태스크가 잠금을 제어하는 ​​동안 `Reader`와 `OptimisticReader`는 값에 액세스 할 수 없습니다. `Reader` 테스크는 `readLock()` 메서드에서 일시 중단되고 `OptimisticReader`에서는 `validate()` 메서드에 대한 호출이 `false`를 반환하고 `tryOptimisticRead()` 메서드에 대한 호출이 `0`을 반환하여 잠금이 다른 스레드에 의해 쓰기 모드로 제어됨을 나타냅니다. `Writertask`가 잠금을 해제하면 `Reader` 및 `OptimisticReader` 작업 모두 공유 개체의 값에 액세스 할 수 있습니다.

# **더있다...**

이 `StampedLock`클래스에는 알아야 할 다른 메소드가 있습니다.

- `tryReadLock()` and `tryReadLock(long time, TimeUnit unit)` :이 메소드는 읽기 모드에서 잠금을 획득하려고 시도합니다. 그렇지 않은 경우 첫 번째 버전이 즉시 반환되고 두 번째 버전은 매개 변수에 지정된 시간 동안 기다립니다. 이 메소드는 또한 확인해야 할 스탬프를 반환합니다.(`stamp != 0`)
- `tryWriteLock()` and `tryWriteLock(long time, TimeUnit unit)` :이 메소드는 쓰기 모드에서 잠금을 획득하려고 시도합니다. 그렇지 않은 경우 첫 번째 버전이 즉시 반환되고 두 번째 버전은 매개 변수에 지정된 시간 동안 기다립니다. 이 메소드는 또한 확인해야 할 스탬프를 반환합니다.(`stamp != 0`)
- `isReadLocked()` 및 `isWriteLocked()` : 잠금이 현재 읽기 또는 쓰기 모드로 유지되는 경우 이러한 메소드가 리턴됩니다.
- `tryConvertToReadLock(long stamp)`, `tryConvertToWriteLock(long stamp)`, `tryConvertToOptimisticRead(long stamp)` :이 메소드는 매개 변수로 전달된 스탬프를 메소드 이름에 표시된 모드로 변환하려고합니다. 가능하면 새 스탬프을 반환합니다. 그렇지 않으면 `0`을 반환합니다.
- `unlock(long stamp)`: 해당 잠금 모드가 해제됩니다.

# **또한보십시오**

- ***잠금으로 코드 블록을 동기화***

    본 장의 레시피
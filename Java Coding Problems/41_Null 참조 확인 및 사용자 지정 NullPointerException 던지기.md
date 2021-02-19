Checking null references and throwing NullPointerException with customized messages can be accomplished using the following code (this code does these four times, twice in the constructor and twice in the assignDriver() method):

```java
public class Car {

  private final String name;
  private final Color color;

  public Car(String name, Color color) {

    if (name == null) {
      throw new NullPointerException("Car name cannot be null");
    }

    if (color == null) {
      throw new NullPointerException("Car color cannot be null");
    }

    this.name = name;
    this.color = color;
  }

  public void assignDriver(String license, Point location) {

    if (license == null) {
      throw new NullPointerException("License cannot be null");
    }

    if (location == null) {
      throw new NullPointerException("Location cannot be null");
    }
  }
}
```

So, this code solves the problem by combining the == operator and manual instantiation of the NullPointerException class. Starting with JDK 7, this combination of code was hidden in a static method named Objects.requireNonNull(). Via this method, the preceding code can be rewritten in an expressive manner:

```java
public class Car {

  private final String name;
  private final Color color;

  public Car(String name, Color color) {

    this.name = Objects.requireNonNull(name, "Car name cannot be 
      null");
    this.color = Objects.requireNonNull(color, "Car color cannot be 
      null");
  }

  public void assignDriver(String license, Point location) {

    Objects.requireNonNull(license, "License cannot be null");
    Objects.requireNonNull(location, "Location cannot be null");
  }
}
```

So, if the specified reference is null, then Objects.requireNonNull() will throw a NullPointerException with the message provided. Otherwise, it returns the checked reference.

In constructors, there is a typical approach to throw NullPointerException when the references provided are null. But in methods (for example, assignDriver()), this is a controversial approach. Some developers will prefer to return an inoffensive result or to throw IllegalArgumentException. The next problem, checking null references and throwing the specified exception (for example, IllegalArgumentException), addresses the IllegalArgumentException approach.

In JDK 7, there are the two Objects.requireNonNull() methods, the one used previously, and another one that throws NullPointerException with a default message, as in the following example:

Copy

```java
this.name = Objects.requireNonNull(name);
```

Starting with JDK 8, there is one more Objects.requireNonNull(). This one wraps the custom message of NullPointerException in Supplier. This means that the message creation is postponed until the given reference is null (this means that using the + operator for concatenating parts of the message is no longer an issue).

Here is an example:

Copy

```java
this.name = Objects.requireNonNull(name, () 
  -> "Car name cannot be null ... Consider one from " + carsList);
```

If this reference is not null, then the message is not created.
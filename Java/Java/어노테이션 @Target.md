---
sort: 1
---

사용자가 생성한 어노테이션을 사용할 수 있는 곳을 지정한다.

```java
@Documented
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.ANNOTATION_TYPE)
public @interface Target {
    ElementType[] value();
}
```

ElementType 배열의 값을 받는 다.

```java
public enum ElementType {
    /** Class, interface (including annotation type), or enum declaration */
    TYPE,

    /** Field declaration (includes enum constants) */
    FIELD,

    /** Method declaration */
    METHOD,

    /** Formal parameter declaration */
    PARAMETER,

    /** Constructor declaration */
    CONSTRUCTOR,

    /** Local variable declaration */
    LOCAL_VARIABLE,

    /** Annotation type declaration */
    ANNOTATION_TYPE,

    /** Package declaration */
    PACKAGE,

    /**
     * Type parameter declaration
     *
     * @since 1.8
     */
    TYPE_PARAMETER,

    /**
     * Use of a type
     *
     * @since 1.8
     */
    TYPE_USE
}
```
* ElementType.TYPE // 클래스, 인터페이스, 이넘
* ElementType.FIELD // 멤버 변수 
* ElementType.METHOD // 메소드 
* ElementType.PARAMETER // 매개 변수 
* ElementType.CONSTRUCTOR // 생성자 
* ElementType.LOCAL_VARIABLE // 지역 변수
* ElementType.ANNOTATION_TYPE // 어노테이션
* ElementType.PACKAGE // 패키지
* ElementType.TYPE_PARAMETER // 타입 매개 변수  
* ElementType.TYPE_USE // 타입 사용시

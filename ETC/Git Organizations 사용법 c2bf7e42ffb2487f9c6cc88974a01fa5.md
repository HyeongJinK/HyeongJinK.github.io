---
sort: 2
---

# Git Organizations 사용법

상태: 완성
생성일: 2021년 2월 9일 오전 10:01
중요도: 낮음
태그: Git

# 1. People

## 1.1 사용자 권한 설정

![Git%20Organizations%20%E1%84%89%E1%85%A1%E1%84%8B%E1%85%AD%E1%86%BC%E1%84%87%E1%85%A5%E1%86%B8%20c2bf7e42ffb2487f9c6cc88974a01fa5/_2021-02-09__10.03.09.png](Git%20Organizations%20%E1%84%89%E1%85%A1%E1%84%8B%E1%85%AD%E1%86%BC%E1%84%87%E1%85%A5%E1%86%B8%20c2bf7e42ffb2487f9c6cc88974a01fa5/_2021-02-09__10.03.09.png)

1. People 탭 선택
2. 권한을 변경하고 싶은 사용자의 ⚙️  를 클릭 후에 'Change role...' 메뉴를 클릭한 후 Owner, Member 두개의 권한 중에 하나를 선택한다.
    1. Owner: 유저의 초대, 탈퇴를 포함한 모든 권한을 가진다.(📌  Thomas 계정에 해당 권한을 부여하여 유저의 초대와 탈퇴를 할 수 있게 하는 걸 추천합니다.)
    2. Member: 일반적인 유저권한

![Git%20Organizations%20%E1%84%89%E1%85%A1%E1%84%8B%E1%85%AD%E1%86%BC%E1%84%87%E1%85%A5%E1%86%B8%20c2bf7e42ffb2487f9c6cc88974a01fa5/_2021-02-09__10.05.14.png](Git%20Organizations%20%E1%84%89%E1%85%A1%E1%84%8B%E1%85%AD%E1%86%BC%E1%84%87%E1%85%A5%E1%86%B8%20c2bf7e42ffb2487f9c6cc88974a01fa5/_2021-02-09__10.05.14.png)

# 2. Teams

## 2.1 팀생성

### 2.1.1 하위 팀생성

- Maintainer 이 권한을 가지고 있으면 하위팀을 생성할 수 있습니다.
- 현재는 팀하나로 상관없지만 나중에 프로젝트가 많아지고 팀이 커지면 권한을 나누기 위해 쓰임니다.

## 2.2 Members

### 2.2.1 권한부여

![Git%20Organizations%20%E1%84%89%E1%85%A1%E1%84%8B%E1%85%AD%E1%86%BC%E1%84%87%E1%85%A5%E1%86%B8%20c2bf7e42ffb2487f9c6cc88974a01fa5/_2021-02-09__1.21.08.png](Git%20Organizations%20%E1%84%89%E1%85%A1%E1%84%8B%E1%85%AD%E1%86%BC%E1%84%87%E1%85%A5%E1%86%B8%20c2bf7e42ffb2487f9c6cc88974a01fa5/_2021-02-09__1.21.08.png)

![Git%20Organizations%20%E1%84%89%E1%85%A1%E1%84%8B%E1%85%AD%E1%86%BC%E1%84%87%E1%85%A5%E1%86%B8%20c2bf7e42ffb2487f9c6cc88974a01fa5/_2021-02-09__1.23.33.png](Git%20Organizations%20%E1%84%89%E1%85%A1%E1%84%8B%E1%85%AD%E1%86%BC%E1%84%87%E1%85%A5%E1%86%B8%20c2bf7e42ffb2487f9c6cc88974a01fa5/_2021-02-09__1.23.33.png)

- Maintainer: 하위 팀 생성, 맴버초대 및 삭제, 저장소 추가 및 삭제 가능
    - 각각의 회사의 방침에 따라 다르지만
        - 팀장만 권한을 가지는 경우
        - 프로젝트를 생성 및 설정할 수 있는 사람
        - 아예 모든 멤버에게 이 권한을 주기도 합니다.
    - 📌  지금 현재 백엔드 팀은 이 권한을 가진 게 데브계정만 이 권한을 가진 거 같은 데 이 권한을 줘야 하는 사람에 대한 방침을 주고 권한을 줘야 합니다.
- Member: 그냥 멤버

## 2.3 Repositories

![Git%20Organizations%20%E1%84%89%E1%85%A1%E1%84%8B%E1%85%AD%E1%86%BC%E1%84%87%E1%85%A5%E1%86%B8%20c2bf7e42ffb2487f9c6cc88974a01fa5/_2021-02-09__1.30.59.png](Git%20Organizations%20%E1%84%89%E1%85%A1%E1%84%8B%E1%85%AD%E1%86%BC%E1%84%87%E1%85%A5%E1%86%B8%20c2bf7e42ffb2487f9c6cc88974a01fa5/_2021-02-09__1.30.59.png)

### 2.3.1 저장소 추가

- Maintainer 권한을 가진 사람이 저장소를 추가할 수 있습니다.
- Add repository 버튼으로 회사에 있는 저장소를 추가해 올 수 있습니다. (본인이 만들거나 권한이 있는 저장소일 경우)
- 추가된 저장소의 권한을 설정을 해서 해당 팀에 속한 사람들의 저장소 접근 권한을 설정할 수 있습니다.
- 저장소 접근 권한 상세 내용: [https://docs.github.com/en/github/setting-up-and-managing-organizations-and-teams/repository-permission-levels-for-an-organization](https://docs.github.com/en/github/setting-up-and-managing-organizations-and-teams/repository-permission-levels-for-an-organization)
- 📌  현재 백엔드 팀에 Maintainer 권한을 가진 사람이 없어서 저장소를 추가하고 권한을 편집할 수 없습니다. 이거 관련된 권한을 누구에게 줄건지 확인하시고 주셔야 할 거 같습니다.

# 3. 추천

1. 조직에 권한에서 Owner 권한을 Thomas에게 부여한다.
2. 각각의 팀에 속한 사람들에게 Maintainer 권한을 부여한다.(나중에 팀이 커지고 프로젝트가 많아지면 그때 다시 정리한다.)

# 4. 그 외 건의사항

# 4. 1 Packages

라이브러리 저장소 관리툴, 코드에서 사용되는 공통된 라이브러리를 올리는 저장소 

보통 많이 사용되는 툴은 넥서스, 아티팩토리가 사용됩니다. 해당 툴들은 설치를 해서 사용되고 있습니다.

지금 현재 github에는 무료로 500MB를 제공하고 있습니다.

![Git%20Organizations%20%E1%84%89%E1%85%A1%E1%84%8B%E1%85%AD%E1%86%BC%E1%84%87%E1%85%A5%E1%86%B8%20c2bf7e42ffb2487f9c6cc88974a01fa5/_2021-02-09__2.01.36.png](Git%20Organizations%20%E1%84%89%E1%85%A1%E1%84%8B%E1%85%AD%E1%86%BC%E1%84%87%E1%85%A5%E1%86%B8%20c2bf7e42ffb2487f9c6cc88974a01fa5/_2021-02-09__2.01.36.png)

위에 그림에서 왼쪽이 일반적으로 사용되는 방식이고 오른쪽이 깃헙에서 제공하는 라이브러리 저장소(Packages)를 사용했을 때 입니다. 오른쪽 그림에서 Github대신 넥서스나 아티팩토리가 올 수 있습니다.

MVN REPOSITORY에 바로 올릴 경우 그냥 공개가 되기 때문에 보통 회사 라이브러리를 올리지 않습니다.

npm이나 Docker 저장소에 경우에는 구독(유료)를 사용해서 Private저장소를 사용할 수 있는 데 maven의 경우에는 없는 거 같은 데 정확히는 모르겠습니다.

## 4.1.1 사용하는 이유

1. 공통적으로 사용하는 라이브러리 공유로 인한 생산성
2. 전체 프로젝트 생산성 대비 여러개의 리파지토리 사용에 따른 효율성

나중에 프로젝트가 커지거나 회사 인프라에 컨테이너를 적용하게 되면 500MB 용량이 부족하게 되겠지만 현재로써는 제일 간단하고 무료로 사용할 수 있다는 장점이 있습니다.

## 4.1.2 설정방법

### 4.1.2.1 Mac 컴퓨터에 경우

- 사용자 - {사용자이름} -.m2 폴더 안에 settings.xml 파일을 생성합니다.(숨김폴더입니다.)

### 4.1.2.2 Window 컴퓨너의 경우

- {사용자 계정}/.m2   경로 안에 settings.xml 파일을 생성합니다. (숨김폴더입니다.)

```xml
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0
                      http://maven.apache.org/xsd/settings-1.0.0.xsd">

  <activeProfiles>
    <activeProfile>github</activeProfile>
  </activeProfiles>

  <profiles>
    <profile>
      <id>github</id>
      <repositories>
        <repository>
          <id>central</id>
          <url>https://repo1.maven.org/maven2</url>
          <releases><enabled>true</enabled></releases>
          <snapshots><enabled>true</enabled></snapshots>
        </repository>
        <repository>
          <id>github</id>
          <name>GitHub OWNER Apache Maven Packages</name>
          <url>https://maven.pkg.github.com/OWNER/REPOSITORY</url>
        </repository>
      </repositories>
    </profile>
  </profiles>

  <servers>
    <server>
      <id>github</id>
      <username>{본인 github계정 이름    (예:HyeongJinK)}</username>
      <password>{본인 계정 토큰, 토큰 생성관련 링크는 아래에}</password>
    </server>
  </servers>
</settings>
```

### 4.1.2.2 라이브러리 프로젝트 Pom.xml 설정

```xml
<distributionManagement>
    <repository>
      <id>github</id>
      <name>GitHub OWNER Apache Maven Packages</name>
      <url>https://maven.pkg.github.com/{본인계정이름 혹은 조직이름}/{저장소 이름}
      </url>
    </repository>
</distributionManagement>

<!-- 예시 -->
<distributionManagement>
    <repository>
      <id>github</id>
      <name>GitHub OWNER Apache Maven Packages</name>
      <url>https://maven.pkg.github.com/githuborganizationStudy/test
      </url>
    </repository>
</distributionManagement>
```

위에 코드를 추가한 후

```xml
mvn deploy
```

위 명령어로 라이브러리를 올린다.

그러면

![Git%20Organizations%20%E1%84%89%E1%85%A1%E1%84%8B%E1%85%AD%E1%86%BC%E1%84%87%E1%85%A5%E1%86%B8%20c2bf7e42ffb2487f9c6cc88974a01fa5/_2021-02-09__2.16.45.png](Git%20Organizations%20%E1%84%89%E1%85%A1%E1%84%8B%E1%85%AD%E1%86%BC%E1%84%87%E1%85%A5%E1%86%B8%20c2bf7e42ffb2487f9c6cc88974a01fa5/_2021-02-09__2.16.45.png)

![Git%20Organizations%20%E1%84%89%E1%85%A1%E1%84%8B%E1%85%AD%E1%86%BC%E1%84%87%E1%85%A5%E1%86%B8%20c2bf7e42ffb2487f9c6cc88974a01fa5/_2021-02-09__2.17.03.png](Git%20Organizations%20%E1%84%89%E1%85%A1%E1%84%8B%E1%85%AD%E1%86%BC%E1%84%87%E1%85%A5%E1%86%B8%20c2bf7e42ffb2487f9c6cc88974a01fa5/_2021-02-09__2.17.03.png)

이렇게 라이브러리를 사용할 수 있다.

### 4.1.2.2 📌  빌드를 하는 CI 서버가 있으면 해당 서버에 메이븐 settings.xml  설정을 수정해야 됩니다.

처리방법:

[https://docs.aws.amazon.com/ko_kr/codebuild/latest/userguide/troubleshooting.html](https://docs.aws.amazon.com/ko_kr/codebuild/latest/userguide/troubleshooting.html)

## Apache Maven 빌드가 잘못된 리포지토리의 아티팩트를 참조함

**문제:** 제공 Java 빌드 환경에서 Maven을 사용하면 Maven이 AWS CodeBuildhttps://repo1.maven.org/maven2[의 보안 중앙 Maven 리포지토리에서 빌드 및 플러그인 종속성을 가져옵니다.](https://repo1.maven.org/maven2) 빌드 프로젝트의 `pom.xml` 파일에 대신 사용할 다른 위치가 명시적으로 선언되어 있는 경우에도 이러한 문제가 발생합니다.

**가능한 원인:** CodeBuild 제공 Java 빌드 환경에 빌드 환경의 `/root/.m2` 디렉터리에 사전 설치되어 있는 `settings.xml`이라는 파일이 포함되어 있습니다. 이 `settings.xml` 파일에는 다음 선언이 포함되어 있는데, 이는 Maven이 항상 [https://repo1.maven.org/maven2](https://repo1.maven.org/maven2)에 있는 보안된 중앙 Maven 리포지토리로부터 빌드 및 플러그인 종속성을 가져오도록 지시합니다.

```xml

<settings>
  <activeProfiles>
    <activeProfile>securecentral</activeProfile>
  </activeProfiles>
  <profiles>
    <profile>
      <id>securecentral</id>
      <repositories>
        <repository>
          <id>central</id>
          <url>https://repo1.maven.org/maven2</url>
          <releases>
            <enabled>true</enabled>
          </releases>
        </repository>
      </repositories>
      <pluginRepositories>
        <pluginRepository>
          <id>central</id>
          <url>https://repo1.maven.org/maven2</url>
          <releases>
            <enabled>true</enabled>
          </releases>
        </pluginRepository>
      </pluginRepositories>
    </profile>
  </profiles>
</settings>
```

**권장 솔루션:** 해결 방법:

1. 소스 코드에 `settings.xml` 파일을 추가합니다.
2. 이 `settings.xml` 파일에서, 이전 `settings.xml` 형식을 참고하여 Maven이 빌드 및 플러그인 종속성을 가져오게 하려는 다른 리포지토리를 선언합니다.
3. 빌드 프로젝트의 `install` 단계에서 CodeBuild가 사용자가 만든 `settings.xml` 파일을 빌드 환경의 `/root/.m2` 디렉터리에 복사하도록 명령을 설정합니다. 예를 들어 이러한 작업을 수행하는 `buildspec.yml` 파일의 다음 코드 조각을 고려해 보십시오.

```yaml
version 0.2

phases:
  install:
    commands:
      - cp ./settings.xml /root/.m2/settings.xml
```

## 4.1.3 토큰 생성 방법

- [https://jootc.com/p/201905122828](https://jootc.com/p/201905122828)
# Petmily iOS app
소프트웨어 마에스트로 프로젝트이며 반려동물을 파양할려는 사람과 반려동물을 입양하고자하는 사람을 연결해주는 중계 플랫폼입니다.

이를 통해 파양된 반려동물들이 동물보호센터로 가거나 유기견이 되는 사회적 문제를 해결하고자합니다.

# 주요 기능

|** 홈 - 상세게시글 & 좋아요**|** 회원가입 **|** 프로필 수정 **|
|-|-|-|
|<img src="https://github.com/SWM-Petmily/SWM-iOS/assets/65723901/b40738a9-2e58-4943-9802-8a9c49790874" width="250"/>|<img src="https://github.com/SWM-Petmily/SWM-iOS/assets/65723901/87852b7c-91e1-4de2-9203-68d938b8ae9b" width="250"/>|<img src="https://github.com/SWM-Petmily/SWM-iOS/assets/65723901/9a32240a-5748-4f29-b7cd-1225dabdfdf1" width="250"/>|

# 아키텍쳐 
![모듈구조](https://github.com/SWM-Petmily/SWM-iOS/assets/65723901/1dcf6782-abc5-4649-bd90-d621ab6d2a69)

### 클린 아키텍쳐(Clean Architecture)

- 같은 목적의 코드들을 같은 Layer에 모아놓음으로써, 관심사를 분리하였습니다.
- 각각 Layer마다 책임이 다르기에 코드의 가독성과 개발 효율을 높일 수 있습니다.
- 비즈니스 로직을 담당하는 도메인 계층의 분리로 소스코드의 변경 안정성을 높였습니다.
- 의존성 역전(DIP)를 통해 응집도를 높히고 결합도를 낮추었습니다.

### 코디네이터 패턴(Coordinator Pattern)

- App 모듈에 모든 화면을 관리하는 Coordinator객체를 생성하였습니다.
- Feature들 사이의 화면 전환 시 의존성없이 화면 전환이 가능하도록 구현하였습니다.
  


# 폴더구조 

### App 모듈

- DI 주입, Coordinator 패턴 적용

### Data

- 서버와의 통신을 담당
- DTO, Repository 구현체, DTO를 VO로 변환

### Domain

- 비지니스 로직 담당
- VO, Repository Protocol, Usecase

### Presentation

- 화면에 보여주는 Feature
- View, ViewModel

### Common

- 여러 feature에서 사용할 수 있는 공통 로직

# 사용 기술
- **아키텍쳐** : Clean Architercutre
- **UI** : SwiftUI
- **네트워크 통신** : Moya, CombineMoya
- **의존성 주입** : Swinject
- **비동기 처리** : Combine
- **이미지 처리** : NSCache

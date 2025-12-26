# fullstack-flutter-dev_github

한국어 요약
----------------
이 저장소는 풀스택 및 Flutter 개발 관련 자료, 예제, 학습 노트, 샘플 프로젝트들을 모아둔 개인/팀 학습 자료 모음입니다. 주요 디렉터리는 주제별로 정리되어 있으며, 각 폴더는 관련 문서, 예제 코드, 스크립트 또는 프로젝트 템플릿을 포함합니다. 이 문서는 루트 폴더의 구조와 각 폴더의 목적을 한글과 영어로 상세히 설명합니다.

English Summary
----------------
This repository is a curated collection of full-stack and Flutter development resources, examples, study notes, and sample projects. Top-level directories are organized by topic; each contains documentation, example code, scripts, or project templates. This README documents the repository layout and describes each top-level folder in both Korean and English.

Repository Structure / 저장소 구조 (요약)
-----------------------------------

- `_Workspace-Fullstack.code-workspace`:
  - KR: VS Code 워크스페이스 설정 파일입니다. 여러 프로젝트를 한 워크스페이스로 열 때 사용됩니다.
  - EN: VS Code workspace configuration file for opening multiple projects together.

- `.gitignore`:
  - KR: Git에서 제외할 파일/폴더 패턴을 지정합니다.
  - EN: Specifies files/folders to be ignored by Git.

- `LICENSE`:
  - KR: 저장소에 적용된 라이선스 파일입니다.
  - EN: License file that applies to this repository.

- `README.md` (이 파일):
  - KR: 저장소 전체 설명 및 폴더별 요약이 포함되어 있습니다.
  - EN: This file contains an overview of the repository and summaries of folders.

- `book_summary/`:
  - KR: 책 요약과 관련 문서가 위치합니다.
  - EN: Contains book summaries and related notes.

- `Database/`:
  - KR: 데이터베이스 관련 실습 자료와 산출물(ERD, SQL, PL/SQL, 스키마, 테스트데이터 등)을 포함합니다.
  - EN: Database exercises and artifacts (ERDs, SQL scripts, PL/SQL, schemas, test data, and deliverables).
  - 하위 폴더 예: `_제출문서/`, `erd/`, `plsql/`, `schema/`, `sql/`, `src/`, `TD/` 등

- `DeepLearning_Java/`:
  - KR: Java 기반 딥러닝 관련 예제나 실습 코드가 포함될 수 있는 폴더입니다.
  - EN: Folder for Java-based deep learning examples or experiments.

- `dev/`:
  - KR: 개발 관련 문서와 도구, 튜토리얼, 다양한 언어/프레임워크 가이드가 모여 있습니다. 많은 마크다운 문서(`Flutter.md`, `Java__Programming.md`, `Python__Programming.md`, `React.md` 등)와 서브폴더(예: `AI/`, `docker/`, `FastAPI/`)가 포함되어 있습니다.
  - EN: Contains development guides, tools, and tutorials across languages and frameworks. Many markdown guides (`Flutter.md`, `Java__Programming.md`, `Python__Programming.md`, `React.md`, etc.) and subfolders (e.g., `AI/`, `docker/`, `FastAPI/`).

- `FrameworkStudy/`:
  - KR: 프레임워크 학습 자료(예: Spring Framework 관련 문서 및 샘플 프로젝트)를 포함합니다.
  - EN: Framework study materials (e.g., Spring Framework docs and sample apps).

- `JavaFx/`:
  - KR: JavaFX 관련 예제 및 학습 코드가 위치합니다.
  - EN: JavaFX examples and learning code.

- `JavaStudy/`:
  - KR: Java 기초/연습 문제, 예제 소스 파일들이 포함되어 있습니다. (다수의 `TestXXX.java` 파일 포함)
  - EN: Core Java practice problems and example source files (many `TestXXX.java` files).

- `JDBCStudy/`, `JsonEx/`, `KakaoMapStudy/`:
  - KR: 각각 JDBC, JSON 예제, 카카오맵 연동 관련 학습 자료 폴더입니다.
  - EN: Folders for JDBC examples, JSON exercises, and Kakao Map integration studies, respectively.

- `Lecture_note/`:
  - KR: 강의 노트 및 수업자료를 모아둔 폴더입니다.
  - EN: Folder containing lecture notes and course materials.

- `Oracle_Semi-Project/`, `OracleStudy/`:
  - KR: Oracle DB 관련 세미 프로젝트 및 학습 자료입니다.
  - EN: Oracle DB semi-projects and study materials.

- `Python_dev/`:
  - KR: Python 개발 관련 노트, 스크립트, 예제 코드 모음입니다.
  - EN: Python development notes, scripts, and examples.

- `SpringMVCStudy/`:
  - KR: Spring MVC 관련 학습 자료 및 예제 프로젝트입니다.
  - EN: Spring MVC study materials and sample projects.

- `Tensorflow_Java/`:
  - KR: Java 환경에서의 TensorFlow 관련 실습 자료가 들어있을 가능성이 있습니다.
  - EN: TensorFlow for Java experiments and related material.

- `WebStudy/`, `XmlStudy/`:
  - KR: 웹 개발과 XML 관련 학습 자료 폴더입니다.
  - EN: Web development and XML study folders.

- `과제/`:
  - KR: 강의/수업의 과제물들을 정리한 폴더입니다.
  - EN: Assignments collected from courses or projects.

How to use / 사용법
-------------------

- KR: 관심 있는 주제(예: `dev/` 또는 `Database/`)의 폴더로 이동하여 해당 폴더의 `README.md` 또는 마크다운 문서를 읽으세요. 예제 코드는 각 폴더의 구조에 따라 실행 방법이 다르니, 각 프로젝트 폴더의 안내 문서를 확인하세요.
- EN: Navigate to a topic folder (for example, `dev/` or `Database/`) and read that folder's `README.md` or markdown files. Example projects have different run instructions—follow the README inside each project folder.

Contributing / 기여
------------------

- KR: 자료 추가나 수정 제안은 PR(Pull Request)로 보내주세요. 문서화가 필요한 새 자료를 발견하면 이 저장소에 정리해 주시면 좋습니다.
- EN: Please submit contributions via Pull Requests. If you find materials that should be documented or organized, adding them here is welcome.

Contact / 연락처
----------------

- KR: 저장소 소유자 또는 관리자에게 문의하려면 이 프로젝트의 GitHub 프로필을 통해 연락하세요.
- EN: Contact the repository owner/maintainer via their GitHub profile for questions.

추가 메모 (Notes)
-----------------

- KR: 이 README는 리포지토리에 포함된 주요 폴더의 개요를 제공하도록 설계되었습니다. 각 하위 폴더에는 더 상세한 설명이 있을 수 있으니 해당 폴더 내 문서를 우선 확인하세요.
- EN: This README is intended to provide an overview of the major folders. Many subfolders include more detailed documentation—please consult those first for specifics.

---
Generated: concise bilingual overview for local developer reference.
# fullstack-flutter-dev
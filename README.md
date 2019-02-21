# MagicSpells

> 기능

- 각 4개의 버튼을 누르면 서버와 연동하여 CRUD(Create, Read, Update, Delete) 기능을 가짐
	- C : POST 역할로 textField에 입력한 name과 username, password를 주소인자값과 JSON 형태 데이터로 서버에 넘겨준다.
	- R : GET 역할로 모든 데이터를 가져와서 JSON 형태로 콘솔창에 보여준다.
	- U : PUT 역할로 기존에 서버에 저장된 name에 해당하는 값 username, password를 수정한다.
	- D : DELETE 역할로 기존에 서버에 저장된 name 값의 데이터를 삭제한다.

> 실행 화면

- main

<img src="img/main.png" width="50%">

- C button & R button clicked

<img src="img/create.png" width="50%"><img src="img/readConsole.png" width="50%">

- U button & R button clicked

<img src="img/update.png" width="50%"><img src="img/readConsole2.png" width="50%">

- D button & R button clicked

<img src="img/delete.png" width="50%"><img src="img/readConsole3.png" width="50%">
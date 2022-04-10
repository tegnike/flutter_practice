import 'package:flutter/material.dart';

class NewTodoPage extends StatelessWidget {
  // stateを保つ必要がないのでStatelessを継承

  @override
  Widget build(BuildContext context) {
    // リアルタイムで反映するのに必要、フォームでは必須かも
    final _titleController = TextEditingController();
    final _contentController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("新規登録"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 0, right: 30, bottom: 0, left: 30),
                child: TextField(
                  obscureText: false,
                  maxLines: 1,
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: "タイトル",
                    hintText: "買い物"
                  ),
                )
              ),
              Container(
                margin: const EdgeInsets.only(top: 0, right: 30, bottom: 0, left: 30),
                child: TextField(
                  obscureText: false,
                  maxLines: 8,
                  controller: _contentController,
                  decoration: const InputDecoration(
                    labelText: "内容",
                    hintText: "りんごを買う"
                  ),
                )
              ),
              ElevatedButton(
                onPressed: () {
                  if (_titleController.text.isNotEmpty && _contentController.text.isNotEmpty) {
                    Navigator.pop(context, {
                      // 第2引数（ここ）にMapを渡すことでテキストをTodoPageに返す
                      "title": _titleController.text,
                      "content": _contentController.text
                    });
                  }
                },
                child: const Text("登録")
              )
            ],
          )
        )
      )
    );
  }
}

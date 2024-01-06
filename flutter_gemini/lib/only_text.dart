import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_gemini/google_gemini.dart';

const apiKey = "";

class TextOnly extends StatefulWidget {
  const TextOnly({
    super.key,
  });

  @override
  State<TextOnly> createState() => _TextOnlyState();
}

class _TextOnlyState extends State<TextOnly> {
  bool loading = false;
  List textChat = [];

  final TextEditingController _textController = TextEditingController();
  final ScrollController _controller = ScrollController();

  // Create Gemini Instance
  final gemini = GoogleGemini(
    apiKey: apiKey,
  );

  // Text only input
  void fromText({required String query}) {
    setState(() {
      loading = true;
      textChat.add({
        "role": "User",
        "text": query,
      });
      _textController.clear();
    });
    scrollToTheEnd();

    gemini.generateFromText(query).then((value) {
      setState(() {
        loading = false;
        textChat.add({"role": "Gemini", "text": value.text});
      });
      scrollToTheEnd();
    }).onError((error, stackTrace) {
      setState(() {
        loading = false;
        textChat.add({"role": "Gemini", "text": error.toString()});
      });
      scrollToTheEnd();
    });
  }

  void scrollToTheEnd() {
    _controller.jumpTo(_controller.position.maxScrollExtent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (textChat.isEmpty) ...[
            Expanded(
              flex: 10,
              child: Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'Olá!👋',
                          style: GoogleFonts.openSans(
                            color: Colors.black,
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                          )),
                      const TextSpan(text: '\n'),
                      TextSpan(
                        text: 'Me faça uma pergunta ',
                        style: GoogleFonts.ubuntu(
                          color: Colors.black,
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w200,
                          letterSpacing: 2,
                        ),
                      ),
                      const TextSpan(
                          text: '😄', style: TextStyle(fontSize: 20)),
                    ],
                  ),
                ),
              ),
            ),
          ],
          Expanded(
            child: ListView.builder(
              controller: _controller,
              itemCount: textChat.length,
              padding: const EdgeInsets.only(bottom: 20),
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      isThreeLine: true,
                      leading: CircleAvatar(
                        backgroundColor:
                            const Color.fromARGB(255, 86, 151, 135),
                        child: Text(
                          textChat[index]["role"].substring(0, 1),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                        textChat[index]["role"],
                      ),
                      subtitle: Text(
                        textChat[index]["text"],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 26),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(width: 10),
                Expanded(
                    child: TextFormField(
                  controller: _textController,
                  minLines: 1,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 14),
                  decoration: InputDecoration(
                      hintText: 'Digite a pergunta',
                      contentPadding:
                          const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                      hintStyle: GoogleFonts.ubuntu(
                        color: Colors.black,
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w200,
                        letterSpacing: 1,
                      ),
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: loading
                            ? const CircularProgressIndicator()
                            : InkWell(
                                onTap: () {
                                  fromText(query: _textController.text);
                                },
                                child: CircleAvatar(
                                  backgroundColor:
                                      const Color.fromARGB(255, 86, 151, 135),
                                  child: SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: Image.asset(
                                      'assets/icons/icon-send.png',
                                    ),
                                  ),
                                ),
                              ),
                      )),
                  onChanged: (value) {},
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}

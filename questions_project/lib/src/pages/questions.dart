class Questions {
  final String numb;
  final String question;
  final String description;
  final String aw1;
  final String aw2;
  final String aw3;
  final String aw4;

  Questions(
      {this.numb = '',
      this.question = '',
      this.description = '',
      this.aw1 = '',
      this.aw2 = '',
      this.aw3 = '',
      this.aw4 = ''});

  static List<Questions> getQuestions() {
    return [
      Questions(
        numb: '1',
        question: 'Questão 1',
        description: 'Questão asndkoqngkjpqn gjqegnqkgnqoegqoejmgo',
        aw1: 'a) resposta 1',
        aw2: 'b) reposta 2',
        aw3: 'c) resposta 3',
        aw4: 'd) resposta 4',
      ),
      Questions(
        numb: '2',
        question: 'Questão 2',
        description: 'Questão asndkoqngkjpqn gjqegnqkgnqoegqoejmgo',
        aw1: 'a) resposta 1',
        aw2: 'b) reposta 2',
        aw3: 'c) resposta 3',
        aw4: 'd) resposta 4',
      ),
      Questions(
        numb: '3',
        question: 'Questão 3',
        description: 'Questão asndkoqngkjpqn gjqegnqkgnqoegqoejmgo',
        aw1: 'a) resposta 1',
        aw2: 'b) reposta 2',
        aw3: 'c) resposta 3',
        aw4: 'd) resposta 4',
      ),
      Questions(
        numb: '4',
        question: 'Questão 4',
        description: 'Questão asndkoqngkjpqn gjqegnqkgnqoegqoejmgo',
        aw1: 'a) resposta 1',
        aw2: 'b) reposta 2',
        aw3: 'c) resposta 3',
        aw4: 'd) resposta 4',
      ),
    ];
  }
}

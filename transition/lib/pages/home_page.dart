import 'package:animations/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final crews = Crew.getCrew();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mugiwaras',
          style: GoogleFonts.quicksand(
              fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
        ),
      ),
      body: ListView.builder(
        itemCount: crews.length,
        itemBuilder: (context, index) {
          final crew = crews[index];
          return Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed(DETAILS, arguments: crew);
                },
                leading: ClipOval(
                  child: Hero(
                    tag: crew.urlImage,
                    child: Image.network(crew.urlImage),
                  ),
                ),
                title: Text(
                  crew.name,
                  style: GoogleFonts.ubuntu(fontSize: 18),
                ),
                subtitle: Text(
                  crew.ocupation,
                  style: GoogleFonts.ubuntu(
                      fontSize: 13, fontStyle: FontStyle.italic),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Crew {
  final String name;
  final String ocupation;
  final String urlImage;
  final String bodyImage;
  final Color theme;
  final String description;

  Crew(this.name, this.ocupation, this.urlImage, this.bodyImage, this.theme,
      this.description);

  static List<Crew> getCrew() {
    return [
      Crew(
          'Luffy',
          'Captain',
          'https://i.pinimg.com/564x/7b/4c/6d/7b4c6d9638dd629705791d4f9cbe597b.jpg',
          'https://www.pngall.com/wp-content/uploads/13/Luffy-PNG-Free-Image.png',
          Colors.red,
          'Monkey D. Luffy, também conhecido como "Luffy do Chapéu de Palha" e comumente como "Chapéu de Palha", é o fundador e capitão dos cada vez mais infames e poderosos Piratas do Chapéu de Palha, bem como o mais poderoso de seus melhores lutadores.'),
      Crew(
        'Zoro',
        'Swordsman',
        'https://i.pinimg.com/564x/79/e2/c9/79e2c9402014ead1eebf6c9f184c5bf8.jpg',
        'https://static.wikia.nocookie.net/liga-da-zueira-oficial/images/d/d9/Zoro_Base_P%C3%B3s_Timeskip.png/revision/latest?cb=20220414225115&path-prefix=pt-br',
        Colors.green,
        'Ele foi o primeiro membro a juntar-se à tripulação. Sua fama como mestre espadachim e sua grande força, juntamente com as ações de seu capitão, às vezes levaram os outros a acreditar que ele era o verdadeiro capitão da tripulação antes deste obter sua primeira recompensa, enquanto algumas pessoas acreditam que ele seja o imediato.',
      ),
      Crew(
        'Nami',
        'Navigator',
        'https://i.pinimg.com/564x/d6/56/16/d65616b121840373bc2e0bb79500882c.jpg',
        'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/51158316-fd7e-48ca-b5fe-8542e9dfe357/ddwjr3p-0e6d8d53-ca01-4961-bfc4-c4b479cbc4a3.png/v1/fill/w_640,h_512/nami_by_bodskih_ddwjr3p-fullview.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NTEyIiwicGF0aCI6IlwvZlwvNTExNTgzMTYtZmQ3ZS00OGNhLWI1ZmUtODU0MmU5ZGZlMzU3XC9kZHdqcjNwLTBlNmQ4ZDUzLWNhMDEtNDk2MS1iZmM0LWM0YjQ3OWNiYzRhMy5wbmciLCJ3aWR0aCI6Ijw9NjQwIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.2-RliHmkYGVytzkKl98WOjFkIJG3CTkhfCgE5LzruLI',
        Colors.orange,
        'A "Gata Ladra" Nami é a navegadora dos Piratas do Chapéu de Palha. Ela foi o terceiro membro da tripulação e a segunda a entrar, fazendo-o durante o Arco Orange Town. Ela é a irmã adotiva de Nojiko, desde que as duas ficaram órfãs e foram levadas por Bell-mère.',
      ),
      Crew(
        'Ussop',
        'Sniper',
        'https://i.pinimg.com/564x/ac/3b/90/ac3b90ffd6cccdba348ba518929083df.jpg',
        'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/51158316-fd7e-48ca-b5fe-8542e9dfe357/ddwjr39-932868f1-5d05-4e72-b25a-b30d9274435a.png/v1/fill/w_640,h_512/usopp_by_bodskih_ddwjr39-fullview.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NTEyIiwicGF0aCI6IlwvZlwvNTExNTgzMTYtZmQ3ZS00OGNhLWI1ZmUtODU0MmU5ZGZlMzU3XC9kZHdqcjM5LTkzMjg2OGYxLTVkMDUtNGU3Mi1iMjVhLWIzMGQ5Mjc0NDM1YS5wbmciLCJ3aWR0aCI6Ijw9NjQwIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.AW1-Wm3ITzOaoOZix5UXziyNt9sJiExa2JSHBVEpwbQ',
        Colors.deepOrange,
        '"God" Usopp é o Atirador dos Piratas do Chapéu de Palha. Ele é o quarto membro da tripulação e o terceiro a entrar, fazendo isso no final do Arco Vila Syrup. Embora ele tenha deixado a tripulação durante o Arco Water 7, ele se juntou novamente ao final do Arco Pós-Enies Lobby.',
      ),
      Crew(
        'Sanji',
        'Chef',
        'https://i.pinimg.com/564x/dd/f4/a3/ddf4a310117af4ebf55114ec2ce57269.jpg',
        'https://img3.gelbooru.com/images/f5/68/f568ead262123286388f5cb929c2a01f.png',
        Colors.yellow,
        '"Perna Preta" Sanji, nascido como Vinsmoke Sanji, e também é o cozinheiro dos Piratas do Chapéu de Palha, assim como um antigo chefe de cozinha do Baratie. Ele também é o terceiro filho e a quarta criança da Família Vinsmoke, tornando-o um príncipe do Reino Germa, até que ele oficialmente os renunciou duas vezes',
      ),
      Crew(
        'Chopper',
        'Doctor',
        'https://i.pinimg.com/564x/c0/c7/1b/c0c71bcadc86be5ea1c9193e71e3b05a.jpg',
        'https://ekladata.com/sLyyC77_cYu_a7PG0QN8BZ-KDhI.png',
        Colors.pinkAccent,
        'Tony Tony Chopper é uma rena. Ele é o médico da tripulação dos Piratas do Chapéu de Palha. Chopper é uma rena que, após comer a Hito Hito no Mi, adquiriu a habilidade de se transformar e raciocinar como os humanos.Ele é o sexto membro e um dos poucos membros da tripulação que nasceu na Grand Line, numa ilha chamada Drum.',
      ),
      Crew(
        'Robin',
        'Archaeologist',
        'https://i.pinimg.com/564x/f7/f0/c3/f7f0c3a27feca210f8b53edc33936ad8.jpg',
        'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/51158316-fd7e-48ca-b5fe-8542e9dfe357/df493vd-63e8cbf5-a8a6-4c88-a931-3625e99f9ce5.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzUxMTU4MzE2LWZkN2UtNDhjYS1iNWZlLTg1NDJlOWRmZTM1N1wvZGY0OTN2ZC02M2U4Y2JmNS1hOGE2LTRjODgtYTkzMS0zNjI1ZTk5ZjljZTUucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.rpZxbR_v1ImOaUAbBZDx4vAbsBesLsrOmmY1b96GGRw',
        Colors.purpleAccent,
        'Nico Robin, também conhecida como "Criança Demônio" e "Luz da Revolução", é a arqueóloga dos Piratas do Chapéu de Palha. Ela é a única sobrevivente da ilha destruída de Ohara, localizada no West Blue. Como resultado, ela é atualmente a única pessoa no mundo com a capacidade de ler e decifrar Poneglyphs, uma habilidade que é considerada proibida e que ameaça o Governo Mundial.',
      ),
      Crew(
        'Franky',
        'Shipwright',
        'https://i.pinimg.com/564x/03/5b/40/035b40228c942eb12eaa649460d9ffe5.jpg',
        'https://64.media.tumblr.com/7d5aaf30c89461baaee73b62b4aa5d08/d0ab9056f528a867-5a/s640x960/106e0e40337b237c4ca54d3879cff2ef1e3d47e1.png',
        Colors.blueAccent,
        'Franky é o carpinteiro dos Piratas do Chapéu de Palha. Ele é um cyborg de 36 anos de Water 7 e foi introduzido na história como o líder da Família Franky, um grupo de desmantelamento de navios.',
      ),
      Crew(
        'Brook',
        'Musician',
        'https://i.pinimg.com/564x/d5/80/6e/d5806ecc88f8a396f8aff32b85a52fea.jpg',
        'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/51158316-fd7e-48ca-b5fe-8542e9dfe357/dbcd4vr-56b33385-fa80-4333-9a71-85179e02ec82.png/v1/fill/w_640,h_512/brook_by_bodskih_dbcd4vr-fullview.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NTEyIiwicGF0aCI6IlwvZlwvNTExNTgzMTYtZmQ3ZS00OGNhLWI1ZmUtODU0MmU5ZGZlMzU3XC9kYmNkNHZyLTU2YjMzMzg1LWZhODAtNDMzMy05YTcxLTg1MTc5ZTAyZWM4Mi5wbmciLCJ3aWR0aCI6Ijw9NjQwIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.sv7rk6bozxq2XqxIxsl5yqTB0O1yE_K06s0hU0Yb6Po',
        Colors.blueGrey,
        'Brook é o Músico dos Piratas do Chapéu de Palha. Ele é um esqueleto que os Chapéus de Palha encontraram a bordo de um navio fantasma depois de entrarem no Triângulo Florian. Ele é um usuário de Akuma no Mi que comeu a Yomi Yomi no Mi, o que o torna um pseudo-imortal por causa de seus poderes.',
      ),
      Crew(
        'Jinbei',
        'Helmsman',
        'https://i.pinimg.com/564x/d8/47/97/d8479727f639c8f991533a9896a042a9.jpg',
        'https://static.wikia.nocookie.net/fiction-battlefield/images/1/10/Jinbao.png/revision/latest?cb=20181127230044&path-prefix=pt-br',
        Colors.blue,
        '"Cavaleiro do Mar" Jinbe é o timoneiro dos Piratas do Chapéu de Palha. Ele é o décimo membro da tripulação e o nono a se juntar, fazendo isso durante o Arco País de Wano. Jinbe é um homem-peixe sendo um tubarão-baleia e um poderoso mestre do karatê Homem-Peixe. Seu sonho é realizar o desejo moribundo de seu ex-capitão Fisher Tiger de coexistência e igualdade entre humanos e homens-peixe.',
      ),
    ];
  }
}

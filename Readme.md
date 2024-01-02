#Learning Flutter

Repositório destinado aos conteúdos passados no curso Aprenda Flutter e Desenvolva Apps Para Android e IOS, por Leonardo Moura Leitão.

<hr>

Visualização do estado do aplicativo. Inativo, pausado, resumido e suspendido. Interações feitas pelo usuário ao minimizar ou deixar o app em background.

    EX: class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
        final List<Transaction> _transaction = [];

        @override
        void initState() {
            super.initState();
            WidgetsBinding.instance.addObserver(this);
        }

        @override
        void didChangeAppLifecycleState(AppLifecycleState state) {
            print (state);
        }

        @override
        void dispose() {
            super.dispose();
            WidgetsBinding.instance.removeObserver(this);
        }
    }
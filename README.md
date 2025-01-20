# 🎬**Documentação do Aplicativo Untold**

## **Introdução**
Este aplicativo funciona como uma plataforma de streaming de vídeo, onde os usuários podem assistir a filmes em cartaz diretamente de seus dispositivos.
## **APK**
O arquivo APK da aplicação pode ser baixado pelo link abaixo:

📥 **[Baixar APK](https://drive.google.com/file/d/14Hc0AMMKStGDgye5o9oG-EhaxCbeHw01/view?usp=sharing)**

### ⚠️ Nota: Status do Projeto

- Devido a limitações de tempo e outros fatores, algumas funcionalidades ou componentes não estão totalmente implementados.

---

## ⚙️ **Documentação dos Arquivos principais (`lib/main.dart` e `lib/service_locator.dart`)**

Esses arquivos são responsáveis por inicializar o aplicativo e configurar a injeção de dependência, criando a base para o funcionamento do **Untold Stream**.

## **Arquivos**

<details>
<summary><strong>main.dart</strong></summary>
  
## **Descrição**: 
O arquivo **`main.dart`** é o ponto de entrada do aplicativo. Ele configura os serviços necessários, inicializa o Firebase e define o tema global e a tela inicial do aplicativo.

### **Funcionalidades**
- **Inicialização do Firebase**:
  - Verifica se o Firebase já está configurado antes de inicializá-lo.
- **Configuração do Tema**:
  - Define o tema global do aplicativo, utilizando a classe **`AppTheme`**.
- **Tela inicial**:
  - Define a **`SplashPage`** como a tela inicial do aplicativo.

### **Principais Componentes**
- **`initializeFirebase()`**: Configura o Firebase no aplicativo.
- **`MyApp`**:
  - Componente principal que encapsula o aplicativo.
  - Configura o **MaterialApp** com tema e tela inicial.
</details>

<details>
<summary><strong>service_locator.dart</strong></summary>
## **Descrição**: 
O arquivo **`service_locator.dart`** utiliza o pacote **GetIt** para configurar a injeção de dependência no aplicativo. Ele permite centralizar e gerenciar dependências de maneira eficiente.

### **Funcionalidades**
  - Configura serviços globais, como o `NavigationService`.
  - Fornece uma estrutura extensível para adicionar mais serviços no futuro.

### **Principais Componentes**
- `setupServiceLocator():`
- Registra dependências como singletons para serem acessadas em qualquer lugar do aplicativo.
- `NavigationService:`
- Permite navegação centralizada utilizando uma `GlobalKey<NavigatorState>`.

</details>
---

## 🔑 **Documentação dos Arquivos em `core/services`**

O diretório `core/services` contém classes que fornecem serviços essenciais para o funcionamento do aplicativo, como autenticação e navegação.

## **Arquivos**
<details>
<summary><strong>auth_service.dart</strong></summary>

Gerencia a autenticação do Firebase, incluindo registro, obtenção de token de autenticação e UID do usuário.

### **Funções**
<details>
<summary><code>registerWithEmailAndPassword(String email, String password, String username)</code></summary>

- **Descrição**: 
  Registra um novo usuário no Firebase com email e senha.
- **Detalhes**:
  - Atualiza o nome de exibição (`displayName`) do usuário após o registro.
  - Lança exceções específicas caso:
    - A senha seja fraca.
    - O email já esteja em uso.
    - O registro falhe por outros motivos.
- **Retorno**: 
  - Retorna o objeto `User` do Firebase do usuário registrado.

</details>

<details>
<summary><code>getAuthToken()</code></summary>

- **Descrição**: 
  Obtém o token de autenticação (JWT) do usuário autenticado.
- **Retorno**: 
  - String contendo o token JWT.
  - Retorna `null` caso não exista um usuário autenticado.

</details>

<details>
<summary><code>getFirebaseUID()</code></summary>

- **Descrição**: 
  Obtém o identificador único (UID) do usuário autenticado no Firebase.
- **Retorno**: 
  - String contendo o UID.
  - Retorna `null` caso não exista um usuário autenticado.

</details>

</details>

<details>
<summary><strong>google_sign_in_service.dart</strong></summary>

Gerencia o processo de login com o Google, utilizando Firebase e Google Sign-In.

### **Funções**
<details>
<summary><code>signInWithGoogle()</code></summary>

- **Descrição**: 
  Inicia o processo de autenticação do usuário com o Google.
- **Passos**:
  1. Solicita ao usuário a seleção de uma conta do Google.
  2. Obtém as credenciais de autenticação do Google.
  3. Usa as credenciais para autenticar no Firebase.
- **Retorno**: 
  - Objeto `User` do Firebase do usuário autenticado.
  - Retorna `null` caso o processo de login seja cancelado.

</details>

</details>

<details>
<summary><strong>navigation_service.dart</strong></summary>

Gerencia a navegação entre as telas do aplicativo utilizando o `Navigator`.

### **Propriedades**
<details>
<summary><code>navigatorKey</code></summary>

- **Descrição**: 
  Uma chave global usada para acessar o estado do navegador e realizar operações de navegação fora do contexto de widgets.

</details>

### **Funções**
<details>
<summary><code>navigateTo(String routeName, {Object? arguments})</code></summary>

- **Descrição**: 
  Navega para uma rota específica.
- **Parâmetros**:
  - `routeName`: Nome da rota para onde navegar.
  - `arguments`: Argumentos opcionais a serem passados para a nova rota.
- **Retorno**: 
  - Um `Future` que é resolvido quando a navegação é concluída.

</details>

<details>
<summary><code>goBack()</code></summary>

- **Descrição**: 
  Retorna para a tela anterior na pilha de navegação.
- **Comportamento**: 
  - Fecha a tela atual e exibe a tela anterior.

</details>

</details>

---
## 🛠️ **Documentação dos Arquivos em `utils`**

A pasta `utils` contém utilitários gerais que facilitam operações comuns, como formatação de datas, manipulação de arquivos e navegação personalizada.

## **Arquivos**

<details>
<summary><strong>format_date.dart</strong></summary>

### **Descrição**
Utilitário para formatação de datas em um formato amigável para exibição.

### **Funções**
<details>
<summary><code>formatDate(String date)</code></summary>

- **Descrição**: 
  Recebe uma data no formato `String` e a converte para o formato legível `MMM dd, yyyy`.
- **Detalhes**:
  - Caso a string de data não seja válida, retorna a data original como está.
- **Parâmetro**:
  - `date`: String representando a data a ser formatada.
- **Retorno**: 
  - Uma string no formato `MMM dd, yyyy` (por exemplo, `Jan 01, 2023`).

</details>

</details>

<details>
<summary><strong>file_utils.dart</strong></summary>

### **Descrição**
Utilitário para manipulação de arquivos, como criar objetos `MultipartFile` para upload.

### **Funções**
<details>
<summary><code>createMultipartFile(File file)</code></summary>

- **Descrição**: 
  Cria um objeto `MultipartFile` a partir de um arquivo local, útil para upload em APIs que utilizam `Dio`.
- **Parâmetro**:
  - `file`: Objeto do tipo `File` que será convertido em `MultipartFile`.
- **Retorno**: 
  - Um objeto `MultipartFile` contendo o arquivo e o nome original.

</details>

</details>

<details>
<summary><strong>navigation_utils.dart</strong></summary>

### **Descrição**
Utilitário para gerenciar transições personalizadas de navegação no aplicativo.

### **Funções**
<details>
<summary><code>navigateWithFade(BuildContext context, Widget page, {Duration duration})</code></summary>

- **Descrição**: 
  Navega para uma nova página utilizando uma animação de transição por fade.
- **Parâmetros**:
  - `context`: O contexto atual de navegação.
  - `page`: A nova página (widget) para onde o aplicativo navegará.
  - `duration`: Duração opcional da animação de transição. O padrão é `100ms`.
- **Retorno**: 
  - Um `Future<T?>` resolvido quando a navegação for concluída.

</details>

</details>

---

## 🗂️ **Documentação dos Modelos**

Os modelos representam as entidades do sistema e encapsulam os dados necessários para as operações do aplicativo. Eles utilizam o pacote `json_annotation` para facilitar a serialização e desserialização de objetos JSON.

## **Modelos**

<details>
<summary><strong>api_user.dart</strong></summary>

### **Descrição**
Representa um usuário da API.

### **Campos**
- `id` (int): Identificador único do usuário.
- `username` (String): Nome de usuário.
- `email` (String): Email do usuário.
- `provider` (String): Provedor de autenticação.
- `confirmed` (bool): Indica se o usuário foi confirmado.
- `blocked` (bool): Indica se o usuário está bloqueado.
- `createdAt` (DateTime): Data de criação.
- `updatedAt` (DateTime): Data de atualização.

### **Funções**
- `fromJson(Map<String, dynamic> json)`: Converte um JSON em um objeto `ApiUser`.
- `toJson()`: Converte o objeto `ApiUser` em JSON.

</details>

<details>
<summary><strong>app_user.dart</strong></summary>

### **Descrição**
Representa um usuário do aplicativo.

### **Campos**
- `displayName` (String?): Nome exibido do usuário.
- `photoURL` (String?): URL da foto de perfil do usuário.
- `email` (String?): Email do usuário.

### **Uso**
Este modelo é usado para gerenciar os dados de um usuário autenticado no aplicativo.

</details>

<details>
<summary><strong>like.dart</strong></summary>

### **Descrição**
Representa uma ação de "curtir".

### **Classes**
1. **Like**
   - `id` (int): Identificador único do "like".
   - `attributes` (LikeAttributes): Atributos relacionados ao "like".

2. **LikeAttributes**
   - `createdAt` (DateTime): Data de criação.
   - `updatedAt` (DateTime): Data de atualização.
   - `publishedAt` (DateTime): Data de publicação.

### **Funções**
- `fromJson(Map<String, dynamic> json)`: Converte JSON em objeto `Like`.
- `toJson()`: Converte o objeto `Like` em JSON.

</details>

<details>
<summary><strong>movie.dart</strong></summary>

### **Descrição**
Representa um filme.

### **Classes**
1. **Movie**
   - `id` (int): Identificador único do filme.
   - `attributes` (MovieAttributes): Atributos do filme.

2. **MovieAttributes**
   - `name` (String): Nome do filme.
   - `synopsis` (String): Sinopse do filme.
   - `currently_playing` (bool): Indica se o filme está em exibição.
   - `stream_link` (String): Link de streaming.
   - `genre` (String): Gênero do filme.
   - `end_date` (DateTime): Data de término da exibição.
   - `createdAt` (DateTime): Data de criação.
   - `updatedAt` (DateTime): Data de atualização.
   - `publishedAt` (DateTime): Data de publicação.

### **Funções**
- `fromJson(Map<String, dynamic> json)`: Converte JSON em objeto `Movie`.
- `toJson()`: Converte o objeto `Movie` em JSON.

</details>

<details>
<summary><strong>register_request.dart</strong></summary>

### **Descrição**
Representa uma solicitação de registro de usuário.

### **Campos**
- `username` (String): Nome de usuário.
- `email` (String): Email do usuário.
- `password` (String): Senha do usuário.

### **Funções**
- `fromJson(Map<String, dynamic> json)`: Converte JSON em objeto `RegisterRequest`.
- `toJson()`: Converte o objeto `RegisterRequest` em JSON.

</details>

<details>
<summary><strong>register_response.dart</strong></summary>

### **Descrição**
Representa a resposta de um registro de usuário.

### **Classes**
1. **RegisterResponse**
   - `jwt` (String): Token de autenticação.
   - `apiUser` (ApiUser): Dados do usuário registrado.

2. **Role**
   - `id` (int): Identificador único do papel.
   - `name` (String): Nome do papel.
   - `description` (String): Descrição do papel.
   - `type` (String): Tipo do papel.
   - `createdAt` (DateTime): Data de criação.
   - `updatedAt` (DateTime): Data de atualização.

### **Funções**
- `fromJson(Map<String, dynamic> json)`: Converte JSON em objeto `RegisterResponse`.
- `toJson()`: Converte o objeto `RegisterResponse` em JSON.

</details>

<details>
<summary><strong>response_wrapper.dart</strong></summary>

### **Descrição**
Utilitário genérico para encapsular respostas da API.

### **Classes**
1. **ResponseWrapper<T>**
   - `data` (List<T>): Lista de dados genéricos.
   - `meta` (Meta): Metadados da resposta.

2. **Meta**
   - `pagination` (Pagination): Informações de paginação.

3. **Pagination**
   - `page` (int): Número da página.
   - `pageSize` (int): Tamanho da página.
   - `pageCount` (int): Total de páginas.
   - `total` (int): Total de itens.

### **Funções**
- `fromJson(Map<String, dynamic> json)`: Converte JSON em `ResponseWrapper`.
- `toJson()`: Converte o objeto `ResponseWrapper` em JSON.

</details>

## 📦 **Documentação dos Repositórios**

Os repositórios são responsáveis por abstrair a lógica de acesso a dados, conectando os serviços da API com os modelos utilizados na aplicação.

## **Repositórios**

<details>
<summary><strong>movie_repository.dart</strong></summary>

### **Descrição**
Gerencia a lógica de acesso a filmes na API.

### **Dependências**
- **`ApiService`**: Serviço que fornece acesso às requisições da API.
- **`Movie`**: Modelo que representa um filme.

### **Funções**
1. **`MovieRepository(this.apiService)`**
   - Construtor que inicializa o repositório com o serviço de API.

2. **`Future<List<Movie>> fetchMovies()`**
   - Faz uma requisição para buscar filmes utilizando o serviço de API.
   - **Retorno**: Uma lista de objetos `Movie`.
   - **Erro**: Em caso de falha, retorna uma lista vazia e exibe um log de erro.

### **Uso**
Este repositório é utilizado para buscar filmes do servidor e entregar os dados formatados para a aplicação.

</details>

<details>
<summary><strong>user_repository.dart</strong></summary>

### **Descrição**
Gerencia a lógica de acesso a usuários na API.

### **Dependências**
- **`ApiService`**: Serviço que fornece acesso às requisições da API.
- **`ApiUser`**: Modelo que representa um usuário da API.

### **Funções**
1. **`UserRepository(this.apiService)`**
   - Construtor que inicializa o repositório com o serviço de API.

2. **`Future<List<ApiUser>> fetchAndStoreUsers()`**
   - Faz uma requisição para buscar usuários utilizando o serviço de API.
   - **Retorno**: Uma lista de objetos `ApiUser`.
   - **Erro**: Em caso de falha, retorna uma lista vazia e exibe um log de erro.

### **Uso**
Este repositório é utilizado para buscar e armazenar os usuários do servidor.

</details>

---
## 🌐 **Documentação dos Services**

Os serviços fornecem a lógica necessária para interagir com APIs e lidar com autenticação, requisições e respostas de forma centralizada.

## **Services**

<details>
<summary><strong>api_service.dart</strong></summary>

### **Descrição**
Define e gerencia as interações com a API utilizando a biblioteca Retrofit para facilitar as requisições HTTP.

### **Dependências**
- **`Dio`**: Cliente HTTP utilizado pelo Retrofit.
- **`Retrofit`**: Ferramenta para gerar classes que realizam as chamadas de API.
- Modelos:
  - **`RegisterRequest`**: Representa os dados necessários para registrar um usuário.
  - **`RegisterResponse`**: Representa a resposta ao registrar um usuário.
  - **`ApiUser`**, **`Like`**, **`Movie`**, **`ResponseWrapper`**: Modelos utilizados nas requisições e respostas.

### **Funções**
1. **`createAccount(RegisterRequest body)`**
   - Endpoint: `POST users`.
   - Cria uma conta de usuário.

2. **`register(RegisterRequest request)`**
   - Endpoint: `POST /auth/local/register`.
   - Registra um usuário com autenticação local.

3. **`getUsers()`**
   - Endpoint: `GET users`.
   - Retorna uma lista de usuários.

4. **`getLikes()`**
   - Endpoint: `GET likes`.
   - Retorna os likes em formato de `ResponseWrapper`.

5. **`getMovies()`**
   - Endpoint: `GET movies`.
   - Retorna os filmes em formato de `ResponseWrapper`.

### **Função Auxiliar**
- **`createApiService(AuthService authService)`**
  - Configura o serviço da API com intercepções e autenticação.

</details>

<details>
<summary><strong>auth_interceptor.dart</strong></summary>

### **Descrição**
Gerencia a interceptação de requisições HTTP para adicionar tokens de autenticação e UID do usuário aos cabeçalhos.

### **Dependências**
- **`Dio`**: Para intercepção e manipulação de requisições.
- **`AuthService`**: Serviço para recuperar tokens e UID.

### **Funções**
1. **`onRequest(RequestOptions options, RequestInterceptorHandler handler)`**
   - Adiciona o token JWT e o UID aos cabeçalhos das requisições.
   - Emite logs sobre o sucesso ou falha da operação.

2. **`setupDio(AuthService authService)`**
   - Configura o cliente `Dio` com:
     - **`AuthInterceptor`**: Para gerenciar autenticação.
     - Interceptores adicionais para log de requisições, respostas e erros.

### **Logs**
- Mostra os detalhes da requisição (URI).
- Exibe o status das respostas.
- Aponta erros com código de status (se disponível).

</details>

---

### **Resumo**

Os services centralizam a lógica de comunicação com o backend, fornecendo:
1. Métodos para realizar operações em endpoints da API.
2. Interceptores para gerenciar autenticação e log de requisições.
3. Uma configuração padrão (`setupDio`) para consistência e facilidade de uso em diferentes partes do aplicativo.


## 📄 **Documentação de `presentation/pages`**

A pasta **`presentation/pages`** contém as páginas principais do aplicativo. Cada arquivo representa uma tela da interface do usuário.

## **Arquivos**

<details>
<summary><strong>change_password.dart</strong></summary>

### **Descrição**
Tela de mudança de senha, onde o usuário pode alterar sua senha atual.

### **Funcionalidades**
- Input para senha atual.
- Inputs para nova senha e confirmação.
- Botão para confirmar a atualização.

</details>

<details>
<summary><strong>complete_profile_page.dart</strong></summary>

### **Descrição**
Tela para completar o perfil do usuário durante o registro.

### **Funcionalidades**
- Escolha de imagem de perfil.
- Input para nome de usuário.
- Botão para finalizar o registro.

</details>

<details>
<summary><strong>edit_profile.dart</strong></summary>

### **Descrição**
Tela para editar as informações do perfil do usuário.

### **Funcionalidades**
- Inputs para modificar informações pessoais.
- Botão para salvar alterações.

</details>

<details>
<summary><strong>forgot_password.dart</strong></summary>

### **Descrição**
Tela de recuperação de senha, onde o usuário pode solicitar instruções para redefinir sua senha.

### **Funcionalidades**
- Input para e-mail.
- Botão para enviar as instruções de recuperação.

</details>

<details>
<summary><strong>home_page.dart</strong></summary>

### **Descrição**
Tela inicial do aplicativo, onde os usuários podem explorar os filmes disponíveis atualmente.

### **Funcionalidades**
- Listagem de filmes em cartaz com informações como título, categoria, sinopse e imagem.
- Personalização do plano de fundo com gradiente dinâmico.
- Navegação para a página de perfil ao clicar no avatar do usuário.
- Indicador de carregamento exibido enquanto os dados dos filmes são carregados.

### **Componentes**
- **CustomAppBar**: Exibe a barra de navegação superior com o avatar do usuário.
- **MovieCard**: Componente visual para exibir os detalhes de cada filme na lista.

</details>

<details>
<summary><strong>instructions_page.dart</strong></summary>

### **Descrição**
Tela que exibe instruções para o usuário após a execução de uma ação, como o envio de e-mail para redefinição de senha.

</details>

<details>
<summary><strong>login_page.dart</strong></summary>

### **Descrição**
Tela de login do aplicativo.

### **Funcionalidades**
- Inputs para e-mail e senha.
- Botões para login com Google, Apple, ou criação de nova conta.

</details>

<details>
<summary><strong>profile_page.dart</strong></summary>

### **Descrição**
Tela de visualização do perfil do usuário.

### **Funcionalidades**
- Exibição de informações pessoais.
- Opção para editar o perfil.

</details>

<details>
<summary><strong>splash_page.dart</strong></summary>

### **Descrição**
Tela de splash exibida ao iniciar o aplicativo.

### **Funcionalidades**
- Exibição do logotipo ou animação de carregamento enquanto o app é inicializado.

</details>

<details>
<summary><strong>welcome_back.dart</strong></summary>

### **Descrição**
Tela de boas-vindas para usuários que já possuem uma conta.

### **Funcionalidades**
- Inputs para login.
- Link para redefinição de senha.

</details>


---

## 🎨 **Documentação de `presentation/styles`**

A pasta **`presentation/styles`** é responsável por centralizar o estilo e temas utilizados no aplicativo, garantindo uma identidade visual consistente e personalizada para todos os componentes.

---

## **Arquivos**

<details>
<summary><strong>custom_page_transitions.dart</strong></summary>

### **Descrição**
Este arquivo define um **PageTransitionsBuilder** personalizado para criar transições de página suaves utilizando um **FadeTransition**.

### **Funcionalidades**
- Fornece animação de transição de página com efeito de desvanecimento.
- Substitui os padrões de transições do Flutter para Android e iOS.

### **Principais Métodos**
- **`buildTransitions`**: Constrói a transição personalizada com animação.

</details>

<details>
<summary><strong>app_theme.dart</strong></summary>

### **Descrição**
Este arquivo define a estrutura do tema principal do aplicativo, incluindo cores, estilos de texto, bordas e configurações de entrada.

### **Funcionalidades**
- **Definição de cores principais**:
  - **`primaryColor`**: Roxo (cor primária do app).
  - **`backgroundColor`**: Preto (cor do fundo).
  - **`inputFieldBackground`**: Cor do campo de entrada.
  - **`borderColor`**: Cinza para bordas dos campos.
  - **`textColor`**: Branco para textos principais.
  - **`labelColor`**: Cinza para rótulos e ícones.

- **Customização de campos de entrada**:
  - **`inputDecoration`**: Método que retorna o estilo dos campos de entrada com suporte para ícones personalizados (SVG).

- **Definição do tema geral**:
  - Usa o **GoogleFonts** para definir fontes personalizadas.
  - Personaliza o estilo de entrada com **bordas arredondadas**, **cores preenchidas** e **ícones**.
  - Configura transições de páginas com o **CustomPageTransitionsBuilder**.

### **Componentes**
- **`inputDecoration`**: Gera o estilo para campos de entrada.
- **`themeData`**: Configuração do tema principal do aplicativo.

</details>
---

## 🧩 **Documentação da Pasta: `presentation/widgets`**

A pasta **`presentation/widgets`** contém os componentes reutilizáveis e modulares do aplicativo. Esses widgets encapsulam funcionalidades e estilos específicos para manter a consistência e facilitar a manutenção.

---

## **Arquivos**

<details>
<summary><strong>action_button.dart</strong></summary>

### **Descrição**
Um botão personalizado para executar ações rápidas, como avaliar ou interagir com filmes.

### **Funcionalidades**
- Suporta texto e ícones.
- Personalizável com cor e estilo.

</details>

<details>
<summary><strong>custom_app_bar.dart</strong></summary>

### **Descrição**
Um AppBar personalizado que inclui o avatar do usuário e outras opções de navegação.

### **Funcionalidades**
- Mostra o avatar do usuário.
- Personalizável para exibir diferentes itens no AppBar.

</details>

<details>
<summary><strong>custom_button.dart</strong></summary>

### **Descrição**
Um botão flexível que suporta estilos de botão de texto e botão preenchido.

### **Funcionalidades**
- Opção de botão preenchido ou botão de texto.
- Suporta diferentes tamanhos de fonte e cores.

</details>

<details>
<summary><strong>custom_icon_button.dart</strong></summary>

### **Descrição**
Um botão icônico personalizado para ações rápidas.

### **Funcionalidades**
- Aceita ícones SVG.
- Personalizável em tamanho e cor.

</details>

<details>
<summary><strong>custom_list_tile.dart</strong></summary>

### **Descrição**
Um widget de listagem personalizado para exibir informações estruturadas.

### **Funcionalidades**
- Inclui título, subtítulo e ícone.
- Pode ser usado em listas ou menus.

</details>

<details>
<summary><strong>custom_text_field.dart</strong></summary>

### **Descrição**
Um campo de entrada personalizado com suporte para ícones e validação.

### **Funcionalidades**
- Suporte para ícones SVG como prefixo ou sufixo.
- Estilo consistente com o tema do aplicativo.

</details>

<details>
<summary><strong>divider_with_text.dart</strong></summary>

### **Descrição**
Um divisor estilizado com texto centralizado.

### **Funcionalidades**
- Facilita a separação visual de seções no layout.
- Inclui suporte para texto descritivo no centro.

</details>

<details>
<summary><strong>generic_text_button.dart</strong></summary>

### **Descrição**
Um botão de texto genérico e reutilizável.

### **Funcionalidades**
- Fácil de estilizar com texto e ação personalizada.

</details>

<details>
<summary><strong>gradient_Image_Card.dart</strong></summary>

### **Descrição**
Um cartão com imagem de fundo e gradiente aplicado.

### **Funcionalidades**
- Ideal para exibir miniaturas de filmes com estilo elegante.
- Suporte para sobreposições de gradiente.

</details>

<details>
<summary><strong>horizontal_carousel.dart</strong></summary>

### **Descrição**
Um carrossel horizontal para navegação de conteúdo.

### **Funcionalidades**
- Navegação de itens horizontalmente.
- Altamente personalizável para diferentes tipos de conteúdo.

</details>

<details>
<summary><strong>movie_card.dart</strong></summary>

### **Descrição**
Um cartão de filme detalhado com informações como título, gênero e sinopse.

### **Funcionalidades**
- Exibe informações do filme com imagem e descrição.
- Inclui contador de comentários e status de disponibilidade.

</details>

<details>
<summary><strong>profile_image_picker.dart</strong></summary>

### **Descrição**
Um widget que permite selecionar ou exibir a imagem de perfil do usuário.

### **Funcionalidades**
- Suporta seleção de imagem via galeria ou câmera.
- Exibe a imagem do perfil com opção de editar.

</details>

<details>
<summary><strong>rate_widget.dart</strong></summary>

### **Descrição**
Um widget para avaliar filmes com diferentes níveis de apreciação.

### **Funcionalidades**
- Oferece opções de "like", "not like" e "super like".
- Inclui animações e efeitos visuais.

</details>

<details>
<summary><strong>share_button.dart</strong></summary>

### **Descrição**
Um botão para compartilhar conteúdos como filmes ou links.

### **Funcionalidades**
- Suporte para diferentes plataformas de compartilhamento.
- Personalizável em cor e tamanho.

</details>

<details>
<summary><strong>simple_button.dart</strong></summary>

### **Descrição**
Um botão simples e leve para interações básicas.

### **Funcionalidades**
- Rápido de estilizar para ações simples.
- Adequado para cenários onde botões complexos não são necessários.

</details>

---

## 🔄 **Documentação da Pasta: state**

A pasta **`state`** é responsável por gerenciar os estados reativos do aplicativo, utilizando a biblioteca **MobX** para implementar a reatividade. Ela contém tanto estados globais quanto estados específicos para funcionalidades, encapsulando a lógica de estado de forma modular.

---

## **Estrutura da Pasta**

### **Arquivos**

#### **movie/rating_store.dart**

<details>
<summary><strong>Descrição</strong></summary>

O arquivo **`rating_store.dart`** é responsável por gerenciar o estado relacionado às avaliações dos filmes.

### **Funcionalidades**
- Gerencia o estado da avaliação selecionada pelo usuário (ex.: "like", "not like", "super like").
- Permite limpar ou redefinir a avaliação.

### **Principais Métodos**
- **`setRating(String rating)`**: Define a avaliação selecionada.
- **`clearRating()`**: Limpa a avaliação atual, retornando ao estado inicial.

</details>

---

#### **gradient_store.dart**

<details>
<summary><strong>Descrição</strong></summary>

O arquivo **`gradient_store.dart`** gerencia a lógica para gerar gradientes de fundo dinâmicos baseados nas cores dominantes de uma imagem.

### **Funcionalidades**
- Gera um gradiente linear com base em uma imagem fornecida.
- Reage dinamicamente a alterações na imagem de entrada.

### **Principais Métodos**
- **`generateGradient(String imageUrl)`**: 
  - Analisa as cores dominantes, vibrantes e suaves da imagem.
  - Gera um gradiente linear que transita entre essas cores.
- Gerenciamento de gradientes:
  - Cores incluem transparência e transições suaves para criar uma experiência visual rica.

### **Exemplo de Uso**
Pode ser utilizado para definir o plano de fundo da página inicial ou de detalhes de um filme, criando um layout visualmente dinâmico.

</details>

---

### 📬 Se precisar de mais informações ou ajustes nesta documentação, entre em contato!

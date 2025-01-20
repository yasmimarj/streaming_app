import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:untold/core/services/auth_service.dart';
import 'package:untold/data/models/app_user.dart';
import 'package:untold/data/models/movie.dart';
import 'package:untold/data/services/api_service.dart';
import 'package:untold/data/repositories/movie_repository.dart';
import 'package:untold/data/services/dio_config.dart';
import 'package:untold/presentation/pages/profile_page.dart';
import 'package:untold/presentation/widgets/custom_app_bar.dart';
import 'package:untold/presentation/widgets/movie_card.dart';
import 'package:untold/state/gradient_store.dart';

class HomePage extends StatefulWidget {
  final AppUser? user;

  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AuthService authService;
  late MovieRepository _movieRepository;
  final GradientStore gradientStore = GradientStore();
  List<Movie> _movies = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    authService = AuthService();
    final dio = setupDio(authService);
    final apiService = ApiService(dio);
    _movieRepository = MovieRepository(apiService);
    _fetchMovies();
  }

  Future<void> _fetchMovies() async {
    try {
      final movies = await _movieRepository.fetchMovies();
      if (movies.isNotEmpty) {
        await gradientStore.generateGradient(
          'https://m.media-amazon.com/images/M/MV5BYWMzNTU1NjEtNDI0ZS00YWQyLWFkMzktYTY4ZDY4OGM2Yjg2XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
        );
      }
      setState(() {
        _movies = movies;
        _isLoading = false;
      });
    } catch (e) {
      print("Erro ao buscar filmes: $e");
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      body: Observer(
        builder: (_) => Container(
          decoration: BoxDecoration(
            gradient: gradientStore.backgroundGradient ??
                const LinearGradient(
                  colors: [
                    Color(0xFF000000),
                    Color.fromRGBO(156, 39, 176, 1),
                    Color.fromRGBO(59, 4, 69, 1),
                    Color(0x66000000),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
          ),
          child: Column(
            children: [
              CustomAppBar(
                userPhotoURL: widget.user?.photoURL,
                showUserAvatar: true,
                onAvatarTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(),
                    ),
                  );
                },
              ),
              Expanded(
                child: _isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.04),
                            child: Text(
                              'Now Showing',
                              style: TextStyle(
                                fontFamily: "Fieldwork",
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.05,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          ..._movies.map((movie) {
                            final attributes = movie.attributes;
                            return MovieCard(
                              title: attributes.name,
                              category: attributes.genre,
                              description: attributes.synopsis,
                              imageUrl:
                                  'https://m.media-amazon.com/images/M/MV5BYWMzNTU1NjEtNDI0ZS00YWQyLWFkMzktYTY4ZDY4OGM2Yjg2XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
                              commentsCount: 0,
                              availableUntil: attributes.end_date.toString(),
                            );
                          }).toList(),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

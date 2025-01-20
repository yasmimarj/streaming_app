import 'package:untold/data/models/movie.dart';
import 'package:untold/data/services/api_service.dart';

class MovieRepository {
  final ApiService apiService;

  MovieRepository(this.apiService);

  Future<List<Movie>> fetchMovies() async {
    try {
      final response = await apiService.getMovies();
      return response.data;
    } catch (e) {
      print("Erro ao buscar filmes: $e");
      return [];
    }
  }
}

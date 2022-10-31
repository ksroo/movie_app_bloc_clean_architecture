import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_recommendation_usecase.dart';

import '../../../core/error/failure.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movie>>> getNowPlaying();

  Future<Either<Failure, List<Movie>>> getPopular();

  Future<Either<Failure, List<Movie>>> getTopRated();


  Future<Either<Failure, MovieDetails>> getMovieDetails(MovieDetailsParameters parameters);


  Future<Either<Failure, List<Recommendation>>> getRecommendation(RecommendationParameters parameters);

}

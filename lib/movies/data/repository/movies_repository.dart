import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_recommendation_usecase.dart';

import '../datasource/remote/movie_remote_data_source.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlaying() async {
    final result = await baseMovieRemoteDataSource.getNowPlayingDataSource();
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    } on LocalDatabaseException catch (e) {
      return Left(LocalDataBaseFailure(e.meesage));
    }
  }
  
  @override
  Future<Either<Failure, List<Movie>>> getPopular()async {
   final result = await baseMovieRemoteDataSource.getPopularDataSource();
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    } on LocalDatabaseException catch (e) {
      return Left(LocalDataBaseFailure(e.meesage));
    }
  }
  
  @override
  Future<Either<Failure, List<Movie>>> getTopRated()async {
   final result = await baseMovieRemoteDataSource.getTopRatedDataSource();
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    } on LocalDatabaseException catch (e) {
      return Left(LocalDataBaseFailure(e.meesage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(MovieDetailsParameters parameters) async{
    final result = await baseMovieRemoteDataSource.getMovieDetails(parameters);
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    } on LocalDatabaseException catch (e) {
      return Left(LocalDataBaseFailure(e.meesage));
    }
  }
  
  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(RecommendationParameters parameters) async{
  final result = await baseMovieRemoteDataSource.getRecommendation(parameters);
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    } on LocalDatabaseException catch (e) {
      return Left(LocalDataBaseFailure(e.meesage));
    }
  }


 
  
}

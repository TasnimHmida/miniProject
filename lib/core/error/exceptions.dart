class ServerException implements Exception{

}
class AuthServerException implements Exception{
  final String message;
  AuthServerException({required this.message});
}

class OfflineException implements Exception{}
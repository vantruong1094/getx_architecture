
class ErrorResponse {
   int statusCode;
   String message;

  ErrorResponse({this.statusCode, this.message});

   ErrorResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json["status_code"] as int;
    message = json["status_message"] as String;
  }
}
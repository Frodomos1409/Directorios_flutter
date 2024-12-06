import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;
  ApiService._internal();

  final String baseUrl = 'http://localhost:5000/api'; // Cambia según el entorno
  String? _authToken; // Token para autenticación (si es necesario)

  void setAuthToken(String token) {
    _authToken = token;
  }

  Map<String, String> _defaultHeaders() {
    return {
      'Content-Type': 'application/json',
      if (_authToken != null) 'Authorization': 'Bearer $_authToken',
    };
  }

  // **Registrar federación**
  Future<Map<String, dynamic>> createFederation(Map<String, dynamic> federationData) async {
    return _post('/federations', federationData);  // Se asume que la ruta es '/federations'
  }

  // **Registrar institución**
  Future<Map<String, dynamic>> createInstitution(Map<String, dynamic> institutionData) async {
    return _post('/institutions', institutionData);  // Se asume que la ruta es '/institutions'
  }

  // **Registrar usuario**
  Future<Map<String, dynamic>> createUser(Map<String, dynamic> userData) async {
    return _post('/users', userData);
  }

  // **Login de usuario**
  Future<Map<String, dynamic>> loginUser(String email, String password) async {
    return _post('/users/login', {'email': email, 'password': password});
  }

  // **Editar usuario**
  Future<Map<String, dynamic>> editUser(String id, Map<String, dynamic> userData) async {
    return _put('/users/$id', userData);
  }

  // **Eliminar usuario**
  Future<bool> deleteUser(String id) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/users/$id'),
        headers: _defaultHeaders(),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Error al eliminar usuario: ${_handleError(response)}');
      }
    } catch (error) {
      throw Exception('Error de conexión al eliminar usuario: $error');
    }
  }

  // **Obtener todos los usuarios**
  Future<List<Map<String, dynamic>>> getUsers() async {
    final response = await _get('/users');
    
    if (response is List) {
      return List<Map<String, dynamic>>.from(response);
    } else {
      throw Exception('La respuesta no es una lista de usuarios');
    }
  }

  // **Métodos auxiliares para solicitudes**
  Future<Map<String, dynamic>> _post(String path, Map<String, dynamic> body) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl$path'),
        headers: _defaultHeaders(),
        body: json.encode(body),
      );
      return _handleResponse(response);
    } catch (error) {
      throw Exception('Error de conexión: $error');
    }
  }

  Future<Map<String, dynamic>> _put(String path, Map<String, dynamic> body) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl$path'),
        headers: _defaultHeaders(),
        body: json.encode(body),
      );
      return _handleResponse(response);
    } catch (error) {
      throw Exception('Error de conexión: $error');
    }
  }

  Future<dynamic> _get(String path) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl$path'),
        headers: _defaultHeaders(),
      );
      return _handleResponse(response);
    } catch (error) {
      throw Exception('Error de conexión: $error');
    }
  }

  // **Manejador de respuestas**
  dynamic _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final body = json.decode(response.body);
      
      // Si la respuesta es una lista, la retornamos directamente
      if (body is List) {
        return body;
      } else {
        return body;  // Si no es lista, se devuelve el cuerpo como mapa
      }
    } else {
      throw Exception(_handleError(response));
    }
  }

  String _handleError(http.Response response) {
    try {
      final errorBody = json.decode(response.body);
      return errorBody['message'] ?? 'Error desconocido';
    } catch (e) {
      return response.body.isNotEmpty ? response.body : 'Error desconocido';
    }
  }
}

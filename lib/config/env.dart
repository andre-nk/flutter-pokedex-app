import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static final apiUrl = DotEnv().env['API_URL'] ?? '';

  static final dominantImageAccessToken = DotEnv().env['DOMINANT_IMAGE_ACCESS_TOKEN'] ?? '';
}

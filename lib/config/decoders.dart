import '/app/controllers/result_controller.dart';
import '/app/controllers/word_controller.dart';
import '/app/models/course.dart';
import '/app/models/lesson.dart';
import '/app/models/word.dart';
import '/app/controllers/home_controller.dart';
import '/app/models/user.dart';
import '/app/networking/api_service.dart';

/* Model Decoders
|--------------------------------------------------------------------------
| Model decoders are used in 'app/networking/' for morphing json payloads
| into Models.
|
| Learn more https://nylo.dev/docs/5.20.0/decoders#model-decoders
|-------------------------------------------------------------------------- */

final Map<Type, dynamic> modelDecoders = {
  List<User>: (data) => List.from(data).map((json) => User.fromJson(json)).toList(),
  User: (data) => User.fromJson(data),

  List<Word>: (data) => List.from(data).map((json) => Word.fromJson(json)).toList(),
  Word: (data) => Word.fromJson(data),

  List<Lesson>: (data) => List.from(data).map((json) => Lesson.fromJson(json)).toList(),

  Lesson: (data) => Lesson.fromJson(data),

  List<Course>: (data) => List.from(data).map((json) => Course.fromJson(json)).toList(),

  Course: (data) => Course.fromJson(data),
};

/* API Decoders
| -------------------------------------------------------------------------
| API decoders are used when you need to access an API service using the
| 'api' helper. E.g. api<MyApiService>((request) => request.fetchData());
|
| Learn more https://nylo.dev/docs/5.20.0/decoders#api-decoders
|-------------------------------------------------------------------------- */

final Map<Type, dynamic> apiDecoders = {
  ApiService: () => ApiService(),

  // ...
};


/* Controller Decoders
| -------------------------------------------------------------------------
| Controller are used in pages.
|
| Learn more https://nylo.dev/docs/5.20.0/controllers
|-------------------------------------------------------------------------- */
final Map<Type, dynamic> controllers = {
  HomeController: () => HomeController(),
  WordController: () => WordController(),
  ResultController: () => ResultController(),
};


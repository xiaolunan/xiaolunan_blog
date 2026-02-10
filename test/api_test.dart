import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:xiaolunan_blog/config/api_config.dart';

void main() {
  group('API GET 请求测试', () {
    late Dio dio;

    setUp(() {
      dio = ApiConfig.createDio();
    });

    test('测试基础 GET 请求', () async {
      try {
        final response = await dio.get('/api/test');

        expect(response.statusCode, equals(200));
        expect(response.data, isNotNull);
      } on DioException catch (e) {
        fail('请求失败: ${e.message}');
      }
    });

    test('测试带查询参数的 GET 请求', () async {
      try {
        final response = await dio.get(
          '/api/articles',
          queryParameters: {
            'page': 1,
            'size': 10,
          },
        );

        expect(response.statusCode, equals(200));
        expect(response.data, isNotNull);
      } on DioException catch (e) {
        fail('请求失败: ${e.message}');
      }
    });

    test('测试 GET 请求超时处理', () async {
      dio.options.connectTimeout = const Duration(milliseconds: 1);

      expect(
        () async => await dio.get('/api/slow-endpoint'),
        throwsA(isA<DioException>()),
      );
    });
  });
}

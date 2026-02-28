import 'package:dio/dio.dart';
import '../constants.dart';
import '../models/response_result.dart';
import 'network_service.dart';

class UploadApi {
  /// 专门针对第三方图床的上传函数
  Future<ResponseResult> uploadImageToThirdParty({
    required String filePath,
    required String apiKey,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        'key': apiKey,
        'image': await MultipartFile.fromFile(filePath),
      });

      // 直接使用 dio 请求，不走通用的 _post，因为结构不一致
      final response = await dio.post(
        '${Constants.imgbbUrl}/1/upload', // 上传路径
        data: formData,
      );

      // 获取原始 JSON 数据
      final rawData = response.data;

      // --- 数据转换逻辑 ---
      // 将第三方格式转换为你的 ResponseResult 格式
      if (rawData['success'] == true || rawData['status'] == 200) {
        return ResponseResult(
          isSuccess: true,
          code: rawData['status'] ?? 200,
          message: '上传成功',
          data: rawData['data'], // 这里保留了包含 url, display_url 等原始信息的 Map
        );
      } else {
        return ResponseResult(
          isSuccess: false,
          code: rawData['status'] ?? 500,
          message: '上传失败',
        );
      }
    } on DioException catch (e) {
      return ResponseResult(
        isSuccess: false,
        message: '网络错误: ${e.message}',
        code: -1,
      );
    } catch (e) {
      return ResponseResult(isSuccess: false, message: '转换错误: $e', code: -2);
    }
  }
}

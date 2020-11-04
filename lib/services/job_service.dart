import 'package:dio/dio.dart';
import 'package:nebula/core/models/job.dart';
import 'package:nebula/core/networker.dart';
import 'package:nebula/core/utils/n_exception.dart';

class JobService {
  Future<List<Job>> getJobs({String filters = ""}) async {
    try {
      final String uri = filters.isEmpty ? "/positions.json" : "/positions.json?$filters";
      Response response = await worker.get(uri);
      return List<Job>.from(((response.data) as List).map((json) {
        return Job.fromJson(json);
      }));
    } on DioError catch (e) {
      throw new NException(e);
    }
  }
}

final JobService jobService = JobService();
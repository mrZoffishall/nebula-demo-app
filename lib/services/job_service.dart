import 'package:dio/dio.dart';
import 'package:nebula/core/networker.dart';
import 'package:nebula/models/job.dart';
import 'package:nebula/utils/n_exception.dart';

class JobService {
  Future<List<Job>> getJobs({String filters}) async {
    try {
      Response response = await worker.get("/positions.json?$filters");
      return List<Job>.from(((response.data) as List).map((json) {
        return Job.fromJson(json);
      }));
    } on DioError catch (e) {
      throw new NException(e);
    }
  }
}

final JobService jobService = JobService();
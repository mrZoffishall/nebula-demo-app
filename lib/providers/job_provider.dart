import 'package:dartz/dartz.dart';
import 'package:nebula/models/job.dart';
import 'package:nebula/providers/base_provider.dart';
import 'package:nebula/services/job_service.dart';
import 'package:nebula/utils/n_exception.dart';

class JobProvider extends BaseProvider {
  Either<NException, List<Job>> jobList = Right([]);

  int page = 1;

  getJobList({Map<String, dynamic> filters}) {
    this.toggleLoadingState();
    jobService.getJobs(filters: this.getFilterStringFromMap(filters)).then((jobs) {
      jobList = Right(jobs);
      this.toggleLoadingState();
    }).catchError((error) {
      jobList = Left(error);
      this.toggleLoadingState();
    });
  }

  getFilterStringFromMap(Map<String, dynamic> filters) {
    String filterString = "";
    if (filters != null)
      filters.forEach((key, value) {
        filterString += "$key=$value&";
      });
    return filterString;
  }
}

package paincare.dao;

import java.util.List;

import paincare.entities.PainReportEntity;

public interface PainReportDao {
	 void addPainReport(PainReportEntity painReport);
	 List<PainReportEntity> getPainReportsByUserId(int userId);
}

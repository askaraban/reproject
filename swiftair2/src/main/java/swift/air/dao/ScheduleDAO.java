package swift.air.dao;

import java.util.List;
import java.util.Map;

import swift.air.dto.Schedule;

public interface ScheduleDAO {
	int insertSchedule(Schedule schedule);
	int updateSchedule(Schedule schedule);
	int deleteSchedule(String scheduleId);
	Schedule selectSchedule(String scheduleId);
	Schedule selectScheduleByFlight(String scheduleFlight);
	int selectScheduleCount();
	List<Schedule> selectScheduleList(Map<String, Object> map);
	List<Schedule> sList(
			String routeDeparture
			, String routeDestination
			, String scheduleDepartureDate
			, String scheduleArrivalDate);
	int scheduleCount1(String routeDeparture
			, String routeDestination
			, String scheduleDepartureDate
			, String scheduleArrivalDate);
	int scheduleCount2(String routeDeparture
			, String routeDestination
			, String scheduleDepartureDate
			, String scheduleArrivalDate);
	
	// 돌아가는편 스케쥴DAO
	Schedule arrivalSchedule(String routeDeparture, String routeDestination);
}
package swift.air.mapper;

import java.util.List;
import java.util.Map;

import swift.air.dto.Schedule;

public interface ScheduleMapper {
	int insertSchedule(Schedule schedule);
	int updateSchedule(Schedule schedule);
	int deleteSchedule(String scheduleId);
	Schedule selectSchedule(String scheduleId);
	Schedule selectScheduleByFlight(String scheduleFlight);
	int selectScheduleCount();
	List<Schedule> selectScheduleList(Map<String, Object> map);
	List<Schedule> findSchedule(
			String routeDeparture
			, String routeDestination
			, String scheduleDepartureDate
			, String scheduleArrivalDate);
	int scheduleCount1(String routeDeparture
			, String routeDestination
			, String scheduleDepartureDate);
	int scheduleCount2(String routeDeparture
			, String routeDestination
			, String scheduleDepartureDate);
	
	// 돌아가는 편 스케쥴
	Schedule arrivalSchedule(String routeDeparture, String routeDestination);
}
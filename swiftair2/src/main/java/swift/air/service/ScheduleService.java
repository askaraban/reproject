package swift.air.service;

import java.util.List;
import java.util.Map;

import swift.air.dto.Schedule;


public interface ScheduleService {
	void addSchedule(Schedule schedule);
	void modifySchedule(Schedule schedule);
	void removeSchedule(String scheduleId);
	Schedule getSchedule(String scheduleId);
	Map<String, Object> getScheduleList(int pageNum);
	Map<String, Object> getList(
			String routeDeparture
			, String routeDestination
			, String scheduleDepartureDate
			, String scheduleArrivalDate);
	
	Schedule endSchedule(String routeDeparture, String routeDestination);
}
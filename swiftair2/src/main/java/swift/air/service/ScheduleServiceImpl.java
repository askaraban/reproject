package swift.air.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import swift.air.dao.ScheduleDAO;
import swift.air.dto.Schedule;
import swift.air.util.Pager;

@Service
@RequiredArgsConstructor
public class ScheduleServiceImpl implements ScheduleService{
	private final ScheduleDAO scheduleDAO;

	@Override
	public void addSchedule(Schedule schedule) {
            scheduleDAO.insertSchedule(schedule);
    }
	
	@Override
	public void modifySchedule(Schedule schedule) {
		scheduleDAO.updateSchedule(schedule);
	}
	
	@Override
	public void removeSchedule(String scheduleId) {
		scheduleDAO.deleteSchedule(scheduleId);
	}

	@Override
	public Schedule getSchedule(String scheduleId) {
		return scheduleDAO.selectSchedule(scheduleId);
	}

	@Override
	public Map<String, Object> getScheduleList(int pageNum) {
		int totalSize=scheduleDAO.selectScheduleCount();
		
		Pager pager=new Pager(pageNum, totalSize, 10, 5);
		
		Map<String, Object> pageMap=new HashMap<String, Object>();
		pageMap.put("startRow", pager.getStartRow());
		pageMap.put("endRow", pager.getEndRow());
		
		List<Schedule> scheduleList=scheduleDAO.selectScheduleList(pageMap);
		
		Map<String, Object> resultMap=new HashMap<String, Object>();
		resultMap.put("pager", pager);
		resultMap.put("scheduleList", scheduleList);
		
		return resultMap;
	}

	@Override
	public Map<String, Object> getList(String routeDeparture, String routeDestination, String scheduleDepartureDate,
			String scheduleArrivalDate) {
		
		int ecoSeat = scheduleDAO.scheduleCount1(routeDeparture, routeDestination, scheduleDepartureDate, scheduleArrivalDate);
		int preSeat = scheduleDAO.scheduleCount2(routeDeparture, routeDestination, scheduleDepartureDate, scheduleArrivalDate);
		
		List<Schedule> sList = scheduleDAO.sList(routeDeparture, routeDestination, scheduleDepartureDate, scheduleArrivalDate);
		
		Map<String, Object> sMap = new HashMap<String, Object>();
		
		sMap.put("sList", sList);
		sMap.put("ecoSeat", ecoSeat);
		sMap.put("preSeat", preSeat);
		
		return sMap;
	}

	@Override
	public Schedule endSchedule(String routeDeparture, String routeDestination) {
		return scheduleDAO.arrivalSchedule(routeDeparture, routeDestination);
	}

	
}
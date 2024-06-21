package swift.air.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import swift.air.dto.Schedule;
import swift.air.mapper.ScheduleMapper;

@Repository
@RequiredArgsConstructor
public class ScheduleDAOImpl implements ScheduleDAO{
	private final SqlSession sqlSession;

	@Override
	public int insertSchedule(Schedule schedule) {
		return sqlSession.getMapper(ScheduleMapper.class).insertSchedule(schedule);
	}

	@Override
	public int updateSchedule(Schedule schedule) {
		return sqlSession.getMapper(ScheduleMapper.class).updateSchedule(schedule);
	}

	@Override
	public int deleteSchedule(String scheduleId) {
		return sqlSession.getMapper(ScheduleMapper.class).deleteSchedule(scheduleId);
	}

	@Override
	public Schedule selectSchedule(String scheduleId) {
		return sqlSession.getMapper(ScheduleMapper.class).selectSchedule(scheduleId);
	}

	@Override
	public Schedule selectScheduleByFlight(String scheduleFlight) {
		return sqlSession.getMapper(ScheduleMapper.class).selectScheduleByFlight(scheduleFlight);
	}

	@Override
	public int selectScheduleCount() {
		return sqlSession.getMapper(ScheduleMapper.class).selectScheduleCount();
	}

	@Override
	public List<Schedule> selectScheduleList(Map<String, Object> map) {
		return sqlSession.getMapper(ScheduleMapper.class).selectScheduleList(map);
	}

	@Override
	public List<Schedule> sList(String routeDeparture, String routeDestination, String scheduleDepartureDate,
			String scheduleArrivalDate) {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(ScheduleMapper.class).findSchedule(routeDeparture
				, routeDestination
				, scheduleDepartureDate
				, scheduleArrivalDate);
	}

	@Override
	public int scheduleCount1(String routeDeparture
			, String routeDestination
			, String scheduleDepartureDate
			, String scheduleArrivalDate) {
		return sqlSession.getMapper(ScheduleMapper.class).scheduleCount1(routeDeparture
				, routeDestination
				, scheduleDepartureDate);
	}

	@Override
	public int scheduleCount2(String routeDeparture
			, String routeDestination
			, String scheduleDepartureDate
			, String scheduleArrivalDate) {
		return sqlSession.getMapper(ScheduleMapper.class).scheduleCount2(routeDeparture
				, routeDestination
				, scheduleDepartureDate);
	}

	@Override
	public Schedule arrivalSchedule(String routeDeparture, String routeDestination) {
		return sqlSession.getMapper(ScheduleMapper.class).arrivalSchedule(routeDeparture, routeDestination);
	}

}
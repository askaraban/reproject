package swift.air.dto;

import lombok.Data;

/*
Name                    Null?    Type         
----------------------- -------- ------------ 
SCHEDULE_ID             NOT NULL VARCHAR2(20) 
SCHEDULE_DEPARTURE_DATE          DATE         
SCHEDULE_ARRIVAL_DATE            DATE         
SCHEDULE_FLIGHT                  VARCHAR2(20) 
SCHEDULE_ROUTE_ID                NUMBER   
 */

@Data
public class Schedule {
    private String scheduleId;
    private String scheduleDepartureDate;
    private String scheduleArrivalDate;
    private String scheduleFlight;
    private int scheduleRouteId;//노선번호
    
	private int routeId;
	private String routeDeparture;
	private String routeDestination;
	private String routeTime;
	private int routePrice;
	private String routeFlight;
	
	private String passengerSeatName; // 좌석번호
	
	private String seatGrade;
}
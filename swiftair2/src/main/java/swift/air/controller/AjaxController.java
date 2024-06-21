package swift.air.controller;

import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import swift.air.service.ScheduleService;

@RestController
@RequiredArgsConstructor
public class AjaxController {
	private final ScheduleService scheduleService;

	/*
	 @GetMapping(value = "/reservation/sList") 
	 public Map<String, Object> sList(
			 @RequestParam String routeDeparture
			 , @RequestParam String routeDestination
			 , @RequestParam String scheduleDepartureDate
			 , @RequestParam String scheduleArrivalDate) {
	  
	 return scheduleService.sList(routeDeparture
			 , routeDestination
			 , scheduleDepartureDate
			 , scheduleArrivalDate);
	 
	 }
	 */
	 @GetMapping(value = "/reservation/sList") 
	 public Map<String, Object> sList(
			 @RequestParam Map<String, Object> map) {
		 
		 return scheduleService.getList(
			 (String)map.get("routeDeparture")
			 , (String)map.get("routeDestination")
			 , (String)map.get("scheduleDepartureDate")
			 , (String)map.get("scheduleArrivalDate"));
	 }
	 

}

package swift.air.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import swift.air.dto.Event;
import swift.air.service.EventService;


@Controller
@Slf4j
@RequiredArgsConstructor
public class MainController {
	private final EventService eventService;
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(Model model) {
		List<Event> mainEventPage = eventService.getEventMainPage();
		model.addAttribute("mainEventList", mainEventPage);
		return "index";
	}
}

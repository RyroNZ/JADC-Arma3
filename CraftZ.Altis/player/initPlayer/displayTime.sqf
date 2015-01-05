	_hour = date select 3;
	_minute = date select 4;

	

	_amPmTime = switch (true) do {
		case (_hour < 12): {"am"}; // add am if before 12
		case (_hour >= 12): {"pm"}; // add pm if after 12
	};
	_minuteFormat = switch (true) do {
		case (_minute < 10): {"0" + (str _minute)}; //ie. 12:4 PM goes to 12:04 PM
		case (_minute >= 10): {str _minute}; //ie. 12:14 PM stays 12:14 PM
	};
	_hourFormat = switch (true) do {
		case (_hour > 12): {str (_hour-12)};// ie. 13:00 goes to 1:00
		case (_hour <= 12): {str _hour}; //ie. 7:00 stays 7:00
	};

	systemChat format["Time: %1:%2 %3", _hourFormat, _minuteFormat, _amPmTime];
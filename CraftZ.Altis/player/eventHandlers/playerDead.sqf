while {true} do
	{
		waitUntil {(!(alive player))};

		while {(!(alive player))} do
		{
			0 fadeSound 0;
			0 fadeRadio 0;
			0 fadeMusic 0;
			0 fadeSpeech 0;
			cutText ["You are dead.","BLACK FADED",0];
			sleep 0.01;
		};

		1.5 fadeSound 1;
		1.5 fadeRadio 1;
		1.5 fadeMusic 1;
		1.5 fadeSpeech 1;
		cutText ["You are dead.","BLACK IN",1.5];
	};
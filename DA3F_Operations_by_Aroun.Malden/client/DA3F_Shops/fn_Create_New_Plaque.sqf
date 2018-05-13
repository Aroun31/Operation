/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_Create_New_Plaque.sqf
*
*/
	private _plak = format ["%1 %2%3 %4",
	(100 + ceil(random 1000)),
	selectRandom["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"],
	selectRandom["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"],
	(10 + ceil(random 89))];
	_plak
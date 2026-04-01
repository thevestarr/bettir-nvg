params ["_unit", "_loadout"];

// would be nice if CBA gave us both old and new loadout to compare

_currentNvgItem = ((_loadout select 9) select 5);
_currentHeadgear = (_loadout select 6);

_prevNods = _unit getVariable ["BettIR_nvg_className", ""];

// this should prevent running too many checks on all loadout changes (e.g. mag change)
if (_prevNods == _currentNvg || _prevNods == _currentHeadgear) exitWith {};

// look for compatible items in the NVG slot
_currentNods = "";
if (_currentNvgItem != "") then {
	if ([_currentNvgItem] call BettIR_NVG_fnc_isCompatibleGear) then {
		_currentNods = _currentNvgItem;
	};
};

// if NVG slot is not compatible, check the headgear slot 
if (_currentNods == "" && _currentHeadgear != "") then {
	if ([_currentHeadgear] call BettIR_NVG_fnc_isCompatibleGear) then {
		_currentNods = _currentHeadgear;
	};
};

// had NODs, has no more NODs
if ((_currentNods == "") && (_prevNods != "")) exitWith {
	_isLightOn = _unit getVariable ["BettIR_nvg_illuminator_on", false];
	_unit setVariable ["BettIR_nvg_className", "", true]; // update the class globally

	// won't need the light if there's no compatible device anymore
	if (_isLightOn) then {
		["BettIR_NVG_Event_LightRemoved", [_unit]] call CBA_fnc_globalEvent; 
	};
};

// has new NODs so update, light should remove light to update offset and turn off the light
if ((_currentNods != "") && (_prevNods != _currentNods)) exitWith {
	_unit setVariable ["BettIR_nvg_className", _currentNods, true]; // update the class globally
	["BettIR_NVG_Event_LightRemoved", [_unit]] call CBA_fnc_globalEvent; 
};

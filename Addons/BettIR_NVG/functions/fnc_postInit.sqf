addMissionEventHandler ["EntityKilled", {
	params ["_unit"];
	// curious if _unit is stil available? To be tested
	if (_unit isKindOf "Man") then {
		if (local _unit) then {
			_unit setVariable ["BettIR_nvg_className", "", true]; // clear the class, removeLight doesn't do it
		};
		[_unit] call BettIR_NVG_fnc_removeLight;
	};
}];


if (!hasInterface) exitWith {};

BettIR_PLAYER = player;

// engine and CBA events
["unit", {
	BettIR_PLAYER = _this select 0;
}] call CBA_fnc_addPlayerEventHandler;

// add a handler for the nightvision change
["visionMode", {
    params ["_unit", "_newVisionMode", "_oldVisionMode"];

	// check if we're currently switching to/from nightvision
	_isNightvision = _newVisionMode != 0;
	// call the handler function
	["BettIR_NVG_Event_NVGToggled", [_unit, _isNightvision]] call CBA_fnc_globalEvent; 
}, true] call CBA_fnc_addPlayerEventHandler;

// on loadout change
['loadout', {
	// NOTE: Local
	_this call BettIR_NVG_fnc_onLoadoutUpdated; 
}] call CBA_fnc_addPlayerEventHandler;

// keybinds
// I genuinely wanted to get this new Keybind Framework to work but I can't
["BettIR", 'BettIR_ToggleGogglesIlluminator', 'Toggle Goggles Illuminator', {
    // toggle illuminator on/off
	[BettIR_Player] spawn BettIR_NVG_fnc_onIlluminatorToggleAction;

	true;
}, {false}, [0x31, [true, false, true]], false] call CBA_fnc_addKeybind;





// global event handlers
["BettIR_NVG_Event_IlluminatorToggled", {
	_this spawn BettIR_NVG_fnc_handleIlluminatorToggledEvent;
}] call CBA_fnc_addEventHandler;

["BettIR_NVG_Event_NVGToggled", {
	_this spawn BettIR_NVG_fnc_handleNVGToggledEvent;
}] call CBA_fnc_addEventHandler;

["BettIR_NVG_Event_LightRemoved", {
	_this call BettIR_NVG_fnc_removeLight;
}] call CBA_fnc_addEventHandler;


// handle JIP
{
	if (_x getVariable ["BettIR_nvg_illuminator_on", false]) then {
		[_x] call BettIR_NVG_fnc_createLight;
	};
} forEach allPlayers; // TODO: use allUnits when non-players can use BettIR too?

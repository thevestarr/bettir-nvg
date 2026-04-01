params ["_unit"];

// ACE arsenal, zeus
if (isNull _unit) exitWith {};

if (!(alive _unit)) exitWith {};
// remote-controlled units don't trigger CBA loadout and viewMode events,
// so are not supported at this moment
if (!(isPlayer _unit)) exitWith {};
// ensures the below conditions aren't run e.g. when user is looking through a vehicle's turret with nightvision
if ((cameraView != "INTERNAL") && (cameraView != "EXTERNAL")) exitWith {}; 

// using NODs? shouldn't really be able to toggle otherwise
if ((currentVisionMode _unit) == 0) exitWith {};
// has gear with nods?
// could be even more optimized by preventing re-running this check if loadout hasnt changed
_hasCompatibleGear = [_unit] call BettIR_NVG_fnc_hasCompatibleGear;
if (!_hasCompatibleGear) exitWith {};

_shouldBeOn = !(_unit getVariable ["BettIR_nvg_illuminator_on", false]);
_unit setVariable ["BettIR_nvg_illuminator_on", _shouldBeOn, true];

["BettIR_NVG_Event_IlluminatorToggled", [_unit, _shouldBeOn]] call CBA_fnc_globalEvent;

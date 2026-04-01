#include "..\common.hpp";

/**
    Created by Vestarr

    [!!] RUNS GLOBALLY VIA CBA GLOBAL EVENTS [!!]

	Keeps track of turning the IR lights on and off
	when players toggle their view mode (nightvision is enabled)
	
	Parameters: Array
		0 - _unit <OBJECT> - Unit to check
		1 - _isNightVision <BOOLEAN> - TRUE if the viewmode is nightvision, FALSE otherwise
	Returns:
		None

	Example: N/A, see postInit
 */


params ["_unit", "_isNightVision"];

_cachedNvgClass = _unit getVariable ["BettIR_nvg_className", ""];
_currentNvg = [_unit] call BettIR_NVG_fnc_getUnitNvgDevice;

// if no nods (or no compatible nods) are on the player, turn off the light but keep it for later use
// honestly I need to figure out why I even added this and the next condition below
if (_currentNvg == "") exitWith {
	if (local _unit) then {
		_unit setVariable ["BettIR_nvg_illuminator_on", false, true];
	};
	_light = _unit getVariable ["BettIR_nvg_illuminator", objNull];
	if (!(isNull _light)) then {
		_light setLightIntensity 0;
	};
};

// should always be true as _cachedNvgClass is updated with loadout event
// determines if the light should be on
if (_currentNvg == _cachedNvgClass) then {
	_hasIlluminatorOn = _unit getVariable ["BettIR_nvg_illuminator_on", false];
	_light = _unit getVariable ["BettIR_nvg_illuminator", objNull];

	// careful with that exitWith, it's only acceptable because it's the last statement in this file
	if (isNull _light) exitWith {};

	if (_hasIlluminatorOn && !_isNightVision) then {
		_light setLightIntensity 0;
	};
	
	if (_hasIlluminatorOn && _isNightVision) then {
		_light setLightIntensity BETTIR_DEFAULT_NVG_ILLUMINATOR_BRIGHTNESS;
	};
};

#include "..\common.hpp"

/**
    Created by Vestarr

    Toggles the NVG-mounted IR Illuminator (locally)
	
	Parameters: Array
		0 - _unit <OBJECT> - Unit which we're toggling it for
		1 - _toggleOn <BOOLEAN> - TRUE if should be turned on, FALSE otherwise
	Returns: None


	Example: ???
 */

params ['_unit', '_toggleOn'];

// no need to run when the user is not using nods
if ((currentVisionMode _unit) == 0) exitWith {};

_light = _unit getVariable ['BettIR_nvg_illuminator', objNull];

if (isNull _light) then {
	_light = [_unit] call BettIR_NVG_fnc_createLight;
} else {
	_light setLightIntensity (BETTIR_DEFAULT_NVG_ILLUMINATOR_BRIGHTNESS * (parseNumber _toggleOn));
};

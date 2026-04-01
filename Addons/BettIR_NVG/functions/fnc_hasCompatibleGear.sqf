/**
    Created by Vestarr

    Checks if unit has a compatible device (nightvision / helmet)
	
	Parameters: Array
		0 - _unit <OBJECT> - Unit to check
	Returns: true if has compatible gear, false otherwise


	Example:
        _isCompatible = [_unit] call BettIR_NVG_fnc_hasCompatibleGear;
        if (!isCompatible) exitWith {};
 */

params ["_unit"];

// this variable should be in sync, so first check it to avoid querying the config file
_cachedNVGDevice = _unit getVariable ["BettIR_nvg_className", ""];
if (_cachedNVGDevice != "" && ((hmd _unit) == _cachedNVGDevice || (headgear _unit) == _cachedNVGDevice)) exitWith { true };

_slot = [_unit] call BettIR_NVG_fnc_getUnitNvgSlot;
_slot != ""

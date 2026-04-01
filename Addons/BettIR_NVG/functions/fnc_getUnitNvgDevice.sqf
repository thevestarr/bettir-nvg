/**
    Created by Vestarr

    Returns the className of compatible NVG device in unit's inventory
	
	Parameters: Array
		0 - _unit <OBJECT> - Unit to check
	Returns: 


	Example:
        [_unit] call BettIR_NVG_fnc_getUnitNvgDevice;
 */

params ["_unit"];

_headgear = headgear _unit;
_hmd = hmd _unit;

_device = "";

_cachedNVGDevice = _unit getVariable ["BettIR_nvg_className", ""];
if (_cachedNVGDevice != "") then {
    if (_hmd == _cachedNVGDevice) exitWith {_device = _hmd};
	if (_headgear == _cachedNVGDevice) exitWith { _device = _headgear };
};

if (_device != "") exitWith { _device };

_slot = [_unit] call BettIR_NVG_fnc_getUnitNvgSlot;
if (_slot == "headgear") exitWith { _headgear };
if (_slot == "hmd") exitWith { _hmd };

""

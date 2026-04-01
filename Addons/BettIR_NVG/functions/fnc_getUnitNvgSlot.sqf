/**
    Created by Vestarr

    Checks if player's compatible night vision device is a NVG or headgear item
	
	Parameters: Array
		0 - _unit <OBJECT> - Unit to check
	Returns: "hmd" if NVG, "headgear" if helmet, empty string otherwise


	Example:
        [_unit] call BettIR_NVG_fnc_getUnitNvgSlot;
 */

 
params ["_unit"];

_slot = "";

// check the nvg unit first
_hmd = hmd _unit;
if (_hmd != "") then {
    if ([_hmd] call BettIR_NVG_fnc_isCompatibleGear) then {
        _slot = "hmd";
    };
};

// if not found, check headgear
if (_slot == "") then {
    _headgear = headgear _unit;
    if (_headgear != "") then {
        if ([_headgear] call BettIR_NVG_fnc_isCompatibleGear) then {
            _slot = "headgear";
        };
    };
};

_slot
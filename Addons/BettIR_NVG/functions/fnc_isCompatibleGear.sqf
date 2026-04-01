/**
    Created by Vestarr

    Checks if an item is compatible with BettIR
	
	Parameters: Array
		0 - _className <STRING> - Unit to check
	Returns: true if is compatible gear, false otherwise

	Example:
        _isCompatible = ["Some_ClassName"] call BettIR_NVG_fnc_isCompatibleGear;
        if (!isCompatible) exitWith {};
 */

params ["_className"];

_isFlaggedCompatible = (configFile >> "CfgWeapons" >> _className >> "BettIR_isCompatible") call BIS_fnc_getCfgDataBool;

if (!_isFlaggedCompatible) exitWith { false };

_visionModes = getArray (configFile >> "CfgWeapons" >> _className >> "visionMode");
(_visionModes find "NVG") != -1;

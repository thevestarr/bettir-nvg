#include "..\common.hpp"

params ["_unit"];

_isLightEnabled = _unit getVariable ["BettIR_nvg_illuminator_on", false];
_isUsingNods = (currentVisionMode _unit) != 0;

_shouldBeOn = _isLightEnabled && _isUsingNods;
// lights are local objects obviously
_light = "#lightreflector" createVehicleLocal [0,0,0];
// 5 degree tilt down, needs tweaking the value but it should not be pointing where the head is, rather a bit down where the eyes are
// _light setVectorDirAndUp ([[[0,1,0],[0,0,1]], -5, 0, 0] call BIS_fnc_transformVectorDirAndUp);
_light setLightIR true;
_light setLightIntensity (BETTIR_DEFAULT_NVG_ILLUMINATOR_BRIGHTNESS * (parseNumber _shouldBeOn)); // TODO: NVG parameter?
_light setLightColor [30,30,30]; // i wonder if color channels matter in IR lights but ok

// TODO: Make config-based
_light setLightAmbient [0,0,0]; // should be zero, otherwise illuminates the face and causes flicker
_light setLightConePars [85, 20, 2]; // idk, determined empirically so that it looks somewhat good

// below looks like shit, also unnecessary, but it's good for debug I guess
if (BETTIR_DEBUG) then {
	_light setLightUseFlare true;
	_light setLightFlareSize 0.15;
	_light setLightFlareMaxDistance 50;
};

// get the classname of nightvision device
_nvgClass = [_unit] call BettIR_NVG_fnc_getUnitNvgDevice;

// _offset = BettIR_NvgOffsetCache getOrDefault [_nvgClass, []];
_offset = getArray (configFile >> "CfgWeapons" >> _nvgClass >> "BettIR_offset");

if ((count _offset) == 0) then {
	// fallback value
	_offset = [BETTIR_DEFAULT_NVG_OFFSET_DUAL];
};

// the below will probably be controversial
// but attachTo is the only engine-friendly way without causing TOO MUCH flicker
_light attachTo [_unit, _offset, "head", true];
_unit setVariable ['BettIR_nvg_illuminator', _light, false];

_light

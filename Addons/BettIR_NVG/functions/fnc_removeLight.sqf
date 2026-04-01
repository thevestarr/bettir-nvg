params ["_unit"];

_light = _unit getVariable ['BettIR_nvg_illuminator', objNull];
if  (!(isNull _light)) then {
    deleteVehicle _light;
};

_unit setVariable ['BettIR_nvg_illuminator', objNull, false];
// no idea if this condition is still viable at this point (especially after disconnect)
// needs testing
if (local _unit) then {
    _unit setVariable ['BettIR_nvg_illuminator_on', false, true];
};

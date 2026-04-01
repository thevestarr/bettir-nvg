
class CfgPatches
{
	class BettIR_NVG_Compat_RHSAFRF
	{
		addonRootClass="BettIR_NVG";
		name="BettIR NVG Compatibility with RHS AFRF";
		units[]={};
		requiredVersion=2.14;
		requiredAddons[]={"BettIR_NVG", "rhsusf_c_weapons", "rhsusf_c_troops"};
		skipWhenMissingDependencies = 1;
	};
};

class CfgWeapons {
    class NVGoggles;
    class rhs_1PN138: NVGoggles {
        BettIR_isCompatible = 1;
        BettIR_offset[] = {-0.052,0.14,0.115};
    };
};


class CfgPatches
{
	class BettIR_NVG_Compat_RHSUSF
	{
		addonRootClass="BettIR_NVG";
		name="BettIR NVG Compatibility with RHS USF";
		units[]={};
		requiredVersion=2.14;
		requiredAddons[]={"BettIR_NVG", "rhsusf_c_weapons", "rhsusf_c_troops"};
		skipWhenMissingDependencies = 1;
	};
};

class CfgWeapons {
    class NVGoggles;
    class rhsusf_ANPVS_14: NVGoggles {
        BettIR_offset[] = {-0.059,0.12,0.12}; // the illuminator on the PVS-14 is surprisingly centered
    };
};


class CfgPatches
{
	class BettIR_NVG_Compat_USP
	{
		addonRootClass="BettIR_NVG";
		name="BettIR NVG Compatibility with USP";
		units[]={};
		requiredVersion=2.14;
		requiredAddons[]={"BettIR_NVG", "USP_Gear_NVG"};
        skipWhenMissingDependencies = 1;
	};
};

class CfgWeapons {
    class NVGoggles;
    class USP_PVS14: NVGoggles {
        BettIR_isCompatible = 1;
        BettIR_offset[] = {-0.105,0.125,0.095};
    };

    class USP_PVS14_WP: NVGoggles {
        BettIR_isCompatible = 1;
        BettIR_offset[] = {-0.105,0.125,0.095};
    };
};

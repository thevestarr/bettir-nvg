class CfgPatches
{
	class BettIR_NVG_Compat_CUP
	{
		addonRootClass="BettIR_NVG";
		name="BettIR NVG Compatibility with CUP";
		units[]={};
		requiredVersion=2.14;
		requiredAddons[]={"BettIR_NVG", "CUP_Weapons_NVG"};
        skipWhenMissingDependencies = 1;
	};
};

class CfgWeapons {
    // TODO: CUP_NVG_HMNVS? Where's the IR illuminator on this
    // also does anyone even use it
    
    class NVGoggles;
    class CUP_NVG_PVS14: NVGoggles {
        BettIR_isCompatible = 1;
        BettIR_offset[] = {-0.105,0.125,0.095}; // same eye, so same config as USP
    };

    class CUP_NVG_PVS7: NVGoggles {
        BettIR_isCompatible = 1;
        BettIR_offset[] = {-0.02,0.1,0.115};
    };

    class CUP_NVG_1PN138: NVGoggles {
        BettIR_isCompatible = 1;
        BettIR_offset[] = {0.03,0.13,0.115};
    };
};

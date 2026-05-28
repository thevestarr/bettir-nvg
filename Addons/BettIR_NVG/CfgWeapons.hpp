#include "common.hpp"

class CfgWeapons {
    class Binocular;
    class NVGoggles: Binocular {
        BettIR_isCompatible = 1;
        BettIR_offset[] = {BETTIR_DEFAULT_NVG_OFFSET_DUAL};
    };

    class H_HelmetB;
    class H_HelmetO_ViperSP_hex_F: H_HelmetB {
        BettIR_isCompatible = 1;
        BettIR_offset[] = {BETTIR_DEFAULT_NVG_OFFSET_DUAL};
    };
};

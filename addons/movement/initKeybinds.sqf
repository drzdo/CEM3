#define INPUT_MOUSE_SCROLL_UP	0xF8
#define INPUT_MOUSE_SCROLL_DOWN	0xF9
#define INPUT_MOUSE_SCROLL	0xF2
private _category = format ["CE: %1", localize LSTRING(Category)];

[
    _category,
    QGVAR(movementSpeedUp),
    [
        localize LSTRING(MovementSpeedUp),
        localize LSTRING(MovementSpeedUpTooltip)
    ],
    {
        /* If limping return max of 2 */
        if ((toUpper ((animationState cem_player) select [8,4])) isEqualTo "MLMP") exitWith {
            GVAR(speed) = (GVAR(speed) + 1) min 2;
            [] call cem_movement_fnc_updateEnvVolume;
        };
        GVAR(speed) = (GVAR(speed) + 1) min 7;
        [] call cem_movement_fnc_updateEnvVolume;
    },
    { },
    [
        INPUT_MOUSE_SCROLL_UP,
        [false, true, false]
    ]
] call CBA_fnc_addKeybind;

[
    _category,
    QGVAR(movementSpeedDown),
    [
        localize LSTRING(MovementSpeedDown),
        localize LSTRING(MovementSpeedDownTooltip)
    ],
    {
        GVAR(speed) = (GVAR(speed) - 1) max 0;
        [] call cem_movement_fnc_updateEnvVolume;
    },
    { },
    [
        INPUT_MOUSE_SCROLL_DOWN,
        [false, true, false]
    ]
] call CBA_fnc_addKeybind;

[
    _category,
    QGVAR(movementSpeedReset),
    [
        localize LSTRING(MovementSpeedReset),
        localize LSTRING(MovementSpeedResetTooltip)
    ],
    {
        if ((toUpper ((animationState cem_player) select [8,4])) isEqualTo "MLMP") exitWith {
            GVAR(speed) = 2;
            [] call cem_movement_fnc_updateEnvVolume;
        };
        GVAR(speed) = 7;
        [] call cem_movement_fnc_updateEnvVolume;
    },
    { },
    [
        INPUT_MOUSE_SCROLL,
        [false, true, false]
    ]
] call CBA_fnc_addKeybind;
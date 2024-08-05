------------------------------------------------- Data Refs ---------------------------------------
local parking_brake_ratio = XPLMFindDataRef('sim/cockpit2/controls/parking_brake_ratio')
local throttle_ratio = XPLMFindDataRef('sim/cockpit2/engine/actuators/throttle_ratio')
local engine_master_switch = XPLMFindDataRef('sim/cockpit2/engine/actuators/eng_master')
local engine1_start_lift = XPLMFindDataRef('laminar/A333/switches/engine1_start_lift')
local engine2_start_lift = XPLMFindDataRef('laminar/A333/switches/engine2_start_lift')

local battery_on_switch = XPLMFindDataRef('sim/cockpit2/electrical/battery_on')
local nav_light_switch = XPLMFindDataRef('laminar/a333/switches/nav_pos')
local emergency_exit_light_switch = XPLMFindDataRef('laminar/a333/switches/emer_exit_lt_pos')

local apu_master_switch = XPLMFindDataRef('laminar/A333/buttons/APU_master')
local apu_starter_switch = XPLMFindDataRef('sim/cockpit2/electrical/APU_starter_switch')
local apu_available = XPLMFindDataRef('sim/cockpit2/electrical/APU_running')
local apu_generator_on = XPLMFindDataRef('sim/cockpit2/electrical/APU_generator_on')

local electrical_galley_switch = XPLMFindDataRef('laminar/A333/buttons/galley_pos')
local electrical_commercial_power_switch = XPLMFindDataRef('laminar/A333/buttons/commercial_pos')

local pax_system_switch = XPLMFindDataRef('laminar/A333/buttons/pax_sys_pos')
local pax_satcom_switch = XPLMFindDataRef('laminar/A333/buttons/pax_satcom_pos')
local pax_ifec_system_switch = XPLMFindDataRef('laminar/A333/buttons/pax_IFEC_pos')

local ventilation_extract_switch = XPLMFindDataRef('laminar/A333/buttons/ventilation_extract_ovrd_pos')
local cabin_fans_switch = XPLMFindDataRef('laminar/A333/buttons/cabin_fan_pos')

local ir1_switch = XPLMFindDataRef('laminar/A333/buttons/adirs/ir1_pos')
local ir2_switch = XPLMFindDataRef('laminar/A333/buttons/adirs/ir2_pos')
local ir3_switch = XPLMFindDataRef('laminar/A333/buttons/adirs/ir3_pos')
local adr1_switch = XPLMFindDataRef('laminar/A333/buttons/adirs/adr1_pos')
local adr2_switch = XPLMFindDataRef('laminar/A333/buttons/adirs/adr2_pos')
local adr3_switch = XPLMFindDataRef('laminar/A333/buttons/adirs/adr3_pos')
local ir1_knob = XPLMFindDataRef('laminar/A333/buttons/adirs/ir1_knob_pos')
local ir2_knob = XPLMFindDataRef('laminar/A333/buttons/adirs/ir2_knob_pos')
local ir3_knob = XPLMFindDataRef('laminar/A333/buttons/adirs/ir3_knob_pos')

local fcc_turb_damp_switch = XPLMFindDataRef('laminar/A333/buttons/fcc_turb_damp_pos')
local fcc_prim1_switch = XPLMFindDataRef('laminar/A333/buttons/fcc_prim1_pos')
local fcc_prim2_switch = XPLMFindDataRef('laminar/A333/buttons/fcc_prim2_pos')
local fcc_prim3_switch = XPLMFindDataRef('laminar/A333/buttons/fcc_prim3_pos')
local fcc_sec1_switch = XPLMFindDataRef('laminar/A333/buttons/fcc_sec1_pos')
local fcc_sec2_switch = XPLMFindDataRef('laminar/A333/buttons/fcc_sec2_pos')

local elec_hyd_blue_switch = XPLMFindDataRef('laminar/A330/buttons/hyd/elec_blue_tog_pos')
local elec_hyd_green_switch = XPLMFindDataRef('laminar/A330/buttons/hyd/elec_green_tog_pos')
local elec_hyd_yellow_switch = XPLMFindDataRef('laminar/A330/buttons/hyd/elec_yellow_tog_pos')
local engine1_hyd_blue_switch = XPLMFindDataRef('laminar/A330/buttons/hyd/eng1_pump_blue_pos')
local engine1_hyd_green_switch = XPLMFindDataRef('laminar/A330/buttons/hyd/eng1_pump_green_pos')
local engine2_hyd_green_switch = XPLMFindDataRef('laminar/A330/buttons/hyd/eng2_pump_green_pos')
local engine2_hyd_yellow_switch = XPLMFindDataRef('laminar/A330/buttons/hyd/eng2_pump_yellow_pos')

local gear_handle_down = XPLMFindDataRef('sim/cockpit2/controls/gear_handle_down')
local flap_handle_ratio = XPLMFindDataRef('sim/cockpit2/controls/flap_handle_request_ratio')
local speedbrake_ratio = XPLMFindDataRef('sim/cockpit2/controls/speedbrake_ratio')

local crew_oxygen_switch = XPLMFindDataRef('laminar/A333/buttons/oxy/crew_valve_pos')

local gpws_system_switch = XPLMFindDataRef('laminar/A333/buttons/gpws/system_toggle_pos')
local gpws_gs_mode_switch = XPLMFindDataRef('laminar/A333/buttons/gpws/glideslope_toggle_pos')
local gpws_flap_mode_switch = XPLMFindDataRef('laminar/A333/buttons/gpws/flap_toggle_pos')
local gpws_terr_mode_switch = XPLMFindDataRef('laminar/A333/buttons/gpws/terrain_toggle_pos')

local seatbelt_light_switch = XPLMFindDataRef('laminar/A333/switches/fasten_seatbelts')
local no_smoking_light_switch = XPLMFindDataRef('laminar/A333/switches/no_smoking')

local transponder_auto_on_off_knob = XPLMFindDataRef('laminar/A333/transponder/auto_on_knob_pos')
local transponder_ta_ra_knob = XPLMFindDataRef('laminar/A333/transponder/ta_ra_knob_pos')

------------------------------------------------- checklist ---------------------------------------

local checklist = {{
    name = 'PARKING BRAKE',
    value = 'ON',
    completed = function()
        return XPLMGetDataf(parking_brake_ratio) == 1
    end
}, {
    name = 'THROTTLE 1 & THROTTLE 2',
    value = 'IDLE',
    completed = function()
        local throttle_ratio = XPLMGetDatavf(throttle_ratio, 0, 2)
        return throttle_ratio[0] == 0 and throttle_ratio[1] == 0
    end
}, {
    name = 'ENGINE 1 & ENGINE 2 MASTER',
    value = 'OFF',
    completed = function()
        local engine_master = XPLMGetDatavf(engine_master_switch, 0, 2)
        local engine1_start_lift = XPLMGetDataf(engine1_start_lift)
        local engine2_start_lift = XPLMGetDataf(engine2_start_lift)
        return engine_master[0] == 0 and engine_master[1] == 0 and engine1_start_lift == 0 and engine2_start_lift == 0
    end
}, {
    name = 'BAT 1 & BAT 2 & APU BAT',
    value = 'ON',
    completed = function()
        local battery_on_switch = XPLMGetDatavi(battery_on_switch, 0, 3)
        return battery_on_switch[0] == 1 and battery_on_switch[1] == 1 and battery_on_switch[2] == 1
    end
}, {
    name = 'NAV LIGHTS',
    value = 'ON',
    completed = function()
        return XPLMGetDatai(nav_light_switch) == 1
    end
}, {
    name = 'EMERGENCY LIGHTS',
    value = 'ARM',
    completed = function()
        return XPLMGetDatai(emergency_exit_light_switch) == 1
    end
}, {
    name = 'APU MASTER',
    value = 'ON',
    completed = function()
        return XPLMGetDatai(apu_master_switch) == 1
    end
}, {
    name = 'APU START',
    value = 'ON',
    completed = function()
        return XPLMGetDatai(apu_starter_switch) == 1
    end
}, {
    name = 'WAIT FOR APU AVAILABLE',
    value = '',
    completed = function()
        return XPLMGetDatai(apu_available) == 1
    end
}, {
    name = 'APU GENERATOR',
    value = 'ON',
    completed = function()
        return XPLMGetDatai(apu_generator_on) == 1
    end
}, {
    name = 'ELECTRICAL GALLEY',
    value = 'AUTO',
    completed = function()
        return XPLMGetDatai(electrical_galley_switch) == 1
    end
}, {
    name = 'COMMERCIAL POWER',
    value = 'ON',
    completed = function()
        return XPLMGetDatai(electrical_commercial_power_switch) == 1
    end
}, {
    name = 'PAX SYSTEM',
    value = 'ON',
    completed = function()
        return XPLMGetDatai(pax_system_switch) == 1
    end
}, {
    name = 'PAX SATCOM',
    value = 'ON',
    completed = function()
        return XPLMGetDatai(pax_satcom_switch) == 1
    end
}, {
    name = 'IFEC SYSTEM',
    value = 'ON',
    completed = function()
        return XPLMGetDatai(pax_ifec_system_switch) == 1
    end
}, {
    name = 'VENTILATION EXTRACT',
    value = 'AUTO',
    completed = function()
        return XPLMGetDatai(ventilation_extract_switch) == 1
    end
}, {
    name = 'CABIN FANS',
    value = 'ON',
    completed = function()
        return XPLMGetDatai(cabin_fans_switch) == 1
    end
}, {
    name = 'ADIRS SYSTEM',
    value = 'ON & NAV',
    completed = function()
        local ir1_switch = XPLMGetDatai(ir1_switch)
        local ir2_switch = XPLMGetDatai(ir2_switch)
        local ir3_switch = XPLMGetDatai(ir3_switch)
        local all_irs_on = ir1_switch == 1 and ir2_switch == 1 and ir3_switch == 1

        local adr1_switch = XPLMGetDatai(adr1_switch)
        local adr2_switch = XPLMGetDatai(adr2_switch)
        local adr3_switch = XPLMGetDatai(adr3_switch)
        local all_adrs_on = adr1_switch == 1 and adr2_switch == 1 and adr3_switch == 1

        local ir1_knob = XPLMGetDatai(ir1_knob)
        local ir2_knob = XPLMGetDatai(ir2_knob)
        local ir3_knob = XPLMGetDatai(ir3_knob)
        local all_irs_nav = ir1_knob == 1 and ir2_knob == 1 and ir3_knob == 1

        return all_irs_on and all_adrs_on and all_irs_nav
    end
}, {
    name = 'TURB DAMP SYSTEM',
    value = 'ON',
    completed = function()
        return XPLMGetDatai(fcc_turb_damp_switch) == 1
    end
}, {
    name = 'FLIGHT COMPUTER PRIM & SEC',
    value = 'ON',
    completed = function()
        local fcc_prim1_switch = XPLMGetDatai(fcc_prim1_switch)
        local fcc_prim2_switch = XPLMGetDatai(fcc_prim2_switch)
        local fcc_prim3_switch = XPLMGetDatai(fcc_prim3_switch)
        local all_prims_on = fcc_prim1_switch == 1 and fcc_prim2_switch == 1 and fcc_prim3_switch == 1

        local fcc_sec1_switch = XPLMGetDatai(fcc_sec1_switch)
        local fcc_sec2_switch = XPLMGetDatai(fcc_sec2_switch)
        local all_secs_on = fcc_sec1_switch == 1 and fcc_sec2_switch == 1

        return all_prims_on and all_secs_on
    end
}, {
    name = 'HYDRAULIC SYSTEM',
    value = 'AUTO & ON',
    completed = function()
        local elec_hyd_blue_switch = XPLMGetDatai(elec_hyd_blue_switch)
        local elec_hyd_green_switch = XPLMGetDatai(elec_hyd_green_switch)
        local elec_hyd_yellow_switch = XPLMGetDatai(elec_hyd_yellow_switch)
        local all_hyd_on = elec_hyd_blue_switch == 1 and elec_hyd_green_switch == 1 and elec_hyd_yellow_switch == 1

        local engine1_hyd_blue_switch = XPLMGetDatai(engine1_hyd_blue_switch)
        local engine1_hyd_green_switch = XPLMGetDatai(engine1_hyd_green_switch)
        local all_engine1_hyd_on = engine1_hyd_blue_switch == 1 and engine1_hyd_green_switch == 1

        local engine2_hyd_green_switch = XPLMGetDatai(engine2_hyd_green_switch)
        local engine2_hyd_yellow_switch = XPLMGetDatai(engine2_hyd_yellow_switch)
        local all_engine2_hyd_on = engine2_hyd_green_switch == 1 and engine2_hyd_yellow_switch == 1

        return all_hyd_on and all_engine1_hyd_on and all_engine2_hyd_on
    end
}, {
    name = 'GEAR HANDLE',
    value = 'DOWN',
    completed = function()
        return XPLMGetDatai(gear_handle_down) == 1
    end
}, {
    name = 'FLAP HANDLE',
    value = 'UP',
    completed = function()
        return XPLMGetDataf(flap_handle_ratio) == 0
    end
}, {
    name = 'SPOILER (SPEED BRAKE) HANDLE',
    value = 'RETRACTED',
    completed = function()
        return XPLMGetDatai(speedbrake_ratio) == 0
    end
}, {
    name = 'CREW OXYGEN',
    value = 'ON',
    completed = function()
        return XPLMGetDatai(crew_oxygen_switch) == 1
    end
}, {
    name = 'GPWS SYSTEM & MODES',
    value = 'ON',
    completed = function()
        local gpws_system_switch = XPLMGetDatai(gpws_system_switch)
        local gpws_gs_mode_switch = XPLMGetDatai(gpws_gs_mode_switch)
        local gpws_flap_mode_switch = XPLMGetDatai(gpws_flap_mode_switch)
        local gpws_terr_mode_switch = XPLMGetDatai(gpws_terr_mode_switch)
        return gpws_system_switch == 1 and gpws_gs_mode_switch == 1 and gpws_flap_mode_switch == 1 and gpws_terr_mode_switch == 1
    end
}, {
    name = 'SEATBELT & NO SMOKING LIGHTS',
    value = 'AUTO',
    completed = function()
        return XPLMGetDatai(seatbelt_light_switch) == 1 and XPLMGetDatai(no_smoking_light_switch) == 1
    end
}, {
    name = 'TRANSPONDER & TA/RA',
    value = 'STANDBY',
    completed = function()
        return XPLMGetDatai(transponder_auto_on_off_knob) == -1 and XPLMGetDatai(transponder_ta_ra_knob) == 0
    end
}}

------------------------------------------------- command -----------------------------------------

local text_start_x = 20
local text_start_y = 20
local text_delta_y = 20

function check_pre_boarding_item()
    draw_string(text_start_x, text_start_y, '-------------------- PRE-BOARDING CHECKLIST START --------------------', 'yellow')
    draw_string(text_start_x, text_start_y + text_delta_y * (#checklist + 1), '-------------------- PRE-BOARDING CHECKLIST END --------------------', 'yellow')

    local all_completed = true

    for index, item in ipairs(checklist) do
        local text_content = string.format('SET %s TO %s', item.name, item.value)
        local text_color = item.completed() and 'green' or 'red'

        draw_string(text_start_x, text_start_y + text_delta_y * index, text_content, text_color)

        if not item.completed() then
            all_completed = false
        end
    end

    if all_completed then
        XPLMSpeakString('Pre-flight Checklist Finished')
        for index, item in ipairs(checklist) do
            draw_string(text_start_x, text_start_y + text_delta_y * index, nil, nil)
        end
    end
end

function show_pre_boarding_checklist()
    do_every_draw('check_pre_boarding_item()')
end

add_macro('Show Pre-boarding Checklist', 'show_pre_boarding_checklist()')

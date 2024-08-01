local data_ref_parking_brake_ratio = XPLMFindDataRef('sim/cockpit2/controls/parking_brake_ratio')
local data_ref_throttle_ratio = XPLMFindDataRef('sim/cockpit2/engine/actuators/throttle_ratio')
local data_ref_engines_master = XPLMFindDataRef('sim/cockpit2/engine/actuators/eng_master')
local data_ref_engine1_master_lift = XPLMFindDataRef("laminar/A333/switches/engine1_start_lift")
local data_ref_engine2_master_lift = XPLMFindDataRef("laminar/A333/switches/engine2_start_lift")
local data_ref_battery_on = XPLMFindDataRef('sim/cockpit2/electrical/battery_on')
local data_ref_nav_lights = XPLMFindDataRef('laminar/a333/switches/nav_pos')
local data_ref_emergency_lights = XPLMFindDataRef('laminar/a333/switches/emer_exit_lt_pos')
local data_ref_apu_master = XPLMFindDataRef('laminar/A333/buttons/APU_master')
local data_ref_apu_start = XPLMFindDataRef('sim/cockpit2/electrical/APU_starter_switch')
local data_ref_apu_available = XPLMFindDataRef('sim/cockpit2/electrical/APU_running')
local data_ref_apu_generator = XPLMFindDataRef('sim/cockpit2/electrical/APU_generator_on')
local data_ref_electrical_galley_auto = XPLMFindDataRef('laminar/A333/buttons/galley_pos')
local data_ref_commercial_power = XPLMFindDataRef('laminar/A333/buttons/commercial_pos')
local data_ref_pax_system = XPLMFindDataRef('laminar/A333/buttons/pax_sys_pos')
local data_ref_pax_satcom = XPLMFindDataRef('laminar/A333/buttons/pax_satcom_pos')
local data_ref_ifec_system = XPLMFindDataRef('laminar/A333/buttons/pax_IFEC_pos')
local data_ref_ventilation_extract = XPLMFindDataRef('laminar/A333/buttons/ventilation_extract_ovrd_pos')
local data_ref_cabin_fans = XPLMFindDataRef('laminar/A333/buttons/cabin_fan_pos')
local data_ref_ir1 = XPLMFindDataRef('laminar/A333/buttons/adirs/ir1_pos')
local data_ref_ir2 = XPLMFindDataRef('laminar/A333/buttons/adirs/ir2_pos')
local data_ref_ir3 = XPLMFindDataRef('laminar/A333/buttons/adirs/ir3_pos')
local data_ref_adr1 = XPLMFindDataRef('laminar/A333/buttons/adirs/adr1_pos')
local data_ref_adr2 = XPLMFindDataRef('laminar/A333/buttons/adirs/adr2_pos')
local data_ref_adr3 = XPLMFindDataRef('laminar/A333/buttons/adirs/adr3_pos')
local data_ref_ir1_knob = XPLMFindDataRef('laminar/A333/buttons/adirs/ir1_knob_pos')
local data_ref_ir2_knob = XPLMFindDataRef('laminar/A333/buttons/adirs/ir2_knob_pos')
local data_ref_ir3_knob = XPLMFindDataRef('laminar/A333/buttons/adirs/ir3_knob_pos')
local data_ref_prim1 = XPLMFindDataRef('laminar/A333/buttons/fcc_prim1_pos')
local data_ref_prim2 = XPLMFindDataRef('laminar/A333/buttons/fcc_prim2_pos')
local data_ref_prim3 = XPLMFindDataRef('laminar/A333/buttons/fcc_prim3_pos')
local data_ref_sec1 = XPLMFindDataRef('laminar/A333/buttons/fcc_sec1_pos')
local data_ref_sec2 = XPLMFindDataRef('laminar/A333/buttons/fcc_sec2_pos')
local data_ref_turb_damp = XPLMFindDataRef('laminar/A333/buttons/fcc_turb_damp_pos')
local data_ref_elec_hyd_green = XPLMFindDataRef('laminar/A330/buttons/hyd/elec_green_tog_pos')
local data_ref_elec_hyd_blue = XPLMFindDataRef('laminar/A330/buttons/hyd/elec_blue_tog_pos')
local data_ref_elec_hyd_yellow = XPLMFindDataRef('laminar/A330/buttons/hyd/elec_yellow_tog_pos')
local data_ref_engine1_hyd_green = XPLMFindDataRef('laminar/A330/buttons/hyd/eng1_pump_green_pos')
local data_ref_engine1_hyd_blue = XPLMFindDataRef('laminar/A330/buttons/hyd/eng1_pump_blue_pos')
local data_ref_engine2_hyd_yellow = XPLMFindDataRef('laminar/A330/buttons/hyd/eng2_pump_yellow_pos')
local data_ref_engine2_hyd_green = XPLMFindDataRef('laminar/A330/buttons/hyd/eng2_pump_green_pos')
local data_ref_gear_handle_down = XPLMFindDataRef('sim/cockpit2/controls/gear_handle_down')
local data_ref_flap_handle_up = XPLMFindDataRef('sim/cockpit2/controls/flap_handle_request_ratio')
local data_ref_speedbrake_retracted = XPLMFindDataRef('sim/cockpit2/controls/speedbrake_ratio')
local data_ref_crew_oxygen_on = XPLMFindDataRef('laminar/A333/buttons/oxy/crew_valve_pos')
local data_ref_gpws_system_on = XPLMFindDataRef('laminar/A333/buttons/gpws/system_toggle_pos')
local data_ref_gpws_gs_mode_on = XPLMFindDataRef('laminar/A333/buttons/gpws/glideslope_toggle_pos')
local data_ref_gpws_flap_mode_on = XPLMFindDataRef('laminar/A333/buttons/gpws/flap_toggle_pos')
local data_ref_gpws_terr_mode_on = XPLMFindDataRef('laminar/A333/buttons/gpws/terrain_toggle_pos')
local data_ref_seatbelt_light_auto = XPLMFindDataRef('laminar/A333/switches/fasten_seatbelts')
local data_ref_no_smoking_light_auto = XPLMFindDataRef('laminar/A333/switches/no_smoking')
local data_ref_transponder_auto_on_off = XPLMFindDataRef('laminar/A333/transponder/auto_on_knob_pos')
local data_ref_transponder_ta_ra = XPLMFindDataRef('laminar/A333/transponder/ta_ra_knob_pos')

local text_start_x = 20
local text_start_y = 20
local text_delta_y = 20

local function check_parking_brake_on()
    local parking_brake_ratio = XPLMGetDataf(data_ref_parking_brake_ratio)
    if parking_brake_ratio == 1 then
        draw_string(text_start_x, text_start_y + text_delta_y * 27, 'SET PARKING BRAKE TO ON', 'green')
    else
        draw_string(text_start_x, text_start_y + text_delta_y * 27, 'SET PARKING BRAKE TO ON', 'red')
    end
end

local function check_throttles_idle()
    local throttle_ratio = XPLMGetDatavf(data_ref_throttle_ratio, 0, 2)
    if throttle_ratio[0] == 0 and throttle_ratio[1] == 0 then
        draw_string(text_start_x, text_start_y + text_delta_y * 26, 'SET THROTTLE 1 and THROTTLE 2 TO IDLE', 'green')
    else
        draw_string(text_start_x, text_start_y + text_delta_y * 26, 'SET THROTTLE 1 and THROTTLE 2 TO IDLE', 'red')
    end
end

local function check_engines_master_off()
    local engines_master = XPLMGetDatavf(data_ref_engines_master, 0, 2)
    local engine1_master_lift = XPLMGetDataf(data_ref_engine1_master_lift)
    local engine2_master_lift = XPLMGetDataf(data_ref_engine2_master_lift)

    if engines_master[0] == 0 and engine1_master_lift == 0 and engines_master[1] == 0 and engine2_master_lift == 0 then
        draw_string(text_start_x, text_start_y + text_delta_y * 25, 'SET ENGINE 1 and ENGINE 2 MASTER TO OFF', 'green')
    else
        draw_string(text_start_x, text_start_y + text_delta_y * 25, 'SET ENGINE 1 and ENGINE 2 MASTER TO OFF', 'red')
    end
end

local function check_batteries_on()
    local battery_on = XPLMGetDatavi(data_ref_battery_on, 0, 3)
    if battery_on[0] == 1 and battery_on[1] == 1 and battery_on[2] == 1 then
        draw_string(text_start_x, text_start_y + text_delta_y * 24, 'SET BATTERY 1 and BATTERY 2 and APU BATTERY TO ON', 'green')
    else
        draw_string(text_start_x, text_start_y + text_delta_y * 24, 'SET BATTERY 1 and BATTERY 2 and APU BATTERY TO ON', 'red')
    end
end

local function check_nav_lights_on()
    local nav_lights_on = XPLMGetDatai(data_ref_nav_lights)
    if nav_lights_on == 1 then
        draw_string(text_start_x, text_start_y + text_delta_y * 23, 'SET NAV LIGHTS TO ON', 'green')
    else
        draw_string(text_start_x, text_start_y + text_delta_y * 23, 'SET NAV LIGHTS TO ON', 'red')
    end
end

local function check_emergency_lights_arm()
    local emergency_lights_arm = XPLMGetDatai(data_ref_emergency_lights)
    if emergency_lights_arm == 1 then
        draw_string(text_start_x, text_start_y + text_delta_y * 22, 'SET EMERGENCY LIGHTS TO ARM', 'green')
    else
        draw_string(text_start_x, text_start_y + text_delta_y * 22, 'SET EMERGENCY LIGHTS TO ARM', 'red')
    end
end

local function check_apu_master_on()
    local apu_master_on = XPLMGetDatai(data_ref_apu_master)
    if apu_master_on == 1 then
        draw_string(text_start_x, text_start_y + text_delta_y * 21, 'SET APU MASTER TO ON', 'green')
    else
        draw_string(text_start_x, text_start_y + text_delta_y * 21, 'SET APU MASTER TO ON', 'red')
    end
end

local function check_apu_start_on()
    local apu_start_on = XPLMGetDatai(data_ref_apu_start)
    if apu_start_on == 1 then
        draw_string(text_start_x, text_start_y + text_delta_y * 20, 'SET APU START TO ON', 'green')
    else
        draw_string(text_start_x, text_start_y + text_delta_y * 20, 'SET APU START TO ON', 'red')
    end
end

local function check_apu_available()
    local data_ref_apu_available = XPLMGetDatai(data_ref_apu_available)
    if data_ref_apu_available == 1 then
        draw_string(text_start_x, text_start_y + text_delta_y * 19, 'WAIT FOR APU AVAILABLE', 'green')
    else
        draw_string(text_start_x, text_start_y + text_delta_y * 19, 'WAIT FOR APU AVAILABLE', 'red')
    end
end

local function check_apu_generator_on()
    local apu_generator_on = XPLMGetDatai(data_ref_apu_generator)
    if apu_generator_on == 1 then
        draw_string(text_start_x, text_start_y + text_delta_y * 18, 'SET APU GENERATOR TO ON', 'green')
    else
        draw_string(text_start_x, text_start_y + text_delta_y * 18, 'SET APU GENERATOR TO ON', 'red')
    end
end

local function check_electrical_galley_auto()
    local electrical_galley_auto = XPLMGetDatai(data_ref_electrical_galley_auto)
    if electrical_galley_auto == 1 then
        draw_string(text_start_x, text_start_y + text_delta_y * 17, 'SET ELECTRICAL GALLEY TO AUTO', 'green')
    else
        draw_string(text_start_x, text_start_y + text_delta_y * 17, 'SET ELECTRICAL GALLEY TO AUTO', 'red')
    end
end

local function check_commercial_power_on()
    local commercial_power_on = XPLMGetDatai(data_ref_commercial_power)
    if commercial_power_on == 1 then
        draw_string(text_start_x, text_start_y + text_delta_y * 16, 'SET COMMERCIAL POWER TO ON', 'green')
    else
        draw_string(text_start_x, text_start_y + text_delta_y * 16, 'SET COMMERCIAL POWER TO ON', 'red')
    end
end

local function check_pax_system_on()
    local pax_system_on = XPLMGetDatai(data_ref_pax_system)
    if pax_system_on == 1 then
        draw_string(text_start_x, text_start_y + text_delta_y * 15, 'SET PAX SYSTEM TO ON', 'green')
    else
        draw_string(text_start_x, text_start_y + text_delta_y * 15, 'SET PAX SYSTEM TO ON', 'red')
    end
end

local function check_pax_satcom_on()
    local pax_satcom_on = XPLMGetDatai(data_ref_pax_satcom)
    if pax_satcom_on == 1 then
        draw_string(text_start_x, text_start_y + text_delta_y * 14, 'SET PAX SATCOM TO ON', 'green')
    else
        draw_string(text_start_x, text_start_y + text_delta_y * 14, 'SET PAX SATCOM TO ON', 'red')
    end
end

local function check_ifec_system_on()
    local ifec_system_on = XPLMGetDatai(data_ref_ifec_system)
    if ifec_system_on == 1 then
        draw_string(text_start_x, text_start_y + text_delta_y * 13, 'SET IFEC SYSTEM TO ON', 'green')
    else
        draw_string(text_start_x, text_start_y + text_delta_y * 13, 'SET IFEC SYSTEM TO ON', 'red')
    end
end

local function check_ventilation_extract_auto()
    local ventilation_extract_auto = XPLMGetDatai(data_ref_ventilation_extract)
    if ventilation_extract_auto == 1 then
        draw_string(text_start_x, text_start_y + text_delta_y * 12, 'SET VENTILATION EXTRACT TO AUTO', 'green')
    else
        draw_string(text_start_x, text_start_y + text_delta_y * 12, 'SET VENTILATION EXTRACT TO AUTO', 'red')
    end
end

local function check_cabin_fans_on()
    local cabin_fans_on = XPLMGetDatai(data_ref_cabin_fans)
    if cabin_fans_on == 1 then
        draw_string(text_start_x, text_start_y + text_delta_y * 11, 'SET CABIN FANS TO ON', 'green')
    else
        draw_string(text_start_x, text_start_y + text_delta_y * 11, 'SET CABIN FANS TO ON', 'red')
    end
end

local function check_ADIRS_on()
    local ir1_on = XPLMGetDatai(data_ref_ir1)
    local ir2_on = XPLMGetDatai(data_ref_ir2)
    local ir3_on = XPLMGetDatai(data_ref_ir3)
    local adr1_on = XPLMGetDatai(data_ref_adr1)
    local adr2_on = XPLMGetDatai(data_ref_adr2)
    local adr3_on = XPLMGetDatai(data_ref_adr3)
    local ir1_knob_nav_on = XPLMGetDatai(data_ref_ir1_knob)
    local ir2_knob_nav_on = XPLMGetDatai(data_ref_ir2_knob)
    local ir3_knob_nav_on = XPLMGetDatai(data_ref_ir3_knob)

    if ir1_on == 1 and ir2_on == 1 and ir3_on == 1 and adr1_on == 1 and adr2_on == 1 and adr3_on == 1 and ir1_knob_nav_on == 1 and ir2_knob_nav_on == 1 and ir3_knob_nav_on == 1 then
        draw_string(text_start_x, text_start_y + text_delta_y * 10, 'SET ADIRS SYSTEM TO ON and NAV', 'green')
    else
        draw_string(text_start_x, text_start_y + text_delta_y * 10, 'SET ADIRS SYSTEM TO ON and NAV', 'red')
    end
end

local function check_flight_computer_PRIM_and_SEC_on()
    local prim1_on = XPLMGetDatai(data_ref_prim1)
    local prim2_on = XPLMGetDatai(data_ref_prim2)
    local prim3_on = XPLMGetDatai(data_ref_prim3)
    local sec1_on = XPLMGetDatai(data_ref_sec1)
    local sec2_on = XPLMGetDatai(data_ref_sec2)

    if prim1_on == 1 and prim2_on == 1 and prim3_on == 1 and sec1_on == 1 and sec2_on == 1 then
        draw_string(text_start_x, text_start_y + text_delta_y * 9, 'SET FLIGHT COMPUTER PRIM and SEC TO ON', 'green')
    else
        draw_string(text_start_x, text_start_y + text_delta_y * 9, 'SET FLIGHT COMPUTER PRIM and SEC TO ON', 'red')
    end
end

local function check_TURB_DAMP_system_on()
    local turb_damp_on = XPLMGetDatai(data_ref_turb_damp)
    if turb_damp_on == 1 then
        draw_string(text_start_x, text_start_y + text_delta_y * 8, 'SET TURB DAMP SYSTEM TO ON', 'green')
    else
        draw_string(text_start_x, text_start_y + text_delta_y * 8, 'SET TURB DAMP SYSTEM TO ON', 'red')
    end
end

local function check_hydraulic_system_on()
    local elec_hyd_green_auto = XPLMGetDatai(data_ref_elec_hyd_green)
    local elec_hyd_blur_auto = XPLMGetDatai(data_ref_elec_hyd_blue)
    local elec_hyd_yellow_auto = XPLMGetDatai(data_ref_elec_hyd_yellow)
    local engine1_hyd_green_on = XPLMGetDatai(data_ref_engine1_hyd_green)
    local engine1_hyd_blue_on = XPLMGetDatai(data_ref_engine1_hyd_blue)
    local engine2_hyd_yellow_on = XPLMGetDatai(data_ref_engine2_hyd_yellow)
    local engine2_hyd_green_on = XPLMGetDatai(data_ref_engine2_hyd_green)

    if elec_hyd_green_auto == 1 and elec_hyd_blur_auto == 1 and elec_hyd_yellow_auto == 1 and engine1_hyd_green_on == 1 and engine1_hyd_blue_on == 1 and engine2_hyd_green_on == 1 and engine2_hyd_yellow_on == 1 then
        draw_string(text_start_x, text_start_y + text_delta_y * 7, 'SET HYDRAULIC SYSTEM TO AUTO and ON', 'green')
    else
        draw_string(text_start_x, text_start_y + text_delta_y * 7, 'SET HYDRAULIC SYSTEM TO AUTO and ON', 'red')
    end
end

local function check_gear_handle_down()
    local gear_handle_down = XPLMGetDatai(data_ref_gear_handle_down)
    if gear_handle_down == 1 then
        draw_string(text_start_x, text_start_y + text_delta_y * 6, 'SET GEAR HANDLE TO DOWN', 'green')
    else
        draw_string(text_start_x, text_start_y + text_delta_y * 6, 'SET GEAR HANDLE TO DOWN', 'red')
    end
end

local function check_flap_handle_up()
    local flap_handle_up = XPLMGetDataf(data_ref_flap_handle_up)
    if flap_handle_up == 0 then
        draw_string(text_start_x, text_start_y + text_delta_y * 5, 'SET FLAP HANDLE TO UP', 'green')
    else
        draw_string(text_start_x, text_start_y + text_delta_y * 5, 'SET FLAP HANDLE TO UP', 'red')
    end
end

local function check_spoilers_retracted()
    local spoilers_retracted = XPLMGetDataf(data_ref_speedbrake_retracted)
    if spoilers_retracted == 0 then
        draw_string(text_start_x, text_start_y + text_delta_y * 4, 'SET SPOILERS HANDLE TO RETRACTED', 'green')
    else
        draw_string(text_start_x, text_start_y + text_delta_y * 4, 'SET SPOILERS HANDLE TO RETRACTED', 'red')
    end
end

local function check_crew_oxygen_on()
    local crew_oxygen_on = XPLMGetDatai(data_ref_crew_oxygen_on)
    if crew_oxygen_on == 1 then
        draw_string(text_start_x, text_start_y + text_delta_y * 3, 'SET CREW OXYGEN TO ON', 'green')
    else
        draw_string(text_start_x, text_start_y + text_delta_y * 3, 'SET CREW OXYGEN TO ON', 'red')
    end
end

local function check_GPWS_system_on()
    local gpws_system_on = XPLMGetDatai(data_ref_gpws_system_on)
    local gpws_gs_mode_on = XPLMGetDatai(data_ref_gpws_gs_mode_on)
    local gpws_flap_mode_on = XPLMGetDatai(data_ref_gpws_flap_mode_on)
    local gpws_terr_mode_on = XPLMGetDatai(data_ref_gpws_terr_mode_on)

    if gpws_system_on == 1 and gpws_gs_mode_on == 1 and gpws_flap_mode_on == 1 and gpws_terr_mode_on == 1 then
        draw_string(text_start_x, text_start_y + text_delta_y * 2, 'SET GPWS SYSTEM and ALL MODES TO ON', 'green')
    else
        draw_string(text_start_x, text_start_y + text_delta_y * 2, 'SET GPWS SYSTEM and ALL MODES TO ON', 'red')
    end
end

local function check_seatbelt_and_no_smoking_light_auto()
    local seatbelt_light_auto = XPLMGetDatai(data_ref_seatbelt_light_auto)
    local no_smoking_light_auto = XPLMGetDatai(data_ref_no_smoking_light_auto)

    if seatbelt_light_auto == 1 and no_smoking_light_auto == 1 then
        draw_string(text_start_x, text_start_y + text_delta_y * 1, 'SET SEATBELT AND NO SMOKING LIGHTS AUTO', 'green')
    else
        draw_string(text_start_x, text_start_y + text_delta_y * 1, 'SET SEATBELT AND NO SMOKING LIGHTS AUTO', 'red')
    end
end

local function check_transponder_standby()
    local transponder_auto_on_off = XPLMGetDatai(data_ref_transponder_auto_on_off)
    local transponder_ta_ra = XPLMGetDatai(data_ref_transponder_ta_ra)

    if transponder_auto_on_off == -1 and transponder_ta_ra == 0 then
        draw_string(text_start_x, text_start_y + text_delta_y * 0, 'SET TRANSPONDER and TA/RA STANDBY', 'green')
    else
        draw_string(text_start_x, text_start_y + text_delta_y * 0, 'SET TRANSPONDER and TA/RA STANDBY', 'red')
    end
end

-- 此函数用于实现空客A330系列客机登机前驾驶舱检查清单
-- This function is used to implement the pre-boarding cockpit checklist for Airbus A330 Series aircraft
-- 输入参数：无
-- Input Parameters: None
-- 输出参数：检查未通过项目会在模拟器左侧以红色字体显示，通过项目以绿色字体显示（支持对按钮或开关的动态操作做实时检查和反馈）
-- Output Parameters: The items that failed to check will be displayed in red text on the left side of the simulator,
-- and the items that passed the check will be displayed in green text (real-time check and feedback on the dynamic operation of buttons or switches is supported)
-- 注意：此函数仅限用于飞行模拟器，请勿在真实的电子飞行包程序中加载和运行它
-- WARNING: This function is only for flight simulator, please DO NOT use it in realistic EFB programs
function check_pre_boarding_items()
    -- 检查停车制动开启
    check_parking_brake_on()
    -- 检查油门归零
    check_throttles_idle()
    -- 检查引擎关闭
    check_engines_master_off()
    -- 检查电源开启
    check_batteries_on()
    -- 检查导航灯打开
    check_nav_lights_on()
    -- 检查应急灯ARM状态
    check_emergency_lights_arm()
    -- 检查APU MASTER开启
    check_apu_master_on()
    -- 检查APU开启
    check_apu_start_on()
    -- 检查APU可用
    check_apu_available()
    -- 检查APU发电机开启
    check_apu_generator_on()
    -- 检查厨房卫生间电源AUTO状态
    check_electrical_galley_auto()
    -- 检查客舱电源开启
    check_commercial_power_on()
    -- 检查客舱服务系统开启
    check_pax_system_on()
    -- 检查客舱卫星通讯系统开启
    check_pax_satcom_on()
    -- 检查机载娱乐系统开启
    check_ifec_system_on()
    -- 检查通风系统AUTO状态
    check_ventilation_extract_auto()
    -- 检查客舱风扇系统开启
    check_cabin_fans_on()
    -- 检查大气数据惯性参考系统开启
    check_ADIRS_on()
    -- 检查飞行计算机PRIM和SEC开启
    check_flight_computer_PRIM_and_SEC_on()
    -- 检查空气湍流阻尼系统开启
    check_TURB_DAMP_system_on()
    -- 检查液压系统开启
    check_hydraulic_system_on()
    -- 检查起落架手柄是否在DOWN位
    check_gear_handle_down()
    -- 检查襟翼手柄是否在UP位
    check_flap_handle_up()
    -- 检查扰流板RETRACTED状态
    check_spoilers_retracted()
    -- 检查机组人员氧气开启
    check_crew_oxygen_on()
    -- 检查地面接近警告系统开启
    check_GPWS_system_on()
    -- 检查系安全带和禁止吸烟警示灯AUTO状态
    check_seatbelt_and_no_smoking_light_auto()
    -- 检查应答机STANDBY状态
    check_transponder_standby()
end

function pre_boarding_checklist()
    XPLMSpeakString('Pre-boarding checklist')
    do_every_draw('check_pre_boarding_items()')
end

add_macro('Show Airbus A330 Pre-boarding Checklist', 'pre_boarding_checklist()', '', 'deactivate')

local data_ref_beacon_on = XPLMFindDataRef('sim/cockpit2/switches/beacon_on')
local data_ref_apu_bleed_on = XPLMFindDataRef('laminar/A333/buttons/apu_bleed_pos')
local data_ref_fuel_left1_pump_on = XPLMFindDataRef("laminar/A333/fuel/buttons/left1_pump_pos")
local data_ref_fuel_left2_pump_on = XPLMFindDataRef("laminar/A333/fuel/buttons/left2_pump_pos")
local data_ref_fuel_left_pump_standby = XPLMFindDataRef("laminar/A333/fuel/buttons/left_stby_pump_pos")
local data_ref_fuel_right1_pump_on = XPLMFindDataRef("laminar/A333/fuel/buttons/right1_pump_pos")
local data_ref_fuel_right2_pump_on = XPLMFindDataRef("laminar/A333/fuel/buttons/right2_pump_pos")
local data_ref_fuel_right_pump_standby = XPLMFindDataRef("laminar/A333/fuel/buttons/right_stby_pump_pos")
local data_ref_fuel_center_left_pump_on = XPLMFindDataRef("laminar/A333/fuel/buttons/center_left_pump_pos")
local data_ref_fuel_center_right_pump_on = XPLMFindDataRef("laminar/A333/fuel/buttons/center_right_pump_pos")
local data_ref_engine_mode = XPLMFindDataRef("sim/cockpit2/engine/actuators/eng_mode_selector")
local data_ref_engines_N3_percent = XPLMFindDataRef("sim/cockpit2/engine/indicators/N2_percent")
local data_ref_generator1_on = XPLMFindDataRef("laminar/A333/buttons/gen1_pos")
local data_ref_generator2_on = XPLMFindDataRef("laminar/A333/buttons/gen2_pos")
local data_ref_bus_tie_auto = XPLMFindDataRef("laminar/A333/buttons/bus_tie_pos")
local data_ref_engine_bleed1_on = XPLMFindDataRef("laminar/A333/buttons/eng_bleed_1_pos")
local data_ref_engine_bleed2_on = XPLMFindDataRef("laminar/A333/buttons/eng_bleed_2_pos")
local data_ref_engine_pack1_on = XPLMFindDataRef("laminar/A333/buttons/pack_1_pos")
local data_ref_engine_pack2_on = XPLMFindDataRef("laminar/A333/buttons/pack_2_pos")
local data_ref_engine_hot_air1_on = XPLMFindDataRef("laminar/A333/buttons/hot_air1_pos")
local data_ref_engine_hot_air2_on = XPLMFindDataRef("laminar/A333/buttons/hot_air2_pos")
local data_ref_fwd_isol_valve_on = XPLMFindDataRef("laminar/A333/buttons/cargo_cond/fwd_isol_valve_pos")
local data_ref_bulk_isol_valve_on = XPLMFindDataRef("laminar/A333/buttons/cargo_cond/bulk_isol_valve_pos")
local data_ref_hot_air_on = XPLMFindDataRef("laminar/A333/buttons/cargo_cond/hot_air_pos")
local data_ref_apu_master_on = XPLMFindDataRef('laminar/A333/buttons/APU_master')
local data_ref_apu_start_on = XPLMFindDataRef('sim/cockpit2/electrical/APU_starter_switch')
local data_ref_apu_generator_on = XPLMFindDataRef('sim/cockpit2/electrical/APU_generator_on')
local data_ref_transponder_auto_on_off = XPLMFindDataRef('laminar/A333/transponder/auto_on_knob_pos')
local data_ref_transponder_ta_ra = XPLMFindDataRef('laminar/A333/transponder/ta_ra_knob_pos')

local text_start_x = 20
local text_start_y = 20
local text_delta_y = 20

local function check_beacon_on()
    local beacon_on = XPLMGetDatai(data_ref_beacon_on)
    if beacon_on == 1 then
        draw_string(text_start_x, text_start_y + text_delta_y * 11, 'SET BEACON TO ON', 'green')
    else
        draw_string(text_start_x, text_start_y + text_delta_y * 11, 'SET BEACON TO ON', 'red')
    end
end

local function check_apu_bleed_on()
    local apu_bleed_on = XPLMGetDatai(data_ref_apu_bleed_on)
    if apu_bleed_on == 1 then
        draw_string(text_start_x, text_start_y + text_delta_y * 10, 'SET APU BLEED TO ON', 'green')
    else
        draw_string(text_start_x, text_start_y + text_delta_y * 10, 'SET APU BLEED TO ON', 'red')
    end
end

local function check_fuel_pumps_on()
    local fuel_left1_pump_on = XPLMGetDatai(data_ref_fuel_left1_pump_on)
    local fuel_left2_pump_on = XPLMGetDatai(data_ref_fuel_left2_pump_on)
    local fuel_left_pump_standby = XPLMGetDatai(data_ref_fuel_left_pump_standby)
    local fuel_right1_pump_on = XPLMGetDatai(data_ref_fuel_right1_pump_on)
    local fuel_right2_pump_on = XPLMGetDatai(data_ref_fuel_right2_pump_on)
    local fuel_right_pump_standby = XPLMGetDatai(data_ref_fuel_right_pump_standby)
    local fuel_center_left_pump_on = XPLMGetDatai(data_ref_fuel_center_left_pump_on)
    local fuel_center_right_pump_on = XPLMGetDatai(data_ref_fuel_center_right_pump_on)

    if fuel_left1_pump_on == 1 and fuel_left2_pump_on == 1 and fuel_left_pump_standby == 1 and fuel_right1_pump_on == 1 and fuel_right2_pump_on == 1 and fuel_center_left_pump_on == 1 and fuel_center_right_pump_on == 1 then
        draw_string(text_start_x, text_start_y + text_delta_y * 9, 'SET ALL FUEL PUMPS ON', 'green')
    else
        draw_string(text_start_x, text_start_y + text_delta_y * 9, 'SET ALL FUEL PUMPS ON', 'red')
    end
end

local function check_engine_mode_IGN_START()
    local engine_mode = XPLMGetDatai(data_ref_engine_mode)
    if engine_mode == 1 then
        draw_string(text_start_x, text_start_y + text_delta_y * 8, 'SET ENGINE MODE TO IGN/START', 'green')
    else
        draw_string(text_start_x, text_start_y + text_delta_y * 8, 'SET ENGINE MODE TO IGN/START', 'red')
    end
end

local function check_engines_starting()
    local engines_N3_percent = XPLMGetDatavf(data_ref_engines_N3_percent, 0, 2)
    if engines_N3_percent[0] > 58 and engines_N3_percent[1] > 58 then
        draw_string(text_start_x, text_start_y + text_delta_y * 7, 'SET ENGINE 1 and ENGINE 2 MASTER STARTING', 'green')
    else
        draw_string(text_start_x, text_start_y + text_delta_y * 7, 'SET ENGINE 1 and ENGINE 2 MASTER STARTING', 'red')
    end
end

local function check_generators_on_and_bus_tie_auto()
    local generator1_on = XPLMGetDatai(data_ref_generator1_on)
    local generator2_on = XPLMGetDatai(data_ref_generator2_on)
    local bus_tie_auto = XPLMGetDatai(data_ref_bus_tie_auto)

    if generator1_on == 1 and generator2_on == 1 and bus_tie_auto == 1 then
        draw_string(text_start_x, text_start_y + text_delta_y * 6, 'SET ENGINE 1 and ENGINE 2 GENERATOR ON and BUS TIE AUTO', 'green')
    else
        draw_string(text_start_x, text_start_y + text_delta_y * 6, 'SET ENGINE 1 and ENGINE 2 GENERATOR ON and BUS TIE AUTO', 'red')
    end
end

local function check_apu_bleed_off()
    local apu_bleed_on = XPLMGetDatai(data_ref_apu_bleed_on)
    if apu_bleed_on == 0 then
        draw_string(text_start_x, text_start_y + text_delta_y * 5, 'SET APU BLEED TO OFF', 'green')
    else
        draw_string(text_start_x, text_start_y + text_delta_y * 5, 'SET APU BLEED TO OFF', 'red')
    end
end

local function check_engines_bleed_on()
    local engine_bleed1_on = XPLMGetDatai(data_ref_engine_bleed1_on)
    local engine_bleed2_on = XPLMGetDatai(data_ref_engine_bleed2_on)
    local engine_pack1_on = XPLMGetDatai(data_ref_engine_pack1_on)
    local engine_pack2_on = XPLMGetDatai(data_ref_engine_pack2_on)
    local engine_hot_air1_on = XPLMGetDatai(data_ref_engine_hot_air1_on)
    local engine_hot_air2_on = XPLMGetDatai(data_ref_engine_hot_air2_on)

    if engine_bleed1_on == 1 and engine_bleed2_on == 1 and engine_pack1_on == 1 and engine_pack2_on == 1 and engine_hot_air1_on == 1 and engine_hot_air2_on == 1 then
        draw_string(text_start_x, text_start_y + text_delta_y * 4, 'SET ENGINES BLEED and PACK 1/2 and HOT AIR 1/2 ON', 'green')
    else
        draw_string(text_start_x, text_start_y + text_delta_y * 4, 'SET ENGINES BLEED and PACK 1/2 and HOT AIR 1/2 ON', 'red')
    end
end

local function check_cargo_valves_isolated_and_hot_air_on()
    local fwd_isol_valve_on = XPLMGetDatai(data_ref_fwd_isol_valve_on)
    local bulk_isol_valve_on = XPLMGetDatai(data_ref_bulk_isol_valve_on)
    local hot_air_on = XPLMGetDatai(data_ref_hot_air_on)

    if fwd_isol_valve_on == 1 and bulk_isol_valve_on == 1 and hot_air_on == 1 then
        draw_string(text_start_x, text_start_y + text_delta_y * 3, 'SET CARGO ISOL VALVES and HOT AIR ON', 'green')
    else
        draw_string(text_start_x, text_start_y + text_delta_y * 3, 'SET CARGO ISOL VALVES and HOT AIR ON', 'red')
    end
end

local function check_apu_generator_and_master_off()
    local apu_master_on = XPLMGetDatai(data_ref_apu_master_on)
    local apu_start_on = XPLMGetDatai(data_ref_apu_start_on)
    local apu_generator_on = XPLMGetDatai(data_ref_apu_generator_on)

    if apu_master_on == 0 and apu_start_on == 0 and apu_generator_on == 0 then
        draw_string(text_start_x, text_start_y + text_delta_y * 2, 'SET APU MASTER and APU START and APU GENERATOR OFF', 'green')
    else
        draw_string(text_start_x, text_start_y + text_delta_y * 2, 'SET APU MASTER and APU START and APU GENERATOR OFF', 'red')
    end
end

local function check_engine_mode_normal()
    local engine_mode = XPLMGetDatai(data_ref_engine_mode)
    if engine_mode == 0 then
        draw_string(text_start_x, text_start_y + text_delta_y * 1, 'SET ENGINE MODE NORMAL', 'green')
    else
        draw_string(text_start_x, text_start_y + text_delta_y * 1, 'SET ENGINE MODE NORMAL', 'red')
    end
end

local function check_transponder_on_and_ta_ra()
    local transponder_auto_on_off = XPLMGetDatai(data_ref_transponder_auto_on_off)
    local transponder_ta_ra = XPLMGetDatai(data_ref_transponder_ta_ra)

    if transponder_auto_on_off == 1 and transponder_ta_ra == 2 then
        draw_string(text_start_x, text_start_y + text_delta_y * 0, 'SET TRANSPONDER ON AND TA/RA', 'green')
    else
        draw_string(text_start_x, text_start_y + text_delta_y * 0, 'SET TRANSPONDER ON AND TA/RA', 'red')
    end
end

-- 此函数用于实现空客A330系列客机起飞前驾驶舱检查清单
-- This function is used to implement the pre-flight checklist of Airbus A330 series aircraft
-- 输入参数：无
-- Input Parameters: None
-- 输出参数：检查未通过项目会在模拟器左侧以红色字体显示，通过项目以绿色字体显示（支持对按钮或开关的动态操作做实时检查和反馈）
-- Output Parameters: The items that failed to check will be displayed in red text on the left side of the simulator,
-- and the items that passed the check will be displayed in green text (real-time check and feedback on the dynamic operation of buttons or switches is supported)
-- 注意：此函数仅限用于飞行模拟器，请勿在真实的电子飞行包程序中加载和运行它
-- WARNING: This function is only for flight simulator, please DO NOT use it in realistic EFB programs
function check_pre_flight_items()
    -- 检查信标灯开启
    check_beacon_on()
    -- 检查APU引气开启
    check_apu_bleed_on()
    -- 检查燃油泵开启
    check_fuel_pumps_on()
    -- 检查引擎点火器开启
    check_engine_mode_IGN_START()
    -- 检查引擎开启
    check_engines_starting()
    -- 检查发电机开启且汇流条连接AUTO状态
    check_generators_on_and_bus_tie_auto()
    -- 检查APU引气关闭
    check_apu_bleed_off()
    -- 检查引擎引起开启
    check_engines_bleed_on()
    -- 检查隔离阀门开启
    check_cargo_valves_isolated_and_hot_air_on()
    -- 检查APU开关/发电机关闭
    check_apu_generator_and_master_off()
    -- 检查引擎NORMAL模式
    check_engine_mode_normal()
    -- 检查应答机开启且在TA/RA模式
    check_transponder_on_and_ta_ra()
end

function pre_flight_checklist()
    XPLMSpeakString("Pre-flight Checklist")
    do_every_draw('check_pre_flight_items()')
end

add_macro('Airbus A330 Pre-flight Checklist', 'pre_flight_checklist()', '', 'deactivate')

local data_ref_beacon_on = XPLMFindDataRef('sim/cockpit2/switches/beacon_on')
local data_ref_apu_bleed_on = XPLMFindDataRef('laminar/A333/buttons/apu_bleed_pos')
local data_ref_fuel_left1_pump_on = XPLMFindDataRef('laminar/A333/fuel/buttons/left1_pump_pos')
local data_ref_fuel_left2_pump_on = XPLMFindDataRef('laminar/A333/fuel/buttons/left2_pump_pos')
local data_ref_fuel_left_pump_standby = XPLMFindDataRef('laminar/A333/fuel/buttons/left_stby_pump_pos')
local data_ref_fuel_right1_pump_on = XPLMFindDataRef('laminar/A333/fuel/buttons/right1_pump_pos')
local data_ref_fuel_right2_pump_on = XPLMFindDataRef('laminar/A333/fuel/buttons/right2_pump_pos')
local data_ref_fuel_right_pump_standby = XPLMFindDataRef('laminar/A333/fuel/buttons/right_stby_pump_pos')
local data_ref_fuel_center_left_pump_on = XPLMFindDataRef('laminar/A333/fuel/buttons/center_left_pump_pos')
local data_ref_fuel_center_right_pump_on = XPLMFindDataRef('laminar/A333/fuel/buttons/center_right_pump_pos')
local data_ref_engine_mode = XPLMFindDataRef('sim/cockpit2/engine/actuators/eng_mode_selector')
local data_ref_engines_N3_percent = XPLMFindDataRef('sim/cockpit2/engine/indicators/N2_percent')
local data_ref_generator1_on = XPLMFindDataRef('laminar/A333/buttons/gen1_pos')
local data_ref_generator2_on = XPLMFindDataRef('laminar/A333/buttons/gen2_pos')
local data_ref_bus_tie_auto = XPLMFindDataRef('laminar/A333/buttons/bus_tie_pos')
local data_ref_engine_bleed1_on = XPLMFindDataRef('laminar/A333/buttons/eng_bleed_1_pos')
local data_ref_engine_bleed2_on = XPLMFindDataRef('laminar/A333/buttons/eng_bleed_2_pos')
local data_ref_engine_pack1_on = XPLMFindDataRef('laminar/A333/buttons/pack_1_pos')
local data_ref_engine_pack2_on = XPLMFindDataRef('laminar/A333/buttons/pack_2_pos')
local data_ref_engine_hot_air1_on = XPLMFindDataRef('laminar/A333/buttons/hot_air1_pos')
local data_ref_engine_hot_air2_on = XPLMFindDataRef('laminar/A333/buttons/hot_air2_pos')
local data_ref_fwd_isol_valve_on = XPLMFindDataRef('laminar/A333/buttons/cargo_cond/fwd_isol_valve_pos')
local data_ref_bulk_isol_valve_on = XPLMFindDataRef('laminar/A333/buttons/cargo_cond/bulk_isol_valve_pos')
local data_ref_hot_air_on = XPLMFindDataRef('laminar/A333/buttons/cargo_cond/hot_air_pos')
local data_ref_apu_master_on = XPLMFindDataRef('laminar/A333/buttons/APU_master')
local data_ref_apu_start_on = XPLMFindDataRef('sim/cockpit2/electrical/APU_starter_switch')
local data_ref_apu_generator_on = XPLMFindDataRef('sim/cockpit2/electrical/APU_generator_on')
local data_ref_transponder_auto_on_off = XPLMFindDataRef('laminar/A333/transponder/auto_on_knob_pos')
local data_ref_transponder_ta_ra = XPLMFindDataRef('laminar/A333/transponder/ta_ra_knob_pos')

local text_start_x = 20
local text_start_y = 20
local text_delta_y = 20

local check_passed_items = {}
local total_item_count_to_be_checked = 12

local function all_item_check_passed()
    local check_passed_item_count = 0
    for _, value in pairs(check_passed_items) do
        if value then
            check_passed_item_count = check_passed_item_count + 1
        else
            return false
        end
    end
    return check_passed_item_count == total_item_count_to_be_checked
end

local function check_beacon_on()
    local beacon_on = XPLMGetDatai(data_ref_beacon_on)
    local text_content = 'SET BEACON TO ON'
    local text_color = nil

    if all_item_check_passed() then
        text_content = ''
    elseif beacon_on == 1 then
        text_color = 'green'
        check_passed_items[11] = true
    else
        text_color = 'red'
        check_passed_items[11] = false
    end

    draw_string(text_start_x, text_start_y + text_delta_y * 11, text_content, text_color)
end

local function check_apu_bleed_on()
    local apu_bleed_on = XPLMGetDatai(data_ref_apu_bleed_on)
    local text_content = 'SET APU BLEED TO ON'
    local text_color = nil

    if all_item_check_passed() then
        text_content = ''
    elseif apu_bleed_on == 1 then
        text_color = 'green'
        check_passed_items[10] = true
    else
        text_color = 'red'
        check_passed_items[10] = false
    end

    draw_string(text_start_x, text_start_y + text_delta_y * 10, text_content, text_color)
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

    local text_content = 'SET ALL FUEL PUMPS ON'
    local text_color = nil

    if all_item_check_passed() then
        text_content = ''
    elseif fuel_left1_pump_on == 1 and fuel_left2_pump_on == 1 and fuel_left_pump_standby == 1 and fuel_right1_pump_on == 1 and fuel_right2_pump_on == 1 and fuel_center_left_pump_on == 1 and fuel_center_right_pump_on == 1 then
        text_color = 'green'
        check_passed_items[9] = true
    else
        text_color = 'red'
        check_passed_items[9] = false
    end

    draw_string(text_start_x, text_start_y + text_delta_y * 9, text_content, text_color)
end

local function check_engine_mode_IGN_START()
    local engine_mode = XPLMGetDatai(data_ref_engine_mode)
    local text_content = 'SET ENGINE MODE TO IGN/START'
    local text_color = nil

    if all_item_check_passed() then
        text_content = ''
    elseif engine_mode == 1 then
        text_color = 'green'
        check_passed_items[8] = true
    else
        text_color = 'red'
        check_passed_items[8] = false
    end

    draw_string(text_start_x, text_start_y + text_delta_y * 8, text_content, text_color)
end

local function check_engines_starting()
    local engines_N3_percent = XPLMGetDatavf(data_ref_engines_N3_percent, 0, 2)
    local text_content = 'SET ENGINE 1 and ENGINE 2 MASTER STARTING'
    local text_color = nil

    if all_item_check_passed() then
        text_content = ''
    elseif engines_N3_percent[0] > 58 and engines_N3_percent[1] > 58 then
        text_color = 'green'
        check_passed_items[7] = true
    else
        text_color = 'red'
        check_passed_items[7] = false
    end

    draw_string(text_start_x, text_start_y + text_delta_y * 7, text_content, text_color)
end

local function check_generators_on_and_bus_tie_auto()
    local generator1_on = XPLMGetDatai(data_ref_generator1_on)
    local generator2_on = XPLMGetDatai(data_ref_generator2_on)
    local bus_tie_auto = XPLMGetDatai(data_ref_bus_tie_auto)

    local text_content = 'SET ENGINE 1 and ENGINE 2 GENERATOR ON and BUS TIE AUTO'
    local text_color = nil

    if all_item_check_passed() then
        text_content = ''
    elseif generator1_on == 1 and generator2_on == 1 and bus_tie_auto == 1 then
        text_color = 'green'
        check_passed_items[6] = true
    else
        text_color = 'red'
        check_passed_items[6] = false
    end

    draw_string(text_start_x, text_start_y + text_delta_y * 6, text_content, text_color)
end

local function check_apu_bleed_off()
    local apu_bleed_on = XPLMGetDatai(data_ref_apu_bleed_on)
    local text_content = 'SET APU BLEED TO OFF'
    local text_color = nil

    if all_item_check_passed() then
        text_content = ''
    elseif apu_bleed_on == 0 then
        text_color = 'green'
        check_passed_items[5] = true
    else
        text_color = 'red'
        check_passed_items[5] = false
    end

    draw_string(text_start_x, text_start_y + text_delta_y * 5, text_content, text_color)
end

local function check_engines_bleed_on()
    local engine_bleed1_on = XPLMGetDatai(data_ref_engine_bleed1_on)
    local engine_bleed2_on = XPLMGetDatai(data_ref_engine_bleed2_on)

    local engine_pack1_on = XPLMGetDatai(data_ref_engine_pack1_on)
    local engine_pack2_on = XPLMGetDatai(data_ref_engine_pack2_on)

    local engine_hot_air1_on = XPLMGetDatai(data_ref_engine_hot_air1_on)
    local engine_hot_air2_on = XPLMGetDatai(data_ref_engine_hot_air2_on)

    local text_content = 'SET ENGINES BLEED and PACK 1/2 and HOT AIR 1/2 ON'
    local text_color = nil

    if all_item_check_passed() then
        text_content = ''
    elseif engine_bleed1_on == 1 and engine_bleed2_on == 1 and engine_pack1_on == 1 and engine_pack2_on == 1 and engine_hot_air1_on == 1 and engine_hot_air2_on == 1 then
        text_color = 'green'
        check_passed_items[4] = true
    else
        text_color = 'red'
        check_passed_items[4] = false
    end

    draw_string(text_start_x, text_start_y + text_delta_y * 4, text_content, text_color)
end

local function check_cargo_valves_isolated_and_hot_air_on()
    local fwd_isol_valve_on = XPLMGetDatai(data_ref_fwd_isol_valve_on)
    local bulk_isol_valve_on = XPLMGetDatai(data_ref_bulk_isol_valve_on)
    local hot_air_on = XPLMGetDatai(data_ref_hot_air_on)

    local text_content = 'SET CARGO ISOL VALVES and HOT AIR ON'
    local text_color = nil

    if all_item_check_passed() then
        text_content = ''
    elseif fwd_isol_valve_on == 1 and bulk_isol_valve_on == 1 and hot_air_on == 1 then
        text_color = 'green'
        check_passed_items[3] = true
    else
        text_color = 'red'
        check_passed_items[3] = false
    end

    draw_string(text_start_x, text_start_y + text_delta_y * 3, text_content, text_color)
end

local function check_apu_generator_and_master_off()
    local apu_master_on = XPLMGetDatai(data_ref_apu_master_on)
    local apu_start_on = XPLMGetDatai(data_ref_apu_start_on)
    local apu_generator_on = XPLMGetDatai(data_ref_apu_generator_on)

    local text_content = 'SET APU MASTER and APU START and APU GENERATOR OFF'
    local text_color = nil

    if all_item_check_passed() then
        text_content = ''
    elseif apu_master_on == 0 and apu_start_on == 0 and apu_generator_on == 0 then
        text_color = 'green'
        check_passed_items[2] = true
    else
        text_color = 'red'
        check_passed_items[2] = false
    end

    draw_string(text_start_x, text_start_y + text_delta_y * 2, text_content, text_color)
end

local function check_engine_mode_normal()
    local engine_mode = XPLMGetDatai(data_ref_engine_mode)
    local text_content = 'SET ENGINE MODE TO NORMAL'
    local text_color = nil

    if all_item_check_passed() then
        text_content = ''
    elseif engine_mode == 0 then
        text_color = 'green'
        check_passed_items[1] = true
    else
        text_color = 'red'
        check_passed_items[1] = false
    end

    draw_string(text_start_x, text_start_y + text_delta_y * 1, text_content, text_color)
end

local function check_transponder_on_and_ta_ra()
    local transponder_auto_on_off = XPLMGetDatai(data_ref_transponder_auto_on_off)
    local transponder_ta_ra = XPLMGetDatai(data_ref_transponder_ta_ra)

    local text_content = 'SET TRANSPONDER ON AND TA/RA'
    local text_color = nil

    if all_item_check_passed() then
        text_content = ''
    elseif transponder_auto_on_off == 1 and transponder_ta_ra == 2 then
        text_color = 'green'
        check_passed_items[0] = true
    else
        text_color = 'red'
        check_passed_items[0] = false
    end

    draw_string(text_start_x, text_start_y + text_delta_y * 0, text_content, text_color)
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

local show_pre_flight_checklist = false

function pre_flight_checklist_toggle()
    show_pre_flight_checklist = not show_pre_flight_checklist

    if show_pre_flight_checklist then
        XPLMSpeakString('Pre-flight Checklist Started')
        for i = 0, total_item_count_to_be_checked, 1 do
            check_passed_items[i] = false
        end
    else
        XPLMSpeakString('Pre-flight Checklist Cancelled')
        for i = 0, total_item_count_to_be_checked, 1 do
            check_passed_items[i] = true
        end
    end

    do_every_draw('check_pre_flight_items()')

    if all_item_check_passed() then
        XPLMSpeakString('Pre-flight Checklist Finished')
    end
end

create_command('FlyWithLua/Airbus_A330_Checklist/Pre-flight', 'Show Airbus A330 Pre-flight Checklist', 'pre_flight_checklist_toggle()', '', '')

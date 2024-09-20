------------------------------------------------- Data Refs ---------------------------------------
local beacon_on_switch = XPLMFindDataRef('sim/cockpit2/switches/beacon_on')

local apu_bleed_switch = XPLMFindDataRef('laminar/A333/buttons/apu_bleed_pos')

local fuel_left1_pump_switch = XPLMFindDataRef('laminar/A333/fuel/buttons/left1_pump_pos')
local fuel_left2_pump_switch = XPLMFindDataRef('laminar/A333/fuel/buttons/left2_pump_pos')
local fuel_left_pump_standby_switch = XPLMFindDataRef('laminar/A333/fuel/buttons/left_stby_pump_pos')
local fuel_right1_pump_switch = XPLMFindDataRef('laminar/A333/fuel/buttons/right1_pump_pos')
local fuel_right2_pump_switch = XPLMFindDataRef('laminar/A333/fuel/buttons/right2_pump_pos')
local fuel_right_pump_standby_switch = XPLMFindDataRef('laminar/A333/fuel/buttons/right_stby_pump_pos')
local fuel_center_left_pump_switch = XPLMFindDataRef('laminar/A333/fuel/buttons/center_left_pump_pos')
local fuel_center_right_pump_switch = XPLMFindDataRef('laminar/A333/fuel/buttons/center_right_pump_pos')

local engine_mode = XPLMFindDataRef('sim/cockpit2/engine/actuators/eng_mode_selector')
local engine_N3_percent = XPLMFindDataRef('sim/cockpit2/engine/indicators/N2_percent')

local generator1_switch = XPLMFindDataRef('laminar/A333/buttons/gen1_pos')
local generator2_switch = XPLMFindDataRef('laminar/A333/buttons/gen2_pos')
local bus_tie_switch = XPLMFindDataRef('laminar/A333/buttons/bus_tie_pos')

local engine_bleed1_switch = XPLMFindDataRef('laminar/A333/buttons/eng_bleed_1_pos')
local engine_bleed2_switch = XPLMFindDataRef('laminar/A333/buttons/eng_bleed_2_pos')
local engine_pack1_switch = XPLMFindDataRef('laminar/A333/buttons/pack_1_pos')
local engine_pack2_switch = XPLMFindDataRef('laminar/A333/buttons/pack_2_pos')
local engine_hot_air1_switch = XPLMFindDataRef('laminar/A333/buttons/hot_air1_pos')
local engine_hot_air2_switch = XPLMFindDataRef('laminar/A333/buttons/hot_air2_pos')

local cargo_fwd_isol_valve_switch = XPLMFindDataRef('laminar/A333/buttons/cargo_cond/fwd_isol_valve_pos')
local cargo_bulk_isol_valve_switch = XPLMFindDataRef('laminar/A333/buttons/cargo_cond/bulk_isol_valve_pos')
local cargo_hot_air_switch = XPLMFindDataRef('laminar/A333/buttons/cargo_cond/hot_air_pos')

local apu_master_switch = XPLMFindDataRef('laminar/A333/buttons/APU_master')
local apu_starter_switch = XPLMFindDataRef('sim/cockpit2/electrical/APU_starter_switch')
local apu_generator_on = XPLMFindDataRef('sim/cockpit2/electrical/APU_generator_on')

local transponder_auto_on_off_knob = XPLMFindDataRef('laminar/A333/transponder/auto_on_knob_pos')
local transponder_ta_ra_knob = XPLMFindDataRef('laminar/A333/transponder/ta_ra_knob_pos')

local true_airspeed_knots = XPLMFindDataRef('sim/cockpit2/gauges/indicators/true_airspeed_kts_pilot')

------------------------------------------------- checklist ---------------------------------------

local checklist = {{
  name = 'BEACON',
  value = 'ON',
  completed = function()
    return XPLMGetDatai(beacon_on_switch) == 1
  end
}, {
  name = 'APU BLEED',
  value = 'ON',
  completed = function()
    return XPLMGetDatai(apu_bleed_switch) == 1
  end
}, {
  name = 'ALL FUEL PUMPS',
  value = 'ON',
  completed = function()
    local fuel_left1_pump_switch = XPLMGetDatai(fuel_left1_pump_switch)
    local fuel_left2_pump_switch = XPLMGetDatai(fuel_left2_pump_switch)
    local fuel_left_pump_standby_switch = XPLMGetDatai(fuel_left_pump_standby_switch)
    local all_left_fuel_pumps_on = fuel_left1_pump_switch == 1 and fuel_left2_pump_switch == 1 and fuel_left_pump_standby_switch == 1

    local fuel_right1_pump_switch = XPLMGetDatai(fuel_right1_pump_switch)
    local fuel_right2_pump_switch = XPLMGetDatai(fuel_right2_pump_switch)
    local fuel_right_pump_standby_switch = XPLMGetDatai(fuel_right_pump_standby_switch)
    local all_right_fuel_pumps_on = fuel_right1_pump_switch == 1 and fuel_right2_pump_switch == 1 and fuel_right_pump_standby_switch == 1

    local fuel_center_left_pump_switch = XPLMGetDatai(fuel_center_left_pump_switch)
    local fuel_center_right_pump_switch = XPLMGetDatai(fuel_center_right_pump_switch)
    local all_center_fuel_pumps_on = fuel_center_left_pump_switch == 1 and fuel_center_right_pump_switch == 1

    return all_left_fuel_pumps_on and all_right_fuel_pumps_on and all_center_fuel_pumps_on
  end
}, {
  name = 'ENGINE MODE',
  value = 'IGN/START',
  completed = function()
    return XPLMGetDatai(engine_mode) == 1
  end
}, {
  name = 'ENGINE 1 MASTER',
  value = 'ON & N3 > 60%',
  completed = function()
    return XPLMGetDatavf(engine_N3_percent, 0, 2)[0] > 60
  end
}, {
  name = 'ENGINE 2 MASTER',
  value = 'ON & N3 > 60%',
  completed = function()
    return XPLMGetDatavf(engine_N3_percent, 0, 2)[1] > 60
  end
}, {
  name = 'GENERATOR 1 & GENERATOR 2',
  value = 'ON',
  completed = function()
    local generator1_switch = XPLMGetDatai(generator1_switch)
    local generator2_switch = XPLMGetDatai(generator2_switch)
    return generator1_switch == 1 and generator2_switch == 1
  end
}, {
  name = 'BUS TIE',
  value = 'AUTO',
  completed = function()
    return XPLMGetDatai(bus_tie_switch) == 1
  end
}, {
  name = 'APU BLEED',
  value = 'OFF',
  completed = function()
    return XPLMGetDatai(apu_bleed_switch) == 0
  end
}, {
  name = 'ENGINES BLEED & PACK 1/2 & HOT AIR 1/2',
  value = 'ON',
  completed = function()
    local engine_bleed1_switch = XPLMGetDatai(engine_bleed1_switch)
    local engine_bleed2_switch = XPLMGetDatai(engine_bleed2_switch)
    local engine_bleed_on = engine_bleed1_switch == 1 and engine_bleed2_switch == 1

    local engine_pack1_switch = XPLMGetDatai(engine_pack1_switch)
    local engine_pack2_switch = XPLMGetDatai(engine_pack2_switch)
    local engine_pack_on = engine_pack1_switch == 1 and engine_pack2_switch == 1

    local engine_hot_air1_switch = XPLMGetDatai(engine_hot_air1_switch)
    local engine_hot_air2_switch = XPLMGetDatai(engine_hot_air2_switch)
    local engine_hot_air_on = engine_hot_air1_switch == 1 and engine_hot_air2_switch == 1

    return engine_bleed_on and engine_pack_on and engine_hot_air_on
  end
}, {
  name = 'CARGO ISOL VALVES & HOT AIR',
  value = 'ON',
  completed = function()
    local cargo_fwd_isol_valve_switch = XPLMGetDatai(cargo_fwd_isol_valve_switch)
    local cargo_bulk_isol_valve_switch = XPLMGetDatai(cargo_bulk_isol_valve_switch)
    local cargo_hot_air_switch = XPLMGetDatai(cargo_hot_air_switch)
    return cargo_fwd_isol_valve_switch == 1 and cargo_bulk_isol_valve_switch == 1 and cargo_hot_air_switch == 1
  end
}, {
  name = 'APU MASTER & APU START & APU GENERATOR',
  value = 'OFF',
  completed = function()
    local apu_master_switch = XPLMGetDatai(apu_master_switch)
    local apu_starter_switch = XPLMGetDatai(apu_starter_switch)
    local apu_generator_on = XPLMGetDatai(apu_generator_on)
    return apu_master_switch == 1 and apu_starter_switch == 1 and apu_generator_on == 1
  end
}, {
  name = 'ENGINE MODE',
  value = 'NORMAL',
  completed = function()
    return XPLMGetDatai(engine_mode) == 0
  end
}, {
  name = 'TRANSPONDER',
  value = 'ON AND TA/RA',
  completed = function()
    local transponder_auto_on_off_knob = XPLMGetDatai(transponder_auto_on_off_knob)
    local transponder_ta_ra_knob = XPLMGetDatai(transponder_ta_ra_knob)
    return transponder_auto_on_off_knob == 1 and transponder_ta_ra_knob == 2
  end
}}

------------------------------------------------- command -----------------------------------------

local text_start_x = 20
local text_start_y = 20 * 31 -- Pre-boarding checklist has 31 items
local text_delta_y = 20

local pre_flight_checklist_start_line = '---------------------- PRE-FLIGHT CHECKLIST START ------------------------'
local pre_flight_checklist_ended_line = '---------------------- PRE-FLIGHT CHECKLIST ENDED ------------------------'

function check_pre_flight_item()
  draw_string(text_start_x, text_start_y, pre_flight_checklist_start_line, 'yellow')

  for index, item in ipairs(checklist) do
    local text_content = string.format('SET %s TO %s', item.name, item.value)
    local text_color = item.completed() and 'green' or 'red'
    draw_string(text_start_x, text_start_y + text_delta_y * index, text_content, text_color)
  end

  draw_string(text_start_x, text_start_y + text_delta_y * (#checklist + 1), pre_flight_checklist_ended_line, 'yellow')

  if XPLMGetDataf(true_airspeed_knots) > 100 then
    XPLMSpeakString('Pre-flight Checklist Finished')
    for index, item in ipairs(checklist) do
      draw_string(text_start_x, text_start_y + text_delta_y * index, nil, nil)
    end
  end
end

function show_pre_flight_checklist()
  do_every_draw('check_pre_flight_item()')
end

add_macro('Show Airbus-A330 Pre-flight Checklist', 'show_pre_flight_checklist()')

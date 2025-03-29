wait until addons:far:available.

local tgt_throttle is 1.
lock throttle to tgt_throttle.
lock steering to heading(90, max(0, 90 - (sqrt(altitude / 1000) * 10)), 0).

local q_pid is pidloop(1, 0, 0, 0, 1).
set q_pid:setpoint to 20.

until false {
    local twr is ship:availablethrust / (ship:mass * body:mu / (body:radius ^ 2)).
    local q is addons:far:dynpres.

    local max_throt is 2 / twr.
    local min_throt is 1 / twr.

    print round(q, 3) + "   " at (0, 0).
    // local q_throt is q_pid:update(time:seconds, q).
}
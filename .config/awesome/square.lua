local pairs = pairs
local setmetatable = setmetatable
-- local base = require("wibox.widget.base")
local wibox = require("wibox")
local gcolor = require("gears.color")
local cairo = require("lgi").cairo
local gtable = require("gears.table")

local square = { mt = {} }

function square:draw(context, cr, width, height)
    if self._private.color then
        cr:set_source(self._private.color)
        cr:rectangle(0, 0, width, height)
        cr:fill()
    end
end

function square:layout(context, width, height)
    if self._private.widget then
        local size = math.min(width, height)
        return { wibox.widget.base.place_widget_at(self._private.widget, 0, 0, size, size) }
    end
end

function square:fit(context, width, height)
    local size = math.min(width, height)
    return size, size
    -- w, h = wibox.widget.base.fit_widget(self, context, self._private.widget, width, height)
end

-- function square:set_size(size)
    -- self._private.size = size
    -- self:emit_signal("widget::layout_changed")
    -- self:emit_signal("property::size", size)
-- end
-- 
-- function square:get_size()
    -- return self._private.size
-- end

function square:set_color(color)
    self._private.color = color and gcolor(color)
    self:emit_signal("widget::redraw_needed")
    self:emit_signal("property::color", color)
end

function square:get_color()
    return self._private.color
end

--- The widget to be wrapped
--
-- @property widget
-- @tparam widget widget The widget
-- @interface container

function square:set_widget(widget)
    if widget then
        wibox.widget.base.check_widget(widget)
    end
    self._private.widget = widget
    self:emit_signal("widget::layout_changed")
end

function square:get_widget()
    return self._private.widget
end

-- Get the number of children element
-- @treturn table The children
function square:get_children()
    return self._private.widget
end

function square:set_children(children)
    self:set_widget(children[1])
end

function square:reset()
    self:set_widget(nil)
    self:set_color(nil)
end

--- Returns new square container
-- 
-- @param[opt] widget  A widget to use
-- @param[opt] color   Container color
local function new(widget, color)
    local ret = wibox.widget.base.make_widget(nil, nil, {enable_properties = true})
    gtable.crush(ret, square, true)

    ret:set_color(color)

    if widget then
        ret:set_widget(widget)
    end
-- 
    return ret
end

function square.mt:__call(...)
    return new(...)
end

--@DOC_widget_COMMON@

--@DOC_object_COMMON@

return setmetatable(square, square.mt)


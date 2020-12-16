local obj={}
obj.__index = obj

-- Metadata
obj.name = 'RightLayout'
obj.version = '0.1'
obj.author = 'Eugene Bravov <eugene.bravov@gmail.com>'
obj.homepage = 'https://github.com/fullpipe/RightLayout.spoon'
obj.license = 'MIT - https://opensource.org/licenses/MIT'

function obj:init()
    self.preferedLayouts = {}
    self.beforeLayout = hs.keycodes.currentLayout()
    self.restoreLastLayout = false

    self.appWatcher = hs.application.watcher.new(
        function (appName, eventType, appObject)
            if (eventType == hs.application.watcher.activated) then
                if (self.preferedLayouts[appName]) then
                    self.beforeLayout = hs.keycodes.currentLayout()
                    hs.keycodes.setLayout(self.preferedLayouts[appName])
                    self.restoreLastLayout = false
                end
            end

            if (eventType == hs.application.watcher.deactivated) then
                if (self.preferedLayouts[appName] and self.restoreLastLayout) then
                    hs.keycodes.setLayout(self.beforeLayout)
                end
            end
        end
    )

    return self
end

--- RightLayout:stop()
--- Method
--- Add prefered app layout
function obj:add(appName, layout)
    self.preferedLayouts[appName] = layout

    return self
end

--- RightLayout:start()
--- Method
--- Starts handling app switches
function obj:start()
    self.appWatcher:start()
end

--- RightLayout:stop()
--- Method
--- Stops handling app switches
function obj:stop()
    self.appWatcher:stop()

    self.preferedLayouts = {}
    self.beforeLayout = hs.keycodes.currentLayout()
    self.restoreLastLayout = false
end

return obj

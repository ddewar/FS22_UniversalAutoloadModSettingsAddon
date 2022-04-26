UniversalAutoloadModSettingsAddonManager = {}
UniversalAutoloadModSettingsAddonManager.path = g_currentModDirectory
UniversalAutoloadModSettingsAddonManager.userModSettingsPath = "modSettings/UniversalAutoload.xml"

addModEventListener(UniversalAutoloadModSettingsAddonManager)

function UniversalAutoloadModSettingsAddonManager:loadMap(name)
    if g_modIsLoaded["FS22_UniversalAutoload"] then
        UniversalAutoloadModSettingsAddonManager.userModSettingsExists = fileExists(getUserProfileAppPath()..UniversalAutoloadModSettingsAddonManager.userModSettingsPath)
        if UniversalAutoloadModSettingsAddonManager.userModSettingsExists then
            print("  USER MODSETTING VEHICLES:")
            local userModSettingsFile = Utils.getFilename(UniversalAutoloadModSettingsAddonManager.userModSettingsPath, getUserProfileAppPath())
            FS22_UniversalAutoload.UniversalAutoload.ImportVehicleConfigurations(userModSettingsFile)
        else
            print("Creating Universal Autoload modSettings user settings file.")
            copyFile(Utils.getFilename("config/UniversalAutoload.xml", UniversalAutoloadModSettingsAddonManager.path), Utils.getFilename(UniversalAutoloadModSettingsAddonManager.userModSettingsPath, getUserProfileAppPath()), false);
        end
    else
        print("FS22_UniversalAutoload is required for FS22_UniversalAutoloadModSettingsAddon")
	end
end

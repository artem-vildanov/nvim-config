---@diagnostic disable: cast-local-type
return {
  get_os_name = function()
    local os_name = ""

    os_name = os.getenv("OS")
    if os_name then
        if string.find(os_name, "Windows") then
            return "Windows"
        end
    end

    os_name = os.getenv("HOME")
    if os_name then
        return "Unix"
    end

    return "Unknown"
  end
}

function menu {
    try {
        # Define the URL where submenus might be located
        $url = "https://raw.githubusercontent.com/badsyntaxx/chased-scripts/main"
        $subPath = "framework"

        write-text -Type "header" -Text "MENU" -LineBefore

        # Display a label for the menu options
        write-text -Type "label" -Text "Select a function" -LineBefore
        # Create an ordered hashtable containing menu options and descriptions
        $choice = get-option -Options $([ordered]@{
                "Enable administrator" = "Toggle the Windows built in administrator account."
                "Add user"             = "Add a user to the system."
                "Remove user"          = "Remove a user from the system."
                "Edit user"            = "Edit a users."
                "Edit hostname"        = "Edit this computers name and description."
                "Edit network adapter" = "Edit a network adapter.(BETA)"
                "Get WiFi credentials" = "View all saved WiFi credentials on the system."
            })

        # Map user selection to corresponding commands
        if ($choice -eq 0) { $command = "enable admin" }
        if ($choice -eq 1) { $command = "add user" }
        if ($choice -eq 2) { $command = "remove user" }
        if ($choice -eq 3) { $command = "edit user" }
        if ($choice -eq 4) { $command = "edit hostname" }
        if ($choice -eq 5) { $command = "edit net adapter" }
        if ($choice -eq 6) { $command = "get wifi creds" }

        get-cscommand -command $command
    } catch {
        exit-script -Type "error" -Text "Menu error: $($_.Exception.Message) $url/$subPath/$dependency.ps1" 
    }
}


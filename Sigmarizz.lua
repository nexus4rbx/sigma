function findBed()
    local chosenbed = nil
    for i,v in pairs(game.Workspace:GetChildren()) do
        if v.Name == "bed" then
            if v.Bed.BrickColor ~= game.Players.LocalPlayer.Team.TeamColor then
                if chosenbed == nil then
                    chosenbed = v
                else
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude < (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - chosenbed.Position).Magnitude then
                        chosenbed = v
                    end
                end
            end
        end
    end

    return chosenbed
end

function bedTP()
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
    repeat task.wait() until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    local bed = findBed()
    if bed ~= nil then
        game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(0.96, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {CFrame = bed.CFrame + Vector3.new(0, 8, 0)}):Play()
    end
end

bedTP()

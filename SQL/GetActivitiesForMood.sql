SELECT act.Id, act.Name, act.Cost, act.City, act.State, act.Zip, act.LocationType, act.PopularityIndex, act.Description, act.VenueName
FROM Activity_has_Mood has, Activity act, Mood mood
WHERE has.Activity_Id = act.Id and has.Mood_Id = 6
GROUP BY has.Activity_Id
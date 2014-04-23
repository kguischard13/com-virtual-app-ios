USE appdoodah; 

SELECT DISTINCT has.User_Id, has.DateCompleted, user.FirstName, user.LastName, act.Name
FROM User_has_Activity has, User user, Activity act
WHERE has.Activity_Id = act.Id and has.User_Id = 2
GROUP BY act.Id

USE ManufacturingQC;

SELECT 
    m.MachineName,
    SUM(d.DefectCount) AS TotalDefects,
    SUM(p.UnitsProduced) AS TotalUnits,
    ROUND(SUM(d.DefectCount) * 100.0 / SUM(p.UnitsProduced), 2) AS DefectRatePct
FROM Machines m
JOIN ProductionRuns p ON m.MachineID = p.MachineID
JOIN Defects d ON p.RunID = d.RunID
GROUP BY m.MachineName
ORDER BY DefectRatePct DESC;
USE ManufacturingQC;

SELECT 
    s.ShiftName,
    SUM(d.DefectCount) AS TotalDefects,
    SUM(p.UnitsProduced) AS TotalUnits,
    ROUND(SUM(d.DefectCount) * 100.0 / SUM(p.UnitsProduced), 2) AS DefectRatePct
FROM Shifts s
JOIN ProductionRuns p ON s.ShiftID = p.ShiftID
JOIN Defects d ON p.RunID = d.RunID
GROUP BY s.ShiftName
ORDER BY DefectRatePct DESC;
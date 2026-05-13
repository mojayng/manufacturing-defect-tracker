USE ManufacturingQC;

SELECT 
    MONTH(p.RunDate) AS MonthNum,
    DATENAME(MONTH, p.RunDate) AS MonthName,
    SUM(d.DefectCount) AS TotalDefects,
    SUM(p.UnitsProduced) AS TotalUnits,
    ROUND(SUM(d.DefectCount) * 100.0 / SUM(p.UnitsProduced), 2) AS DefectRatePct
FROM ProductionRuns p
JOIN Defects d ON p.RunID = d.RunID
GROUP BY MONTH(p.RunDate), DATENAME(MONTH, p.RunDate)
ORDER BY MonthNum;
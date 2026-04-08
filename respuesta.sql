SELECT p.ProductName
FROM
    Products p
    JOIN `Order Details` od ON p.ProductID = od.ProductID
    JOIN Orders o ON od.OrderID = o.OrderID
GROUP BY
    p.ProductID,
    p.ProductName
HAVING
    COUNT(DISTINCT o.EmployeeID) = (
        SELECT COUNT(EmployeeID)
        FROM Employees
    );

SELECT DISTINCT
    c.CompanyName
FROM Customers c
WHERE
    c.CustomerID NOT IN(
        SELECT DISTINCT
            o.CustomerID
        FROM
            Orders o
            JOIN OrderDetails od ON o.OrderID = od.OrderID
            JOIN Products p ON od.ProductID = p.ProductID
        WHERE
            p.UnitPrice >= 50
    );

SELECT DISTINCT
    e.Title,
    e.FirstName,
    e.LastName
FROM
    Employees e
    JOIN Orders o ON e.EmployeeID = o.EmployeeID
    JOIN OrderDetails od ON o.OrderID = od.OrderID
    JOIN Products p ON od.ProductID = p.ProductID
WHERE
    p.ProductName IN (
        'Gravad Lax',
        'Mishi Kobe Niku'
    );

SELECT DISTINCT
    CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName,
    c.CompanyName AS CustomerName
FROM
    Orders o
    JOIN Employees e ON o.EmployeeID = e.EmployeeID
    JOIN Customers c ON o.CustomerID = c.CustomerID
    JOIN Shippers s ON o.ShipVia = s.ShipperID
WHERE
    s.CompanyName = 'Speedy Express'
    AND c.City = 'Bruxelles';

SELECT DISTINCT
    CONCAT(e.FirstName, ' ', e.LastName) AS Name,
    e.Address,
    e.City,
    e.Region
FROM Employees e
    JOIN Orders o ON e.EmployeeID = o.EmployeeID
WHERE
    o.ShipCountry = 'Belgium';
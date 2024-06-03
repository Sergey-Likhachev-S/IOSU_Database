--Получите   список   всех  PurchaseOrderDetailID,   у   которых
--UnitPrice выше UnitPrice c PurchaseOrderID = 73
SELECT 
	"PurchaseOrderDetailID" ,
	"UnitPrice" 
FROM "Purchasing"."PurchaseOrderDetail" pod 
WHERE  "UnitPrice" > (SELECT "UnitPrice" 
					  FROM "Purchasing"."PurchaseOrderDetail" pod2
					  WHERE pod2."PurchaseOrderID" = 73)
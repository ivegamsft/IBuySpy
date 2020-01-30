

CREATE Procedure CMRC_ShoppingCartAddItem
(
    @CartID nvarchar(50),
    @ProductID int,
    @Quantity int
)
As

DECLARE @CountItems int

SELECT
    @CountItems = Count(ProductID)
FROM
    CMRC_ShoppingCart
WHERE
    ProductID = @ProductID
  AND
    CartID = @CartID

IF @CountItems > 0  /* There are items - update the current quantity */

    UPDATE
        CMRC_ShoppingCart
    SET
        Quantity = (@Quantity + CMRC_ShoppingCart.Quantity)
    WHERE
        ProductID = @ProductID
      AND
        CartID = @CartID

ELSE  /* New entry for this Cart.  Add a new record */

    INSERT INTO CMRC_ShoppingCart
    (
        CartID,
        Quantity,
        ProductID
    )
    VALUES
    (
        @CartID,
        @Quantity,
        @ProductID
    )
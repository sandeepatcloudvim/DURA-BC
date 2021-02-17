query 50000 "Item Lot-Bin Info Query"
{
    Caption = 'Item Lot-Bin Info';
    OrderBy = Ascending(Item_No);

    elements
    {
        dataitem(Warehouse_Entry; "Warehouse Entry")
        {
            column(Item_No; "Item No.")
            {
            }
            column(Location_Code; "Location Code")
            {
            }
            column(Bin_Code; "Bin Code")
            {
            }
            column(Lot_No; "Lot No.")
            {
                ColumnFilter = Lot_No = FILTER(<> '');
            }
            column(Sum_Qty_Base; "Qty. (Base)")
            {
                ColumnFilter = Sum_Qty_Base = FILTER(<> 0);
                Method = Sum;
            }
        }
    }
}


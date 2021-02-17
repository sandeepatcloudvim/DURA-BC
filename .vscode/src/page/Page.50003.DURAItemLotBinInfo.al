page 50003 "Item Lot-Bin Info"
{
    Caption = 'Item Lot-Bin Info';
    Editable = false;
    PageType = List;
    SourceTable = "Item Lot-Bin Info";

    layout
    {
        area(content)
        {
            repeater(Control7)
            {
                ShowCaption = false;
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = Warehouse;
                    ToolTip = 'Specifies the item that exists as lot numbers in the bin.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Warehouse;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Warehouse;
                }
                field("Bin Code"; Rec."Bin Code")
                {
                    ApplicationArea = Warehouse;
                    ToolTip = 'Specifies the bin where the lot number exists.';
                }
                field("Lot No."; Rec."Lot No.")
                {
                    ApplicationArea = Warehouse;
                    ToolTip = 'Specifies the lot number that exists in the bin.';
                }
                field("Qty. (Base)"; Rec."Qty. (Base)")
                {
                    ApplicationArea = Warehouse;
                    Caption = 'Quantity On Hand';
                    ToolTip = 'Specifies how many items with the lot number exist in the bin.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
        }
    }

    trigger OnOpenPage()
    begin
        Rec.FillTempTable;

    end;

    var
        Days: Integer;
        Warning: Boolean;
        StyleText: Text[20];
}


table 50003 "Item Lot-Bin Info"
{
    Caption = 'Item Lot-Bin Info';

    fields
    {
        field(1; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item."No.";
        }
        field(2; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
        }
        field(3; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
        }
        field(4; "Zone Code"; Code[10])
        {
            Caption = 'Zone Code';
        }
        field(5; "Bin Code"; Code[20])
        {
            Caption = 'Bin Code';
        }
        field(6; "Lot No."; Code[20])
        {
            Caption = 'Lot No.';
        }
        field(7; "Qty. (Base)"; Decimal)
        {
            Caption = 'Qty. (Base)';
            DecimalPlaces = 0 : 5;
        }
        field(8; Quantity; Decimal)
        {
        }
        field(9; Description; Text[100])
        {
        }
        field(10; "Expiration Date"; Date)
        {
        }
        field(11; "Warranty Date"; Date)
        {
        }
        field(12; "Qty Available"; Decimal)
        {
        }
        field(13; "Unit Cost"; Decimal)
        {
        }
        field(14; "Unit Price"; Decimal)
        {
        }
        field(15; "Pack Size"; Code[10])
        {
        }
        field(16; "Description 2"; Text[100])
        {
        }
        field(17; Manufacturer; Text[50])
        {
        }
        field(18; "Item Category Code"; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Item No.", "Location Code", "Bin Code", "Lot No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ItemFilter: Text;
        ExpirationDate: Date;
        WarrantryDate: Date;
        ShowDialog: Dialog;
        ExpiredQty: Decimal;
        QtyAval: Decimal;


    procedure GetExpirationDate(ItemLot: Query "Item Lot-Bin Info Query")
    var
        WarehouseEntry: Record "Warehouse Entry";
    begin
        ExpirationDate := 0D;
        WarrantryDate := 0D;
        WarehouseEntry.Reset;
        WarehouseEntry.SetRange("Item No.", ItemLot.Item_No);
        WarehouseEntry.SetRange("Location Code", ItemLot.Location_Code);
        WarehouseEntry.SetRange("Bin Code", ItemLot.Bin_Code);
        WarehouseEntry.SetRange("Lot No.", ItemLot.Lot_No);
        if WarehouseEntry.FindFirst then begin
            ExpirationDate := WarehouseEntry."Expiration Date";
            WarrantryDate := WarehouseEntry."Warranty Date";
        end;
    end;

    procedure FillTempTable()
    var
        LotNosByBinCode: Query "Item Lot-Bin Info Query";
        Itemrec: Record Item;
        ItemLitWiseStatus: Record "Item Lot-Bin Info";
    begin
        DeleteAll;
        if ItemFilter <> '' then
            LotNosByBinCode.SetFilter(LotNosByBinCode.Item_No, ItemFilter);
        ShowDialog.Open('Processing data ..');
        LotNosByBinCode.Open;
        while LotNosByBinCode.Read do begin
            ItemLitWiseStatus.Init;
            ItemLitWiseStatus."Item No." := LotNosByBinCode.Item_No;
            ItemLitWiseStatus."Location Code" := LotNosByBinCode.Location_Code;
            ItemLitWiseStatus."Bin Code" := LotNosByBinCode.Bin_Code;
            ItemLitWiseStatus."Lot No." := LotNosByBinCode.Lot_No;
            ItemLitWiseStatus."Qty. (Base)" := LotNosByBinCode.Sum_Qty_Base;

            if Itemrec.Get(LotNosByBinCode.Item_No) then begin
                GetExpirationDate(LotNosByBinCode);
                ItemLitWiseStatus."Expiration Date" := ExpirationDate;
                ItemLitWiseStatus."Warranty Date" := WarrantryDate;
                ItemLitWiseStatus.Description := Itemrec.Description;
                ItemLitWiseStatus."Unit Cost" := Itemrec."Unit Cost";
                ItemLitWiseStatus."Unit Price" := Itemrec."Unit Price";
            end;
            if ItemLitWiseStatus.Insert then;

        end;
        ShowDialog.Close;
    end;
}


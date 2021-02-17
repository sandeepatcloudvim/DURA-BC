table 50002 "Color"
{
    DataClassification = ToBeClassified;
    Caption = 'Color';
    DataCaptionFields = Description, CodeId;
    DrillDownPageID = "Color List";

    fields
    {
        field(1; Description; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(2; CodeId; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Code';
        }
    }

    keys
    {
        key(PK; Description)
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; Description, CodeId)
        {

        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}
table 50001 "Film Structure"
{
    DataClassification = ToBeClassified;
    Caption = 'Film Structure';
    DataCaptionFields = Description, CodeId;
    DrillDownPageID = "Film Structure List";

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
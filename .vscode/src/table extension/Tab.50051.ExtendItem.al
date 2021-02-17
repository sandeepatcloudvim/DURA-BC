tableextension 50051 Extend_Item_27 extends Item
{
    fields
    {
        field(50000; "Bag Style"; Text[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bag Style";
        }
        field(50001; "Film Structure"; Text[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Film Structure";
        }
        field(50002; "Color"; Text[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Color;
        }
        field(50003; "Gusset Style"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",DOY,"K-Seal","Side Gusset Quad","Side Gusset Center FIN","Side Gusset Side FIN","Quad Seal Block Bottom";
            OptionCaption = ' ,DOY,K-Seal,Side Gusset Quad,Side Gusset Center FIN,Side Gusset Side FIN,Quad Seal Block Bottom';

        }
        field(50004; "Barrier Level"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Poor,Fair,Good,"Very Good",Excellent;
            OptionCaption = 'Poor,Fair,Good,Very Good,Excellent';
        }
        field(50005; Zipper; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Press-To-Close","Slider","Velcro","Pocket","CR","Magnetic";
            OptionCaption = ' ,Press-To-Close,Slider,Velcro,Pocket,CR,Magnetic';
        }
        field(50006; "Hang Hole"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Round","Euro","Delta";
            OptionCaption = ' ,Round,Euro,Delta';
        }
        field(50007; Window; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Full","Round","Oval","Rectangle","Banner","Custom Shape";
            OptionCaption = ' ,Full,Round,Oval,Rectangle,Banner,Custom Shape';
        }
        field(50008; "Fill Style"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Top","Bottom","Spout";
            OptionCaption = 'Top,Bottom,Spout';
        }
        field(50009; "Bag Width"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50010; "Bag Length"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50011; "Bag Gusset"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50012; "Bag Volume"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50013; "Bag Weight"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50014; "Bag Thickness"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50015; "Bag Tear Noth"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Bag Tear Notch';
            ObsoleteState = Removed;
            ObsoleteReason = 'Data Type changed from Decimal to Boolean';
        }
        field(50016; "Bag Tear Notch"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Bag Tear Notch';
        }
    }

    var
        myInt: Integer;

    procedure AssignItemNo(ItemNo: Code[20])
    var
        ItemValue: Integer;
        recItem: Record Item;
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        if recItem.get(ItemNo) then begin
            if (recItem."Bag Style" <> '') AND (recItem."Film Structure" <> '') AND (recItem.Color <> '') then begin
                recItem.rename(BagStyleCode(recItem."Bag Style") + FilmStructureCode(recItem."Film Structure") + '-' + (NoSeriesMgt.GetNextNo('DURA ITEM', WorkDate, true)) + '-' + ColorCode(recItem.Color))
            end else begin
                Error('Bag Style, Film Structure, Color fields should not be blank');
            end;
        end;
    end;

    local procedure BagStyleCode(Description: Text[50]): Code[20]
    var
        recBagStyleCode: Record "Bag Style";
    begin
        if recBagStyleCode.Get(Description) then
            exit(recBagStyleCode.CodeId);
    end;

    local procedure FilmStructureCode(Description: Text[50]): Code[20]
    var
        recFilmStructureCode: Record "Film Structure";
    begin
        if recFilmStructureCode.Get(Description) then
            exit(recFilmStructureCode.CodeId);
    end;

    local procedure ColorCode(Description: Text[50]): Code[20]
    var
        recColorCode: Record Color;
    begin
        if recColorCode.Get(Description) then
            exit(recColorCode.CodeId);
    end;

}